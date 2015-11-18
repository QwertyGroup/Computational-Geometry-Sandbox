#include <iostream>
#include <cstdlib>

using namespace std;

struct Tdot
{
	int velocityX;
	int velocityY;
	int x;
	int y;
	int id;
};

const int m = 79;
const int n = 24;
int Table[n][m];

void pField();
void pTWr();
void pEquOrInc(int y, int x, int id);
void pLine(int x1, int y1, int x2, int y2, int id);
void pDotAssignment(Tdot *dot, int id);
void pPosCalc(Tdot *dot);
void pFillTriangle(int x1, int y1, int x2, int y2, int x3, int y3, int id);
void pFirstTriangle();
void pSecondTriangle();


int main()
{
	system("pause");
	return(0);
}