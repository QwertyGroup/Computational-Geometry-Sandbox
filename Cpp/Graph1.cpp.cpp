#include <cstdlib>
#include <iostream>
#include <locale>

using namespace std;

const int m = 20;
const int n = 20;
int x, y, i, j;

void pField();

int main() {
	pField;
	system("pause");
}

void pField()
{
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			cout << '.';
		}
		cout << endl;
	}
}