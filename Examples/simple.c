#include <stdio.h>
#include <stdlib.h>


__attribute__((noinline)) int f4(int y)
{
	if (y > 5) return 11;
	else
	{
		if (y < 0)
		{
			return 12;
		}
		else
		{
			return y+3;
		}
	}
}
__attribute__((noinline)) int f257(int y)
{
	int j=23;
	if (y < 0)
	{
		j += f4(-y);
		if (j >= 26)
		{
			return 50;
		}
		else
		{
			// unreachable code
			return -8;
		}
	}
	else
	{
		return (y+6)/6;
	}
}

__attribute__((noinline)) int f2(int y)
{
	if (y >= 0)
	{
		return y+11;
	}
	else
	{
		if (y < -5)
		{
			return 2;
		}
		else
		{
			if (y == -3)
			{
				return f257(6);
			}
			else
			{
				return -y;
			}
		}
	}
}

__attribute__((noinline)) int f1(int y)
{
	int z=5;
	int x;
	
	if (y < 0)
	{
		x = -y+8;
	}
	else
	{
		x = z;
	}
	
	return x;
}

int f6(int y) {
	int x = 0;
	if (y < 0) {
		x = -1;
	} else if (y > 0) {
		x = 1;
	}
	return x;
}

int f7 (int y) {
	if (y > 30) {
		h(y);
		y = 30;
	}
	g(y);
	return y;
}

int f8 (int y, int z) {
	if (y > 30) {
		return z;
	}
	return y;
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

