#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<stdbool.h>
#include<string.h>


char* math(int d) {
	int len = 0, i = 0;
	char* s = NULL;
	
	len = (d > 64 && d%2) ? floor(log2(d)) + 2 : floor(log2(d)) +1;
	printf("\n\t %d --> %d --> ", d, len);
	s = calloc(1, len+1);
	s[0] = '0';
	while(d) {
		printf("\tidx %d", len);
		s[--len] = d%2 ? '1' : '0';
		d /= 2;
	}
	printf("\t\ngot %s\n", s);
	return s;
}


void variants(int k) {
	char** rs = calloc(1, pow(2,k) * sizeof(char*));
	int i = 0;
	int idx = 0;
	int max = pow(2,k);
	
	
}


void generator(int k, int i, char* bits) {
	if (i == k) {
		printf("%s\n", bits);
		return;
	}
	bits[i] = '0';
	generator(k, i+1, bits);
	bits[i] = '1';
	generator(k, i+1, bits);
}


bool susu(char* s, int n, int i, char* tmp) {
    if (i == n) {
	printf("\t %s vs %s\n", s, tmp);
        if (!strstr(s, tmp)) {
            return false;
        }
        return true;
    }
    tmp[i] = '0';
    if (!susu(s, n, i+1, tmp)) return false;
    tmp[i] = '1';
    return susu(s, n, i+1, tmp);
}

bool queryString(char * s, int n) {
    char* tmp = NULL;
    int len = 0; int i = 0;
    bool rs = false;
    
    if (!s || (len=strlen(s)) == 0) {
        return false;
    }
    tmp = calloc(1, len);
    for (i = 1; i <= n; i++) {
        rs = susu(s, i, 0, tmp);
        if (!rs) break;
    }
    free(tmp);
    return rs;
}

bool queryString1(char * s, int n) {
    char* tmp = NULL;
    int len = 0;
    bool rs = false;
    
    if (!s || (len=strlen(s)) == 0) {
        return false;
    }
    tmp = malloc(len);
    rs = susu(s, n, 0, tmp);
    free(tmp);
    return rs;
}

int b2d(char* s, int n) {
    int rs = 0, i = 0;
    
    for(n; n >= 0; n--, i++) {
        if (s[i] == '1') {
            rs |= (1<< i);
        }
    }
    printf("\t %s(%d)\n", s, rs);
    return rs;
}


bool queryString2(char * s, int n) {
    char* tmp = NULL;
    int len = 0, i = 0, j = 0, val = 0;
    bool rs = false;
    bool arr[n+1];

    printf("working on %s and %d\n", s, n);    
    if (!s || (len=strlen(s)) == 0 || n == 0) {
        return false;
    }
    tmp = calloc(1, len + 1);
    memset(arr, 0, sizeof(arr));
    for (i = 0; i < len; i++) {
        memset(tmp, 0, len + 1);
        for (j = i+1; j <= len; j++) {
            strncpy(tmp, &s[i], j-i);
            val = b2d(tmp, j-i);
            if (val >= 1 && val <= n) {
		printf(" >>>>> savinng");
                arr[val] = true;
            }
        }
    }
    for (i = 1; i <= n; i++) {
	printf("working on %i\n", i);
        if (!arr[i]) {
	    printf("missing %d\n", i);
            return false;
        }
    }
    
    free(tmp);
    return true;
}


char* n2s(int n) {
    /*bool arr[n];
    int i = 0, j = 0;
    int k = n;
    char* rs = NULL;
    memset(arr, 0, sizeof(arr));
    while (n) {
        if (n%2) {
            arr[i] = true;
        }
        n /= 2;
        i++;
    }
    rs = calloc(1, i+1);
    n = 0;
    for(j = i-1; j >= 0; j--) {
        if (arr[j]) {
            rs[n] = '1';
        }
        else {
            rs[n] = '0';
        }
        n++;
    }*/
    int k = n,i = 0, j = 0;
    char* rs = NULL;
    while (k) {
        i++;
        k >>= 1;
    }
    rs = calloc(1, i+1);
    k = 0;
    while (n) {
        if (n & 1) {
            rs[k] = '1';
        }
        else {
            rs[k] = '0';
        }
        k++;
        n >>= 1;
    }
    printf("\t%d-->%s\n", k, rs);
    return rs;
}

bool queryString3(char* s, int n) {
  printf("%s\n", s);
  while (n > 0) {
    char* sub = n2s(n--);
    if (!strstr(s, sub)) {
	free(sub);
	return false;
    }
    free(sub);
  }

  return true;
}
int main() {
	char* str = calloc(1, 10);
	variants(4);
	printf("===============4\n");
	generator(4, 0, str);

	printf("===============3\n");
	memset(str, 0, 10);
	generator(3, 0, str);

	printf("===============7\n");
	memset(str, 0, 10);
	generator(7, 0, str);

	printf("============\n");
	if (queryString2("0110", 3)) {
		printf("OK\n");
	}
	else {
		printf("KO\n");
	}

	printf("============\n");
	if (queryString2("10010111100001110010", 10)) {
		printf("OK\n");
	}
	else {
		printf("KO\n");
	}

	printf("============\n");
	if (queryString3("011010101010111101010101011111111111111111111111111111111110000000000000011111101010101001010101010101010101010101111010101010111111111111111111111111111111111100000000000000111111010101010010101010101010101010100", 1000000000)) {
		printf("OK\n");
	}
	else {
		printf("KO\n");
	}

	printf("====================\n");
	math(10);
	math(5);
	math(15);
	math(128);
	math(8);
	return 0;
}
