#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

//int f9(char *buf1, char *buf2, int size, int length)
//{
//	char *p = buf1+3;
//	char *q = NULL;
//	
//	if (length > 7)
//	{
//		p = buf2 + length;
//	}
//
//	if (length <= 60)
//	{
//		p = buf1 + size;
//	}
//	
//	while (size > 0)
//	{
//		q = p+5;
//		
//		p++;	
//	
//		if (q[length] == ';')
//		{
//			return 777;
//		}
//		
//		size--;
//	}
//	
//	return 200;
//}

int f10() {
	int res = g();
	int ok = 0;
	int size = h();
	int last = k();
	if (res == 0) {
		ok = 1;
		//j(ok);
		if (last > size) {
			goto nope;
		}
	} else {
		//l(ok);
		ok = res;
		if (last <= size) {
			goto nope;
		}
	}
	print_yep(ok);
	return 0;
nope:
	print_nope();
	return 1;
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

