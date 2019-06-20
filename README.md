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
        </ol>
    </li>
</ol>