#include <stdio.h>
#include <stdlib.h>
#include <libpq-fe.h>

void do_exit(PGconn *conn) {
    
    PQfinish(conn);
    exit(1);
}

int main() {
    
    PGconn *conn = PQconnectdb("user=postgres dbname=temo");

    if (PQstatus(conn) == CONNECTION_BAD) {
        
        fprintf(stderr, "Connection to database failed: %s\n",
            PQerrorMessage(conn));
        do_exit(conn);
    }
    
    PGresult *res = PQexec(conn, "SELECT * FROM Cars");    
    
    if (PQresultStatus(res) != PGRES_TUPLES_OK) {

        printf("No data retrieved\n");        
        PQclear(res);
        do_exit(conn);
    }       
    
    int ncols = PQnfields(res);
    
    printf("There are %d columns\n", ncols);
    
    printf("The column names are:\n");
    
    for (int i=0; i<ncols; i++) {
        
        char *name = PQfname(res, i);
        printf("%s\t", name);
    }
 printf("\n");
    int rows = PQntuples(res);
    for (int i = 0; i < rows; i++) {
	printf("%s\t%s\t%s\n", PQgetvalue(res, i, 0), PQgetvalue(res, i, 1), PQgetvalue(res, i, 2));
    }

    PQclear(res);
    PQfinish(conn);

    return 0;
}
