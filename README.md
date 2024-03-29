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
                </ol>
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
            <!-- 3. PROCESS -->
            <li> 3 Process </br>
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
            </li>
            <!-- 4. THREAD -->
            <li> 4. Threads </br>
                <li> 4.1 thread creation: pthread_t, separate library -lpthread, using the same memory address </br>
                     4.1.1 passing data to threads. </br>
                     4.1.2 pthread_join() </br>
                     4.1.5 thread attributes </br>
                </li>
                <li> 4.2 thread cancellation, sync and async</li>
                <li> 4.3 thread-specific data </li>
                <li> 4.4 synchronization and critical sections </br>
                     4.4.1 Race conditions </br>
                     4.4.2 Mutexes (MUtual EXclusion locks) </br>
                     4.4.3 Mutex Deadlocks </br>
                        - fast mutex (the default kind): will cause dealock</br>
                        - recursive mutex: does not cause deadlk. lock must equal to unlock </br>
                        - error-checking mutex: -- consecutive lock ->EDEADLK </br>
                     4.4.5 Semaphores (wait--) (post++) (exex==0) </br>
                     4.4.6 Condition variables </br>
                     4.4.7 Deadlocks with multi threads </br>
                </li>
                <li> 4.5 Thread implemention
                </li>
            </li>
            <!-- 5. IPC -->
            <li> 5. Interprocess Communication </br>
                 5.1 SHM: shmget, shmat, shmctl, ipc -m  </br>
                 5.2 SemaphoreHM: semget, semctl, wait(), post(), ipc -s </br>
                 5.3 Mapped memory: mmap, munmap, msync, </br>
                 5.4 Pipes: pipe, dup2 </br>
                 5.5 Socket server-client: socket, bind, listen, accept, close </br>
                  <b>NOTE:</b> example in the book <5.5.5> is wrong (len = NA)--TODO: debug </br>
            </li>
            <!-- 6. Devices -->
            <li> 6. Devices </br>
                 6.1 Device Types: character (serial stream of bytes), block (fixed-size block) </br>
                 Dangers of Block Devices </br>
                 6.2 Device numbers: major-number(driver, /proc/devices) & minor-number(invidual device)  </br>
                 6.3 Device entries: mv, rm, cp(copy bytes from devices), override devices (write bytes to devices) </br>
                 mknod(path, b/c, major, minor): ls -l --> file type: c/b/or - (hyphen) </br>
                 6.3.1 /dev directory.</br>
                 6.5 Special devices: /dev/null (no action), /dev/zero (infinity zero), /dev/full (full file - enospc)</br>
                 /dev/random (by user events) </br>
                 6.6. PTY, /dev/pts/, echo "hahah" > /dev/pts/4 </br>
                 6.7. ioctl(fd, operation, args...) </br>
            </li>
            <!-- 7. Proc -->
            <li> 7. /proc file system </br>
                 7.1 /proc/...: virtual file system, not hold disk location but generated by kernel </br>
                 7.2 /proc/self/, NUL ('\0' or (char)0) vs NULL ((void*)0 or 0 in c++)</br>
                 SOURCE CODE of pseudo proc: https://gitlab.com/procps-ng/procps/blob/master/ </br>
            </li>
            <!-- 8. Linux system call -->
            <li> 8. Linux system call (unistd.h) </br>
                    - standard lib call (glibc);or </br>
                    - system call (args are packaged and sent to kernel, wrapped-up by lib C for easier using). </br>
                 8.1 strace.</br>
                 8.2 access(path, permission): testing file permission.</br>
                 8.3 fcntl (fd, F_SETLCKW, &lock/unlock): locks and other file operations. (analogous to mutex). fctrl > flock</br>
                 8.4 fsync, fdatasync: Flushing disk buffers, update modified date or not (mostly), or open (...O_SYNC)</br>
                 8.5 getrlimit, setrlimit: Resource limits.</br>
                 8.6 getrusage: Process statistics.</br>
                 8.7 gettimeofday</br>
                 8.8 mlock (virt_addr, size), munlock: lock entire page from swapping in and out.</br>
                     mlockall (MCL_CURRENT/FUTURE), munlockall: lock all program's entire address space.</br>
                     to avoid thrashing situation, only superuser can user these funtions (sys/mman.h)</br>
                 8.9 mprotect: modified mapped memory permission (or else having a SIGSEGV-violation) </br>
                 8.10 sendfile() </br>
                 </br>
            </li>
            <!-- 9 inline asm -->
            <li> 9. Inline asm </br>
                9.5 asm/__asm__ ("asm_instructor %x,%y; asm_instructor2 %xx, %yy" </br>
                    : "=r/g/.." (input_variable) </br>
                    : "r/g/m..." (output_variable) </br>
                    : "clobbered register to recover register's value after asm execution")</br>
            </li>
            <!-- 10 security -->
            <li> 10. Security </br>
                - geteuid(), getegid(): never fail </br>
                - ls -l -o or stat: (d/-xxxyyyzzz): xxx: owning user (chmod +), yyy group user(chmod g+), zzz other users (chmod o+) </br>
                - using PAM (Pluggable Authenticate Module) to authenticate access right</br>
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

