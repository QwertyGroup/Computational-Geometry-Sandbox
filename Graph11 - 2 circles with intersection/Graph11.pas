{$IFDEF NORMAL}
  {$H-,I+,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF NORMAL}
{$IFDEF DEBUG}
  {$H-,I+,OBJECTCHECKS-,Q+,R+,S-}
{$ENDIF DEBUG}
{$IFDEF RELEASE}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF RELEASE}

{graph 11 - 2 circles with intersection}

uses crt;

const   m = 79;{x} {79} {Размеры поля}
        n = 24;{y} {24}

type    tt = array[1..n,1..m] of integer;  {тип двумерного массива}    

var     Table:tt; {Таблица - то, что будем выводить}
        i, j:integer;
        a1, b1, r1:integer;
        a2, b2, r2:integer;

{----Field----} {Заполнение таблицы нулями}
procedure pField;
    begin
        for i:=1 to n do
            for j:=1 to m do
                Table[i,j]:=0;
    end;
{----TableWrite----} {Вывод таблицы} {переводим цифры в символы}
procedure pTWr;
    begin
        for i:=1 to n do
            begin
                for j:=1 to m do
                    case Table[i,j] of
                        0:begin TextColor(7); write(char(249)); end;  {0 - пустота                 }
                        1:begin TextColor(7); write(char(249)); end;  {1 - пустота                 }
                        2:begin TextColor(7); write(char(249)); end;  {2 - пустота                 }    
                        3:begin TextColor(13); write(char(248)); end; {3 - пересечение окружностей }
                        4:begin TextColor(11); write(char(248)); end; {4 - контур 1 окружности     }
                        5:begin TextColor(14); write(char(248)); end; {5 - контур 2 окружности     }
                        6:begin TextColor(13); write(char(248)); end; {6 - пересечение окружностей }
                        9:begin TextColor(13); write(char(248)); end; {9 - пересечение окружностей }
                    end;
                writeln;
            end;
    end;
{----TableWriteTest----} {Вывод таблицы} {без перевода цифр в символы}
procedure pTWrTest;
    begin
        for i:=1 to n do
            begin
                for j:=1 to m do
                    write(Table[i,j]);
                writeln;    
            end;    
    end;    
{----Circle----} {(x-a)^2+(y-b)^2 = r^2} {Прорисовка круга}
procedure pCircle(a, b, r:integer);
    begin
        for i:=1 to n do 
            for j:=1 to m do 
                if (sqr(j-a) + sqr(i-b) <= sqr(r)) then
                    inc(Table[i,j]);       
    end;
{----CircleOutline----}
procedure pOutline(a, b, r:integer);
    begin
        for i:=1 to n do 
            for j:=1 to m do 
                if (sqr(j-a) + sqr(i-b) <= sqr(r)) and (sqr(j-a) + sqr(i-b) > sqr(r-1)) then
                    inc(Table[i,j],3);
    end; 
{----Main----}
begin
    clrscr; {Чистим окно}
    write('Please enter x1, y1, r1: '); {Данные для 1 круга}
    readln(a1, b1, r1);
    write('Please enter x2, y2, r2: '); {Данные для 2 круга}
    read(a2, b2, r2);
    clrscr; {Чистим окно}

    pField; {Заполняем таблицу}
    pCircle(a1, b1, r1); {Рисуем 1 круг} 
    pCircle(a2, b2, r2); {Рисуем 2 круг}
    pCircle(a2, b2, r2); {Другой цвет для 2 круа}
    pOutline(a1, b1, r1); {Контур 1 круга}
    pOutline(a2, b2, r2); {Контур 2 круга}

    pTWr; {Выводим таблицу на монитор}
    //pTWrTest; {Выводим числовую таблицу на монитор}

    readln;
    readln;
end.