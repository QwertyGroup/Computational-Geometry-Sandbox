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
                    id:byte;            {Номер точки                                                   }
                end;  

var     Table:Tt;
        i, j:integer;
        dot1:Tdot;
        dot2:Tdot;
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
                        1..2:begin TextColor(11); write(char(248)); end; {1 - точка   }
                    end;
                writeln;
            end;
    end;
{----DotAssignment----} {Задание параметров точки}
procedure pDotAssignment(var dot:Tdot);
    begin
        dot.x:= random(79)+1;
        dot.y:= random(24)+1;
        dot.velotsityX:= 5 - random(11);
        dot.velotsityY:= 5 - random(11);
    end;
{----PositionCalculation----} {Просчет позиции точки}
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
{----DotMotion----} {Движение точки}
procedure pDotMotion(var dot:Tdot);
    begin
        inc(Table[dot.y, dot.x]);
        pPosCalc(dot); 
    end;
{----Main----}
const   fr = 20;   {Кол-во кадров }
var     l:integer; {Счетчик кадров}
begin
    randomize;
    pDotAssignment(dot1); {Задание параметров 1 точки}
    pDotAssignment(dot2); {Задание параметров 2 точки}

    {BeginOfdeBugBlock}
    //pField;
    //dot2.x:=20;
    //dot2.y:=20;
    //dot2.velotsityX:=1;
    //dot2.velotsityY:=1;
    {EndOfdeBugBlock  }

    for l:=1 to fr do
        begin
            //pField;           {Заполнеие таблицы}
            pDotMotion(dot1); {Обработка 1 точки}
            pDotMotion(dot2); {Обработка 2 точки}
            clrscr;           {Чистим экран     }
            pTWr;             {Виводим таблицу  }
            delay(300);       {Ждем 0.3 секунды }
        end;

    {BeginOfdeBugBlock}
    //writeln(dot1.x);
    //writeln(dot1.y);
    //writeln(dot1.velotsityX);
    //writeln(dot1.velotsityY);
    {EndOfdeBugBlock  }

    readln;
end.