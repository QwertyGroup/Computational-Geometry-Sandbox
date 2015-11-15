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
        Tdot = record
                    velotsityX:integer; {Скорость точки по оси X                                       }
                    velotsityY:integer; {Скорость точки по оси Y                                       }
                                        {Vy/Vx - tg угла между горизонтом и направлением движения точки}
                    x, y:integer;       {Начальние координаты точки                                    }
                    id:byte;            {Номер точки                                                   }
                end;  

var     Table:Tt;
        i, j:integer;
        dot1:Tdot;
        dot2:Tdot;
        dot3:Tdot;
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
                        0:begin TextColor(7);  write(char(249)); end; {0 - пустота }
                        1:begin TextColor(11); write(char(248)); end; {1 - точка   }
                        2:begin TextColor(14); write(char(248)); end; {2 - точка   }
                        3:begin TextColor(13); write(char(248)); end; {3 - точка   }
                    end;
                writeln;
            end;
    end;
{----Main----}
begin

end.