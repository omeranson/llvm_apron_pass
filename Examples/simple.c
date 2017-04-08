#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int f9(char *buf1, char *buf2, int size, int length)
{
	char *p = buf1+3;
	char *q = NULL;
	
	if (length > 7)
	{
		p = buf2 + length;
	}
	
	while (size > 0)
	{
		q = p+5;
		
		p++;	
	
		if (q[length] == ';')
		{
			return 777;
		}
		
		size--;
	}
	
	return 200;
}

#if 0
int main(int argc, char * argv[]) {
	if (argc != 2) {
		fprintf(stderr, "USAGE: %s <y>\n", argv[0]);
		return 1;
	}
	printf("%d\n", f1(atoi(argv[1])));
	return 0;
}

#endif

