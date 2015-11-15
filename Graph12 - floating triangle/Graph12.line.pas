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
                        0:begin TextColor(7);  write(char(249)); end; {0 - пустота               }
                        1:begin TextColor(11); write(char(248)); end; {1 - линия синего цвета    }
                        2:begin TextColor(14); write(char(248)); end; {2 - линия желтого цвета   }
                    end;
                writeln;
            end;
    end;
{----Line----}
procedure pLine(x1, y1, x2, y2, id:integer);
    var x, y:real;
        k:real;
        b:real;
    begin
        if (x1 = x2) or (y1 = y2) then
            begin
                Table[y1,x1]:= id;
                exit;
            end;

        k:= (y1-y2) / (x1-x2);
        b:= y1 - k*x1;

        for i:=y1 to y2 do 
            begin
                y:= i;
                x:= (y-b) / k;
                Table[round(y),round(x)]:= id;
            end;
    end;
{----Main----}
var ar1, ar2, ar3, ar4:integer;
begin
    read(ar1 ,ar2 ,ar3 ,ar4);
    pField;
    pLine(ar1 ,ar2 ,ar3 ,ar4 ,1);
    pTWr;
    readln;
    readln;
end.