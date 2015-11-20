#include <cstdlib>
#include <iostream>

using namespace std;

const int n = 21;
const int m = 55;
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
	double k = double(n) / double(m);
	
	for ( i = 0; i < n; i++)
	{
		y = i;
		x = y / k;
		Table[int (y)][int (x)] = char(248);
	}
	
	for ( j = 0; j < m; j++)
	{
		x = j;
		y = k * x;
		Table[int(y)][int(x)] = char(248);
	}
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
