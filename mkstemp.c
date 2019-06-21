#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>

int fd = -1;

void write_tmp(char* buffer, size_t len) {
	char fn[] = "/tmp/temp.XXXXXX"; /* 6X */
	fd = mkstemp(fn);
	write(fd, &len, sizeof(len));
	write(fd, buffer, len);
	unlink(fn); /* to rm /tmp/temp.* on fd closing */
}

char* read_tmp(size_t* len) {
	char* rs = NULL;
	lseek(fd, 0, SEEK_SET);
	read(fd, len, sizeof(len));
	rs = (char*)malloc(*len+1);
	read(fd, rs, *len);
	close(fd);
	return rs;
}

int main() {
	char* data = "Cette Jeudi 2019!";
	size_t len = 0;
	write_tmp(data, strlen(data));
	read_tmp(&len);
	printf("(%d) %s\n", (int)len, data);
	return 9;
}


/*
   2.1.7 Using Temporary Files Sometimes a program needs to make a temporary file, to store large data for a while or to pass data to  another  program.  On  GNU/Linux  systems,  temporary  files  are  stored  in  the  /tmp  directory.  When using temporary files, you should be aware of the following pitfalls: •More than one instance of your program may be run simultaneously (by the same user or by different  users).  The  instances  should  use  different  temporary  filenames  so  that  they  don't  collide. •The  file  permissions  of  the  temporary  file  should  be  set  in  such  a  way  that  unauthorized  users cannot alter the program's execution by modifying or replacing the temporary file. •Temporary  filenames  should  be  generated  in  a  way  that  cannot  be  predicted  externally;  otherwise, an attacker can exploit the delay between testing whether a given name is already in use and opening a new temporary file.
   GNU/Linux  provides  functions,  mkstemp  and  tmpfile,  that  take  care  of  these  issues  for  you  (in  addition to several functions that  don't).  Which  you  use  depends  on  whether  you  plan  to  hand  the  temporary  file  to  another  program,  and  whether  you  want  to  use  UNIX  I/O  (open, write,  and  so  on) or the C library's stream I/O functions (fopen, fprintf, and so on).

   Using mkstemp The mkstemp  function  creates  a  unique  temporary  filename  from  a  filename  template,  creates  the  file  with  permissions  so  that  only  the  current  user  can  access  it,  and  opens  the  file  for  read/write.  The  filename  template  is  a  character  string  ending  with  "XXXXXX"  (six  capital  X's);  mkstempreplaces the X's with characters so that the filename is unique. The return value is a file descriptor; use the write family of functions to write to the temporary file. Temporary  files  created  with  mkstemp  are  not  deleted  automatically.  It's  up  to  you  to  remove  the  temporary  file  when  it's  no  longer  needed.  (Programmers  should  be  very  careful  to  clean  up  temporary  files;  otherwise,  the  /tmp  file  system  will  fill  up  eventually,  rendering  the  system  inoperable.) If the temporary file is for internal use only and won't be handed to another program, it's a good idea to call unlink on the temporary file immediately. The unlink function removes the directory entry corresponding to a file, but because files in a file system are reference-counted, the file itself is not removed until there are no open file descriptors for that file, either. This way, your program  may  continue  to  use  the  temporary  file,  and  the  file  goes  away  automatically  as  soon  as  you  close  the  file  descriptor.  Because  Linux  closes  file  descriptors  when  a  program  ends,  the  temporary file will be removed even if your program terminates abnormally. The pair of functions in Listing 2.5 demonstrates mkstemp. Used together, these functions make it easy to write a memory buffer to a temporary file (so that memory can be freed or reused) and then read it back later.
*/

/*

gitpod /workspace/Study_C $ ./a.out
(17) Cette Jeudi 2019!
gitpod /workspace/Study_C $ ls /tmp/
23a00232e7745ff6146e25aa2dc88bbb  preamble-b5d716.pch
6ab2b5fb3c02a94c229bae9fbc8b2147  preamble-eedb36.pch
github-remote                     temp.8oN5e1
http-remote                       temp.Ahx9pk
preamble-090e9b.pch               temp.X8WUyO
preamble-361c35.pch               vscode-extension-marketplace
preamble-a0cba8.pch
 */

 /*
 Using tmpfile If  you  are  using  the  C  library  I/O  functions  and  don't  need  to  pass  the  temporary  file  to  another  program, you can use the tmpfile function. This creates and opens a temporary file, and returns a file pointer to it. The temporary file is already unlinked, as in the previous example, so it is deleted automatically when the file pointer is closed (with fclose) or when the program terminates. GNU/Linux   provides   several   other   functions   for   generating   temporary   files   and   temporary   filenames,  including  mktemp, tmpnam,  and  tempnam.  Don't  use  these  functions,  though,  because  they suffer from the reliability and security problems already mentioned
  */