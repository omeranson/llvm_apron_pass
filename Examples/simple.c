#include <stdio.h>
#include <stdlib.h>

int f2(int y, int z) {
	int x = 1 - y - z;
	return x;
}

int f(int y) {
	int z = 5;
	int x;
	if (y < 0) {
		x = -y;
	} else {
		x = z;
	}
	return x;
	//int a = 2*x;
	//return a;
}

int f4(int y) {
	int z;
	int x;
	if (y < 0) {
		z = -y+7;
		x = y;
	} else {
		z = y-3;
		x = -y;
	}
	return z+x;
}

int f3(int y) {
	if (y > 100) {
		return -1;
	}
	int sum = 0;
	for (int cnt = 1; cnt < y; cnt++) {
		sum += cnt;
	}
	return sum;
}

int main(int argc, char * argv[]) {
	if (argc != 2) {
		fprintf(stderr, "USAGE: %s <y>\n", argv[0]);
		return 1;
	}
	printf("%d\n", f(atoi(argv[1])));
	return 0;
}


