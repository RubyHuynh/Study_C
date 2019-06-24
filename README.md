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
                <li> Using standard C macro "assert", -DNDEBUG </br>
                    Check against null pointers, for instance, as invalid function arguments </br>
                    The  program  is  terminated  if  the  expression  evaluates to false, after printing an error message containing the source file and line number and the text  of  the  expression.</li>
                <li></li>
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