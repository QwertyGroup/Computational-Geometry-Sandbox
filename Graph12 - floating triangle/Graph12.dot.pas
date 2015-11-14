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
                    x0, y0:integer;     {Начальние координаты точки                                    }
                end;  

var     Table:Tt;
        i, j:integer;
        dot1:Tdot;
{----Field----} {Заполнение таблицы нулями}
procedure pField;
    begin
        for i:=1 to n do
            for j:=1 to m do
                Table[i,j]:=0;
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
        dot.x0:=random(79)+1;
        dot.y0:=random(24)+1;
        dot.velotsityX:=random(5)+1;
        dot.velotsityY:=random(5)+1;
    end;
{----Main----}
begin
    pDotAssignment(dot1);

    {BeginOfdeBugBlock}
    //writeln(dot1.x0);
    //writeln(dot1.y0);
    //writeln(dot1.velotsityX);
    //writeln(dot1.velotsityY);
    {EndOfdeBugBlock  }

    readln;
end.