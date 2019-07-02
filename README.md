# Study_C
<ol>
    <li> SELECT vs POLL vs EPOLL </br>
        <p>
            <a href="https://devarea.com/linux-io-multiplexing-select-vs-poll-vs-epoll/">
                https://devarea.com/linux-io-multiplexing-select-vs-poll-vs-epoll/
            </a>
        </p>
    </li>
    <li> Linux programming with C </br>
        <b>http://www.cse.hcmut.edu.vn/~hungnq/courses/nap/alp.pdf </b>
        <ol>
            <li> 2.1.3 Using getopt_longm, pg.29/269</li>
            <li> standard I/O, I didn't know the difference between stdout & stderr :D </li>
            <li> shell $? == program exit code, zeor means success</li>
            <li> environment: </br>
                printenv, export XX=AAA, getenv(), unsetenv() & setenv() in stdlib.h </li>
            <li> using temporary files: to store dtata for a while or pass info to other program (of this user only) </br>
                - stored in /tmp. </br>
                - unique generated names. </br>
                - permission on temps files. </br>
                Using GNU/Linux: mktemps(), tmpfile(), unlink()</br>
                UNIX I/O: open(), write(), .. </br>
                C library's stream I/O functions: fopen(), fprintf(), .. </br>
            </li>
            <li> 2.2 Coding defensively </br>
                <ol>
                    <li> Using standard C macro "assert", -DNDEBUG </br>
                        Check against null pointers, for instance, as invalid function arguments </br>
                        The  program  is  terminated  if  the  expression  evaluates to false, after printing an error message containing the source file and line number and the text  of  the  expression.
                    </li>
                    <li> System cll failures </br>
                        using macro erno/<errno.h> strerror/<string.h>, </br>
                        - running out of resources (memory addresses, file descriptors, ) </br>
                        - block access, no permission. </br>
                        - invalid arguments </br>
                        - external error, faulty devices </br>
                        - interrupted by external event, signal </br>
                    </li>
                <ol>
            </li>
            <li> 2.3 Writing ans using libraries </br>
                2.3.1 archives: </br>
                - must define static library by the end of gcc, so that the linker can include
                object in libtest.a in the binary. </br>
                       gcc -c test1.c test2.c </br>
                       ar cr libtest.a test1.o test2.o </br>
                       gcc -L. -ltest main.c /* too soon, undefined reference to xxx() */ </br>
                       gcc main.c -L. -ltest </br>
                2.3.2 shared libraries </br>
                - shared library will include all references to the binary, rather than just
                those portions that are needed. </br>
                       gcc -c -fpic test1.c </br>
                       gcc -share -fpic -o libtest.so test1.o </br>
                       gcc main.c -L. ltest -Wl,-rpath,./ </br>
                2.3.3 if same function in both static and shared, shared is preferred.
                unless ---> gcc -static main.c -L. -ltest </br>
                   standard library libc, or libstdc++ is automatical linked to our program. </br>
                   standard libm must be included explicitly -lm </br>
                   or auto cp to /usr/local/lib;/usr/lib & reload the loader: ldconfig </br>
                2.3.4 Libraries dependancies </br>
                   ldd (ld-linux.so) </br>
                2.3.5 Pros and cons </br>
                   export LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH </br>
                   or: compile our program with -Wl,-rpath:./ </br>
                2.3.6 Dynamic loading and unloading </br>
                   void* handle = dlopen("libtest.so", RTLD_LAZY);</br>
                   void (*test)() = dlsym(handle, "test_func");</br>
                   (*test)();</br>
                   dlclose(handle)</br>
                   </br>
                    C++: extern "C"  linkage  specifier.
                    </br>
                    <p>This  prevents  the  C++  compiler  from  mangling  the  function  name,  which  would  change  the  function's name from foo to a different, funny-looking name that encodes extra information about the  function.  A  C  compiler  will  not  mangle  names;  it  will  use  whichever  name  you  give  to  your  function or variable</p>
            </li>
            <li> 3.2 Creating Processes: system(cmd), fork() == 0, execvpl() return only error. </br>
                    - priority niceness, nice/renice -n 10 x, nice negative with root account only.
            </li>
            <li> 3.3 Signals, async (interrupt sync) </li>
            <li> 3.4 Process Termination </br>
                    3.4.1 Waiting for process termination. </br>
                    3.4.2 wait systemcall, wait(3) wait(4) block or WNOHANG. </br>
                    3.4.3 zombie process. </br>
                    3.4.3 cleaning up children asynchronous by catching SIGCHLD, wait(). </br>
            </li>
        </ol>
    </li>
    <li>Others </br>
        <ol>
            <li>@TODO inject asm in C program to pop out base address and change stack size <li>
            <li>@TODO how data is piled up in fd socket? how it knows read?</li>
            <li>sctp shutdown(fd), use mmap shared memory between forked process and its parent. </br>
            fd must be in the list of /proc/pid_/fd --> out of range will return -1; <li>
        </ol>
    <li>
</ol>