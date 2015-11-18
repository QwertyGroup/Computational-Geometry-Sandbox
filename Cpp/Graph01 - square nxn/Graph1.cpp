#include <cstdlib>
#include <iostream>
#include <locale>

using namespace std;

const int m = 20;
const int n = 20;
int x, y, i, j;
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
}

void pField()
{
	for ( i = 0; i < n; i++) 
		for ( j = 0; j < m; j++) 
			Table[i][j] = char(249);	
}

void pDiagonal()
{
	for ( i = 0; i < n; i++)
		Table[i][i] = char(248);
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
