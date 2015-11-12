{$IFDEF NORMAL}
  {$H-,I+,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF NORMAL}
{$IFDEF DEBUG}
  {$H-,I+,OBJECTCHECKS-,Q+,R+,S-}
{$ENDIF DEBUG}
{$IFDEF RELEASE}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF RELEASE}

{graph 9 - circle}

uses crt;

const   b = 79;{x} {79}
        a = 24;{y} {24}

type    tt = array[1..a,1..b] of integer;      
        ttb = array[1..a,1..b] of boolean;

var     Table:tt;
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
                        0:begin TextColor(7); write(char(249)); end;         {0 - пустота                  }
                        1:begin TextColor(11); write(char(248)); end;        {1 - весь 1 треугольник       }                    
                        {10:begin TextColor(14); write(char(248)); end;}      
                        {11..15:begin TextColor(14); write(char(248)); end;} 
                        {20..40:begin TextColor(14); write(char(248)); end;}  
                        {41..80:begin TextColor(14); write(char(248)); end;}
                        2:begin TextColor(14); write(char(248)); end;        {2 - стороны 2 треугольника   }
                        5:begin TextColor(14); write(char(248)); end;        {5 - внутрь 2 треугольника    }
                        6:begin TextColor(13); write(char(248)); end;        {6 - пересечение треугольников}
                        7..9:begin TextColor(14); write(char(248)); end;     {2 - стороны 2 треугольника   }
                        //3..4:begin TextColor(14); write(char(248)); end;        {}

                    end;
                writeln;    
            end;    
    end;