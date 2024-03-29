#define HAVE_REMOTE
#include <pcap.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netinet/if_ether.h>

/* simulate
  gcc -g pcap2.c -lpcap


1. server listen: iperf -s -f -k -u
2. client stream: iperf -c 127.0.0.1 -u -n 10G -b 1M
3. ./a.out "port 5001"

*/


void my_callback(u_char *args, const struct pcap_pkthdr* pkthdr, const u_char*
    packet)
{
        printf("....\n");
    static int count = 1;
    fprintf(stdout, "%3d, ", count);
    fprintf(stdout, "%s, ", packet);
    fflush(stdout);
    count++;
}


int main(int argc, char** argv)
{
	pcap_if_t *alldevs;
	pcap_if_t *d;
	int inum;
	int i = 0;
	pcap_t *adhandle;
	char errbuf[PCAP_ERRBUF_SIZE];
	u_int netmask;
	char** packet_filter = argv[1];
	struct bpf_program fcode;

	/* Retrieve the device list */
	if (pcap_findalldevs(&alldevs, errbuf) == -1)
	{
		fprintf(stderr, "Error in pcap_findalldevs: %s\n", errbuf);
		exit(1);
	}

	/* Print the list */
	for (d = alldevs; d; d = d->next)
	{
		printf("%d. %s", ++i, d->name);
		if (d->description)
			printf(" (%s)\n", d->description);
		else
			printf(" (No description available)\n");
	}

	if (i == 0)
	{
		printf("\nNo interfaces found! Make sure WinPcap is installed.\n");
		return -1;
	}

	printf("Enter the interface number (1-%d):", i);
	scanf("%d", &inum);

	if (inum < 1 || inum > i)
	{
		printf("\nInterface number out of range.\n");
		/* Free the device list */
		pcap_freealldevs(alldevs);
		return -1;
	}

	/* Jump to the selected adapter */
	for (d = alldevs, i = 0; i< inum - 1;d = d->next, i++);

	/* Open the adapter */
	if ((adhandle = pcap_open_live(d->name,
                1514 /*snaplen*/,
                1 /*flags, 1=promiscuous, 0=not promiscuous*/,
                20 /*read timeout*/,
                errbuf)
                ) == NULL) 
/*if ((adhandle = pcap_open(d->name,  // name of the device
		65536,     // portion of the packet to capture. 
				   // 65536 grants that the whole packet will be captured on all the MACs.
		PCAP_OPENFLAG_PROMISCUOUS,         // promiscuous mode
		1000,      // read timeout
		NULL,      // remote authentication
		errbuf     // error buffer
		)) == NULL) */
	{
		fprintf(stderr, "\nUnable to open the adapter. %s is not supported by WinPcap\n");
		/* Free the device list */
		pcap_freealldevs(alldevs);
		return -1;
	}

	/* Check the link layer. We support only Ethernet for simplicity. */
	if (pcap_datalink(adhandle) != DLT_EN10MB)
	{
		fprintf(stderr, "\nThis program works only on Ethernet networks.\n");
		/* Free the device list */
		pcap_freealldevs(alldevs);
		return -1;
	}

 bpf_u_int32 maskp;            /* subnet mask */
    bpf_u_int32 netp;             /* ip */

	if (d->addresses != NULL) {
		pcap_lookupnet(d->name, &netp, &netmask, errbuf);
	}
		/* Retrieve the mask of the first address of the interface */
		//netmask = ((struct sockaddr_in *)(d->addresses->netmask))->sin_addr;
	//	memcpy(&netmask, &(((struct sockaddr_in *)(d->addresses->netmask))->sin_addr.s_addr), 4); 
	else
		/* If the interface is without addresses we suppose to be in a C class network */
		netmask = 0xffffff;


	//compile the filter
	if (pcap_compile(adhandle, &fcode, packet_filter, 1, netmask) <0)
	{
		fprintf(stderr, "\nUnable to compile the packet filter. Check the syntax.\n");
		/* Free the device list */
		pcap_freealldevs(alldevs);
		return -1;
	}

	//set the filter
	if (pcap_setfilter(adhandle, &fcode)<0)
	{
		fprintf(stderr, "\nError setting the filter.\n");
		/* Free the device list */
		pcap_freealldevs(alldevs);
		return -1;
	}

	printf("\nlistening on %s...\n", d->description);

	/* At this point, we don't need any more the device list. Free it */
	pcap_freealldevs(alldevs);

	/* start the capture */
	pcap_loop(adhandle, 0, my_callback, NULL);

	return 0;
}
