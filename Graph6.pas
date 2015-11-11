{$IFDEF NORMAL}
  {$H-,I+,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF NORMAL}
{$IFDEF DEBUG}
  {$H-,I+,OBJECTCHECKS-,Q+,R+,S-}
{$ENDIF DEBUG}
{$IFDEF RELEASE}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF RELEASE}

{graph 6 - 2 random triangles}

uses crt;

const	b = 79;{x} {79}
		a = 24;{y} {24}

type	tt = array[1..a,1..b] of byte;		
		ttb = array[1..a,1..b] of boolean;

var 	Table:tt;
		BoolTable:ttb;
		i, j:integer;
		x, y:real;
		k, t:real;
		maxy:integer;
		t1, t2, t3, t4, t5, t6:integer;
		z1, z2, z3, z4, z5, z6:integer;

{----Field----} {Заполнение таблицы нулями}
procedure pField;
	begin
		for i:=1 to a do
			for j:=1 to b do
				Table[i,j]:=0;
	end;
{----TableWrite----} {Вывод таблицы}
procedure pTWr;
	begin
		for i:=1 to a do
			begin
				for j:=1 to b do
					case Table[i,j] of
						0:begin TextColor(7); write(char(249)); end;
						1:begin TextColor(11); write(char(248)); end;
						2:begin TextColor(11); write(char(248)); end;
					end;
				writeln;	
			end;	
	end;
{----FieldBoolean----} {Заполнение таблицы использования ячейки}
procedure pFieldBool;
	begin
		for i:=1 to a do
			for j:=1 to b do
				BoolTable[i,j]:=false;
	end;
{----Line----} {"Рисование" линии}
procedure pLine(x1,y1,x2,y2:integer); {j=x}{i=y}
	begin
		if (y1=y2) and (x1=x2) then
			begin
				Table[y1,x1]:=1;
				exit;	
			end;

		if (y1=y2) and (x1<>x2) then
			begin
				for i:=1 to x2-x1+1 do
					Table[y1,i]:=1;
				exit;	
			end;

		if (y1<>y2) and (x1=x2) then
			begin
				for i:=1 to y2-y1+1 do
					Table[i,x1]:=1;
				exit;	
			end;		

		if y1 < y2 then 	
			begin
				maxy:=y2;
				y:=y1;
			end	
		else
			begin
				maxy:=y1;
				y:=y2;	
			end;

		k:=(y1-y2)/(x1-x2);
		t:=y1-k*x1;

		while y <= maxy do
			begin
				x:=(y-t)/k;
				if not BoolTable[round(y),round(x)] then
					begin
						inc(Table[round(y),round(x)]);
						BoolTable[round(y),round(x)]:=true;
					end;
				y:=y+0.0001;
			end;
	end;
{----RandomDots----}
procedure pRandomDots;	{t1, t3, t5 - x}
	begin				{t2, t4, t6 - y}
		randomize;
		repeat
			t1:=random(79)+1;
			t3:=random(79)+1;
			t5:=random(79)+1;
			t2:=random(24)+1;
			t4:=random(24)+1;
			t6:=random(24)+1;

			z1:=random(79)+1;
			z3:=random(79)+1;
			z5:=random(79)+1;
			z2:=random(24)+1;
			z4:=random(24)+1;
			z6:=random(24)+1;
		until ((t5 - t1) / (t3 - t1)) <> ((t6 - t2) / (t4 - t2));
	end;
{----Main----}
begin
	clrscr; {Чистим окно}
	
	pField; {Заполняем таблицу}
	pFieldBool; {Заполняем таблицу использования}

	pRandomDots; {Выбираем случайные точки}
	
	{Первый треугольник}
	pLine(t1,t2,t3,t4); {Первая сторона}
	pFieldBool; {Обнуляем таблицу использования}

	pLine(t1,t2,t5,t6); {Вторая сторона}
	pFieldBool; {Обнуляем таблицу использования}

	pLine(t3,t4,t5,t6); {Третья сторона}
	pFieldBool; {Обнуляем таблицу использования}

	{Второй треугольник}
	pLine(z1,z2,z3,z4); {Первая сторона}
	pFieldBool; {Обнуляем таблицу использования}

	pLine(z1,z2,z5,z6); {Вторая сторона}
	pFieldBool; {Обнуляем таблицу использования}

	pLine(z3,z4,z5,z6); {Третья сторона}
	pFieldBool; {Обнуляем таблицу использования}

	pTWr; {Выводим таблицу на монитор}

	//write('(', t1, ' ', t2, ')', ' ', '(', t3, ' ', t4, ')', ' ', '(', t5, ' ', t6, ')'); {Для отладки}

	readln;
end.