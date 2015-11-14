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
{----TableWrite----} {Вывод таблицы} {переводим цифры в символы}
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

    end;
{----Main----}
begin
    pDotAssignment(dot1);

    {BeginOfdeBugBlock}
    
    {EndOfdeBugBlock  }

    readln;
end.