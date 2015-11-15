{$IFDEF NORMAL}
  {$H-,I+,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF NORMAL}
{$IFDEF DEBUG}
  {$H-,I+,OBJECTCHECKS-,Q+,R+,S-}
{$ENDIF DEBUG}
{$IFDEF RELEASE}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF RELEASE}

{graph 12 - floating triangle (line)}

uses    crt;

const   m = 79; {x} {Размеры поля}
        n = 24; {y} 

type    Tt = array[1..n,1..m] of integer; 

var     Table:Tt;
        i, j:integer;

{----Field----} {Заполнение таблицы нулями}
procedure pField;
    begin
        for i:=1 to n do
            for j:=1 to m do
                Table[i,j]:= 0;
    end;
{----TableWrite----} {Вывод таблицы} {Переводим цифры в символы}
procedure pTWr;
    begin
        for i:=1 to n do
            begin
                for j:=1 to m do
                    case Table[i,j] of
                        0:begin TextColor(7);  write(char(249)); end; {0 - пустота                 }
                        1:begin TextColor(11); write(char(248)); end; {1 - линия синего цвета      }
                        2:begin TextColor(14); write(char(248)); end; {2 - линия желтого цвета     }
                        3..6:begin TextColor(13); write(char(248)); end; {3 - пересечение 1 и 2 цветов}
                    end;
                writeln;
            end;
    end;
{----EqualsOrIncrease----}
procedure pEquOrInc(y, x, id:integer);
    begin
        if id = 1 then
            Table[y,x]:= id;
        if (id = 2) and (Table[y,x] = 0) then
            Table[y,x]:= id
        else if (id = 2) and (Table[y,x] = 1) then
            inc(Table[y,x], id);
    end;
{----Line----}
procedure pLine(x1, y1, x2, y2, id:integer);
    var x, y:real;
        k:real;
        b:real;
    begin
        if (x1 = x2) and (y1 = y2) then {Если точка              }
            begin
                pEquOrInc(y1, x1, id);
                exit;
            end;

        if (x1 = x2) and (y2 > y1) then {Если вертикальная линия }
            begin
                for i:=y1 to y2 do
                    pEquOrInc(i, x1, id);
                exit;
            end
        else if (x1 = x2) and (y2 < y1) then
            begin
                for i:=y2 to y1 do
                    pEquOrInc(i, x1, id);
                exit;
            end;

        if (y1 = y2) and (x2 > x1) then {Если горизонтальная линия }
            begin
                for j:=x1 to x2 do
                    pEquOrInc(y1, j, id);
                exit;
            end
        else if (y1 = y2) and (x2 < x1) then
            begin
                for j:=x2 to x1 do
                    pEquOrInc(y1, j, id);
                exit;
            end;

        k:= (y1-y2) / (x1-x2);
        b:= y1 - k*x1;

        if y2 > y1 then
            for i:=y1 to y2 do 
                begin
                    y:= i;
                    x:= (y-b) / k;
                    pEquOrInc(round(y), round(x), id);
                end
        else if y2 < y1 then 
            for i:=y2 to y1 do
                begin
                    y:= i;
                    x:= (y-b) / k;
                    pEquOrInc(round(y), round(x), id);
                end;

        if x2 > x1 then
            for j:=x1 to x2 do 
                begin
                    x:= j;
                    y:= k*x + b;
                    pEquOrInc(round(y),round(x), id);
                end
        else if x2 < x1 then
            for j:= x2 to x1 do 
                begin
                    x:= j;
                    y:= k*x + b;
                    pEquOrInc(round(y),round(x), id);
                end;
    end;
{----Main----}
var ar1, ar2, ar3, ar4:integer;
begin
    clrscr;
    read(ar1 ,ar2 ,ar3 ,ar4);
    clrscr;
    pField;
    pLine(ar1 ,ar2 ,ar3 ,ar4 ,1);
    pLine(1, 1, 79, 24, 2);
    pTWr;
    readln;
    readln;
end.