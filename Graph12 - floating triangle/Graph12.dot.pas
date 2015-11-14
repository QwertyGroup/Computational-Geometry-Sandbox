{$IFDEF NORMAL}
  {$H-,I+,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF NORMAL}
{$IFDEF DEBUG}
  {$H-,I+,OBJECTCHECKS-,Q+,R+,S-}
{$ENDIF DEBUG}
{$IFDEF RELEASE}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF RELEASE}

{graph 12 - floating triangle}

uses    crt;

const   m = 79; {x} {Размеры поля}
        n = 24; {y} 

type    Tt = array[1..n,1..m] of integer; 
        Tdot = record
                    velotsityX:integer; {Скорость точки по оси X                                       }
                    velotsityY:integer; {Скорость точки по оси Y                                       }
                                        {Vy/Vx - tg угла между горизонтом и направлением движения точки}
                    x, y:integer;       {Начальние координаты точки                                    }
                end;  

var     Table:Tt;
        i, j:integer;
        dot1:Tdot;
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
                        0:begin TextColor(7); write(char(249)); end;  {0 - пустота }
                        1:begin TextColor(11); write(char(248)); end; {1 - точка   }
                    end;
                writeln;
            end;
    end;
{----DotAssignment----} {Задание параметров точки}
procedure pDotAssignment(var dot:Tdot);
    begin
        randomize;
        dot.x:= random(79)+1;
        dot.y:= random(24)+1;
        dot.velotsityX:= 5 - random(11);
        dot.velotsityY:= 5 - random(11);
    end;
{----PositionCalculation----}
procedure pPosCalc(var dot:Tdot);
    begin
        dot.x:= dot.x + dot.velotsityX;
        dot.y:= dot.y + dot.velotsityY;

        if (dot.x >= m) or (dot.x <= 1) then
            dot.velotsityX:= -dot.velotsityX;
        if (dot.y >= n) or (dot.y <= 1) then
            dot.velotsityY:= -dot.velotsityY;

        if (dot.x > m) or (dot.x < 1) then
            dot.x:= dot.x + dot.velotsityX;
        if (dot.y > n) or (dot.y < 1) then
            dot.y:= dot.y + dot.velotsityY;

    end;
{----Test----}
procedure pTest;
    begin
        //pField;
        inc(Table[dot1.y, dot1.x]);
        clrscr;
        pTWr;
        pPosCalc(dot1);
        delay(50);
        end;
{----Main----}
var l:integer;
begin
    pDotAssignment(dot1);
    {BeginOfdeBugBlock}
    pField;
    {EndOfdeBugBlock  }

    for l:=1 to 50 do
        pTest;
    {BeginOfdeBugBlock}
    //writeln(dot1.x);
    //writeln(dot1.y);
    //writeln(dot1.velotsityX);
    //writeln(dot1.velotsityY);
    {EndOfdeBugBlock  }

    readln;
end.

if (dot.x > m) then
            begin
                dot.x:= m;
                dot.y:= -round(dot.velotsityY / 2);
            end;
        if (dot.x < 1) then
            begin
                dot.x:= 1;
                dot.y:= -round(dot.velotsityY / 2);
            end;

        if (dot.y > n) then
            begin
                dot.y:= n;
                dot.x:= -round(dot.velotsityX / 2);
            end;
        if (dot.y < 1) then
            begin
                dot.y:= 1;
                dot.x:= -round(dot.velotsityX / 2);
            end;