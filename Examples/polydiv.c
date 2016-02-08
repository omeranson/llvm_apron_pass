#include <stdio.h>

// @pre q and r are large enough. See if analysis can calculate their
// minimum/maximum needed size?
void polydiv(double * u, int nu, double * v, int nv, double * q, double * r) {
	int k;
	int j;
	for (j = 0; j <= nu; j++) {
		r[j] = u[j];
		q[j] = 0.0;
	}
	for (k = nu-nv; k >= 0; k--) {
		q[k] = r[nv+k] / v[nv];
		for (j = nv+k-1; j >= k; j--) {
			r[j] -= q[k]*v[j-k];
		}
	}
	for (j=nv; j <= nu; j++) {
		r[j] = 0.0;
	}
}

void print_polynomial(double * p, int n) {
	int cnt;
	for (cnt = n; cnt > 0; cnt--) {
		printf("%f*x^%d + ", p[cnt], cnt);
	}
	printf("%lf", p[0]);
}

void test1() {
	// x^2 - 1 / x + 1
	double u[] = {-1.0, 0.0, 1.0};
	double v[] = {1.0, 1.0};
	double q[3];
	double r[3];
	polydiv(u, 2 /* sizeof(u)/sizeof(double) */, v, 1 /* sizeof(v)/sizeof(double) */, q, r);
	print_polynomial(u, 2);
	printf(" / ");
	print_polynomial(v, 1);
	printf(" = ");
	print_polynomial(q, 2);
	printf(" ( ");
	print_polynomial(r, 2);
	printf(" )\n");
}

void test2() {
	// x^2 + x + 1 / x + 1
	double u[] = {1.0, 1.0, 1.0};
	double v[] = {1.0, 1.0};
	double q[3];
	double r[3];
	polydiv(u, 2 /* sizeof(u)/sizeof(double) */, v, 1 /* sizeof(v)/sizeof(double) */, q, r);
	print_polynomial(u, 2);
	printf(" / ");
	print_polynomial(v, 1);
	printf(" = ");
	print_polynomial(q, 2);
	printf(" ( ");
	print_polynomial(r, 2);
	printf(" )\n");
}

int main(int argc, char * argv[]) {
	test1();
	test2();
}


