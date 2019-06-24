#include <errno.h>
#include <string.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <unistd.h>
#include <netinet/in.h>
#include <netinet/sctp.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <sys/mman.h>

void *shm;
int SCTP_PORT = 63322;

void *mm(size_t s) {
	int protection = PROT_READ|PROT_WRITE;
	int visibility = MAP_ANONYMOUS | MAP_SHARED;
	return mmap(NULL, s, protection, visibility, -1, 0);
}

void child_process (int i) {
	int client_sock, ret;
	char buffer[100];
	struct sockaddr_in server_addr;

	sleep (2);
	sprintf (buffer, "buffer sent from child %d", i);
	client_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_SCTP);

	server_addr.sin_family = AF_INET;
	server_addr.sin_addr.s_addr = inet_addr ("127.0.0.1");
	server_addr.sin_port = htons (SCTP_PORT);

	ret = connect(client_sock, (struct sockaddr *)&server_addr, sizeof(server_addr));
	
	printf("send=%s\n", buffer);
	ret = write(client_sock, buffer, sizeof(buffer));
	close(client_sock);
	
	if (i == 5) {
		int invalid = 10;
		printf("%p burn server_sock=%d\n", shm, *((int *)shm));
		close(*((int *)shm));
		memcpy(shm, &invalid, sizeof (int));
	}
}

int main() {
	int child = 5, loop= 5;
	int server_sock = 0, conn_sock = 0, in = 0;
	int ret = 0;
	struct sockaddr_in server_addr;
	struct sctp_initmsg init_msg;
	shm = mm(sizeof(int));

	for (;child > 0; child--) {
		if(fork() == 0) {
			child_process(child);
			exit(0);
		}
	}
	if ((server_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_SCTP)) == -1 ) {
		printf("failure server socker %d \n ", errno);
		goto err;
	}
	memcpy(shm, &server_sock, sizeof(int));
	printf("(%p %d) server_sock =%d pid=%d\n", shm, *((int*)shm), server_sock, getpid());
	server_addr.sin_family = AF_INET;
	server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
	server_addr.sin_port = htons(SCTP_PORT);

	if ((ret = bind(server_sock,(struct sockaddr *)&server_addr, sizeof(server_addr))) == -1 ) {
		printf("failure bind server socker %d \n ", errno);
		goto err;
	}

	/*memset (&init_msg, 0, sizeof (init_msg));*/
	ret = listen(server_sock, 5);
	while (loop > 0) {
		printf("Awaiting a new connection\n");
		if ((conn_sock = accept(server_sock, NULL, NULL)) == -1) {

			printf ("Cannot accept\n");
		}
		else
		{
			char buffer[1024];
			in = read(conn_sock, buffer, sizeof(buffer));
			buffer[in]='\0';
			printf("\trecv=%s\n", buffer);
		}
		loop--;
	}
	printf("tobe shutting down SERVER_SOCK=%d\n", *((int*)shm));
	sleep(30);
	if ((ret = shutdown(*((int *)shm), SHUT_WR)) == -1) {
		printf("failure shutting down\n");
		goto err;
	}
	printf("done, to be aborted\n");
	ret = close(server_sock);
	munmap(shm, sizeof(int));
	return 0;

err:
	if (server_sock) close(server_sock);
	munmap(shm, sizeof(int));
	return 99;
}
