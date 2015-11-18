#include <cstdlib>
#include <iostream>
#include <locale>

using namespace std;

const int n = 20;
int x, y, i, j;
char Table [n][2*n];

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
		for ( j = 0; j < 2*n; j++) 
			Table[i][j] = char(249);	
}

void pDiagonal()
{
	for ( i = 0; i < n; i++)
	{
		Table[i][2*i] = char(248);
		Table[i][2*i+1] = char(248);
	}
}

void pTWr()
{
	for ( i = 0; i < n; i++) 
	{
		for ( j = 0; j < 2*n; j++) {
			cout << Table[i][j];
		}
		cout << endl;
	}
}
