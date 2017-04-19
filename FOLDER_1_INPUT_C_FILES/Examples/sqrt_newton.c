
#include <stdio.h>
#include <stdlib.h>

double inline _abs(double d) {
	if (d < 0) {
		return -d;
	}
	return d;
}

double sqrt_newton(int m) {
	double result = m;
	while (_abs(result*result -m) > 0.001) {
		result = result - ((result*result - m)/(2*result));
	}
	return result;
}

int main(int argc, char * argv[]) {
	if (argc != 2) {
		fprintf(stderr, "USAGE: %s <number>\n", argv[0]);
		exit(1);
	}
	int n = atoi(argv[1]);
	printf("sqrt(%d) ~ %f\n",n, sqrt_newton(n));
	return 0;
}
