#include <iostream>
#include <cstdlib>
using namespace std;

const int n = 24;
const int m = 79;
int i, j;
char Table [n][m];

void pField();
void pLine(int x1, int y1, int x2, int y2, int id);
void pTWr();

int main()
{
	pField();
	pLine(2, 4, 60, 20, 1);
	pTWr();
	system("pause");
	return(0);
}

void pField()
{
	for ( i = 0; i < n; i++)
		for ( j = 0; j < m; j++)
			Table[i][j] = char(249);
}

void pLine(int x1, int y1, int x2, int y2, int id)
{
	double x,y;
	double k;
	double b;

	k= (y1-y2) / (x1-x2);
	b= y1 - k*x1;

	if (y2 > y1)
}

void pTWr()
{
	for ( i = 0; i < n; i++)
	{
		for ( j = 0; j < m; j++) {
			cout << Table[i][j];
		}
		cout << endl;
	}
}
