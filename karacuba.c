#include <stdio.h>
#include <math.h>

int karatsuba(int a, int b)
{
	if (a < 10 || b < 10)
	{
		return a*b;
	}

	int maxh = fmax(log10(a) + 1, log10(b) + 1);
	int m1 = maxh / 2;
	int m = (int)pow(10.0, m1 / 1.0);

	int l1=a/ m;
	int l2=b / m;
	int h1 = a % m;
	int h2 = b % m;

	int z2 = karatsuba(l1, l2);
	int z0 = karatsuba(h1, h2);
	int z1 = karatsuba((l1 + h1), (l2 + h2))-z2-z0;

	return (z2 * (int)pow(10.0,(2 * m1)/1.0)) + (z1 * (int)pow(10.0, (m1)/1.0)) + z0;
}

void main()
{
	int x, y,z;
	printf("Elso szam: ");
	scanf("%d", &x);
	printf("Masodik szam: ");
	scanf("%d", &y);
	printf("Eredmeny: ");
	printf("%d",karatsuba(x, y));
}