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
{----TableWrite----} {Вывод таблицы} {переводим цифры в символы}
procedure pTWr;
    begin
        for i:=1 to a do
            begin
                for j:=1 to b do
                    case Table[i,j] of
                        0:begin TextColor(7); write(char(249)); end;
                        1:begin TextColor(11); write(char(248)); end;
                        2:begin TextColor(11); write(char(248)); end;
                        3:begin TextColor(11); write(char(248)); end;
                        4:begin TextColor(11); write(char(248)); end;
                        5:begin TextColor(11); write(char(248)); end;
                        6:begin TextColor(11); write(char(248)); end;
                    end;
                writeln;    
            end;    
    end;
{----FieldBoolean----} {Заполнение таблицы использования ячейки} {Ячейки еще не использовались}
procedure pFieldBool;
    begin
        for i:=1 to a do
            for j:=1 to b do
                BoolTable[i,j]:=false;
    end;
{----Line----} {"Рисование" линии}
procedure pLine(x1,y1,x2,y2:integer); {j=x}{i=y}
    var v:integer;
    begin
        if (y1=y2) and (x1=x2) then {Если точка}
            begin
                Table[y1,x1]:=1;
                exit;   
            end;

        if (y1=y2) and (x1<>x2) then {Если горизонтальная линия}
            begin

                if x1 > x2 then
                    begin
                        v:=x2;
                        x2:=x1;
                        x1:=v;
                    end;

                for i:=x1 to x2 do
                    Table[y1,i]:=1;
                exit;   

            end;

        if (y1<>y2) and (x1=x2) then {Если вертикальная линия}
            begin

                if y1 > y2 then
                    begin
                        v:=y2;
                        y2:=y1;
                        y1:=v;
                    end;

                for i:=y1 to y2 do
                    Table[i,x1]:=1;
                exit;   

            end;        

        if y1 < y2 then {Рисуем линию вверх или вниз}
            begin
                maxy:=y2;
                y:=y1;
            end 
        else
            begin
                maxy:=y1;
                y:=y2;  
            end;

        k:=(y1-y2)/(x1-x2); {Считаем уравнение прямой}
        t:=y1-k*x1;

        while y <= maxy do {Заполняем ячейки +1-ами}
            begin
                x:=(y-t)/k;
                if not BoolTable[round(y),round(x)] then {Проверка на "занятость" ячейки}
                    begin
                        inc(Table[round(y),round(x)]);
                        BoolTable[round(y),round(x)]:=true;
                    end;
                y:=y+0.0001; {Шаг}
            end;
    end;
{----RandomDots----}
procedure pRandomDots;	{t1, t3, t5 - x} {Выбираем 6 рандомных точек}
	begin				{t2, t4, t6 - y}
		randomize;
		repeat
			t1:=random(79)+1;
			t3:=random(79)+1;
			t5:=random(79)+1;
			t2:=random(24)+1;
			t4:=random(24)+1;
			t6:=random(24)+1;
		until not ((t1/t3 = t2/t4) and (t3/t5 = t4/t6)); {Эти точки не лежат на 1 прямой}

		repeat
			z1:=random(79)+1;
			z3:=random(79)+1;
			z5:=random(79)+1;
			z2:=random(24)+1;
			z4:=random(24)+1;
			z6:=random(24)+1;
		until not ((z1/z3 = z2/z4) and (z3/z5 = z4/z6)); {Эти точки не лежат на 1 прямой}
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