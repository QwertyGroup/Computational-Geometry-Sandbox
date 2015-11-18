#include <cstdlib>
#include <iostream>

using namespace std;

const int n = 20;
const int m = 30;
int i, j;
char Table [n][m];

void pField();
void pDiagonal();
void pTWr();

int main() 
{
	pField();
	pDiagonal();
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

void pDiagonal()
{
	double x, y;
	double k = n / m;
	
	for ( i = 0; i < n; i++)
	{
		y = i;
		x = y / k;
		Table[int (y)][int (x)] = char(248);
	}
	
//	for ( j = 0; i < m; j++)
//	{
//		x = j;
//		y = k * x;
//		Table[int(y)][int(x)] = char(248);
//	}
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
