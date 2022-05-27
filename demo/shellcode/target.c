#include <signal.h>
#include <stdio.h>
#include <string.h>
int main(){
	char pad[200];

	memset(pad, 0xa5, 200);
	pwn();
	return 0;
}

void pwn(void) {
	char realPassword[20];
	char givenPassword[20];

	strncpy(realPassword, "ddddddddddddddd", 20);
	gets(givenPassword);
	/** fgets(givenPassword, 100, stdin); */
	/** read(0, givenPassword, 100); */
	/** printf("str input size:%d\n", strlen(givenPassword)); */
	/** raise(SIGINT); */
	
	if (0 == strncmp(givenPassword, realPassword, 20)){
		printf("SUCCESS!\n");
	}else{
		printf("FAILURE!\n");
	}
	/** raise(SIGINT); */
	printf("givenPassword: %s\n", givenPassword);
	printf("realPassword: %s\n", realPassword);
}
