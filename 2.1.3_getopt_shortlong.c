#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

const char* prg_name;

#define S_HELP      'h'
#define S_OUTPUT     'o'
#define S_VERBOSE   'v'
#define L_HELP      "help"
#define L_OUTPUT     "output"
#define L_VERBOSE   "verbose"

void usage(FILE *stream, int exit_code) {
    fprintf(stream, "Usage %s options\n", prg_name);
    fprintf(stream,
        "-%c --%s \n"
        "-%c --%s out_file \n"
        "-%c --%s \n"
        , S_HELP, L_HELP, S_OUTPUT, L_OUTPUT, S_VERBOSE, L_VERBOSE);
    exit(exit_code);
}

int main(int argc, char* argv[]) {
    int next_opt = 0;
    const char* const short_opts = "ho:v";
    const struct option long_opts[] = {
        {L_HELP, 0, NULL, S_HELP},
        {L_OUTPUT, 1, NULL, S_OUTPUT},
        {L_VERBOSE, 0, NULL, S_VERBOSE},
        {NULL, 0, NULL, 0}
    };
    const char* o_file = NULL;
    int verbose = 0;

    prg_name = argv[0];
    do {
        next_opt = getopt_long(argc, argv, short_opts, long_opts, NULL);
        switch (next_opt) {
            case S_HELP:
                usage(stdout, 0);

            case S_OUTPUT:
                o_file = optarg;
            break;

            case S_VERBOSE:
                verbose = 2;
            break;

            case -1:  /* done */
            break;

            case '?': /* invalid option */
                usage(stderr, 1);

            default: /* should not happen */
                abort();
        }
    }
    while (next_opt != -1);

    printf("=====\n Done: output=%s verbose=%d \n", o_file, verbose);
    return 0;
}