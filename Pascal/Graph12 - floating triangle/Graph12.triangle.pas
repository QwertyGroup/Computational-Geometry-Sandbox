{$IFDEF NORMAL}
  {$H-,I+,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF NORMAL}
{$IFDEF DEBUG}
  {$H-,I+,OBJECTCHECKS-,Q+,R+,S-}
{$ENDIF DEBUG}
{$IFDEF RELEASE}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF RELEASE}

{graph 12 - 2 floating triangles with intersection}

uses    crt;

const   m = 79; {x} {Размеры поля}
        n = 24; {y}

type    Tt = array[1..n,1..m] of integer;
        Tdot = record
                    velocityX:integer; {Скорость точки по оси X                                       }
                    velocityY:integer; {Скорость точки по оси Y                                       }
                                        {Vy/Vx - tg угла между горизонтом и направлением движения точки}
                    x, y:integer;       {Начальние координаты точки                                    }
                    id:integer;         {Номер точки                                                   }
                end;

var     Table:Tt;
        i, j:integer;
        dot1:Tdot;  {1 точка}
        dot2:Tdot;  {2 точка}
        dot3:Tdot;  {3 точка}
        dot4:Tdot;  {4 точка}
        dot5:Tdot;  {5 точка}
        dot6:Tdot;  {6 точка}

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
                        3:begin TextColor(13); write(char(248)); end; {3 - пересечение 1 и 2 цветов}
                    end;
                writeln;
            end;
    end;
{----EqualsOrIncrease----}
procedure pEquOrInc(y, x, id:integer); {Пересечение ли ?}
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

        k:= (y1-y2) / (x1-x2);  {Коэффициент при x      }
        b:= y1 - k*x1;          {Коэффициент смещения   }

        if y2 > y1 then         {Если линия диагональная}
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
{----DotAssignment----} {Задание параметров точки}
procedure pDotAssignment(var dot:Tdot; id:integer);
    begin
        dot.x:= random(79)+1;
        dot.y:= random(24)+1;
        dot.velocityX:= 5 - random(11);
        dot.velocityY:= 5 - random(11);
        dot.id:=id;
    end;
{----PositionCalculation----} {Просчет позиции точки}
procedure pPosCalc(var dot:Tdot);
    begin
        dot.x:= dot.x + dot.velocityX;
        dot.y:= dot.y + dot.velocityY;

        if (dot.x >= m) or (dot.x <= 1) then
            dot.velocityX:= -dot.velocityX;
        if (dot.y >= n) or (dot.y <= 1) then
            dot.velocityY:= -dot.velocityY;

        if (dot.x > m) or (dot.x < 1) then
            dot.x:= dot.x + dot.velocityX;
        if (dot.y > n) or (dot.y < 1) then
            dot.y:= dot.y + dot.velocityY;
    end;
{----FillTriangle----}
procedure pFillTriangle(x1, y1, x2, y2, x3, y3, id:integer);    {Заливка треульника}
    var a, b, c:integer;
    begin
        for i:=1 to n do
            for j:=1 to m do
                begin
                    a:=(x1 - j) * (y2 - y1) - (x2 - x1) * (y1 - i);
                    b:=(x2 - j) * (y3 - y2) - (x3 - x2) * (y2 - i);
                    c:=(x3 - j) * (y1 - y3) - (x1 - x3) * (y3 - i);

                    if not ( (x1=x2) and (y1=y2) or (x1=x3) and (y1=y3) or (x2=x3) and (y2=y3) ) then
                        if ((a>=0) and (b>=0) and (c>=0)) or ((a<=0) and (b<=0) and (c<=0)) then
                            begin
                                if id = 1 then
                                    Table[i,j]:= id;
                                if (id = 2) and (Table[i,j] = 0) then
                                    Table[i,j]:= id
                                else if (id = 2) and (Table[i,j] = 1) then
                                    inc(Table[i,j], id);
                            end;
                end;
    end;
{----FirstTriangle----}
procedure pFirstTriangle;
    begin
        pPosCalc(dot1);                             {Обработка 1 точки}
        pPosCalc(dot2);                             {Обработка 2 точки}
        pPosCalc(dot3);                             {Обработка 3 точки}
        pLine(dot1.x, dot1.y, dot2.x, dot2.y, 1);   {1 сторона        }
        pLine(dot1.x, dot1.y, dot3.x, dot3.y, 1);   {2 сторона        }
        pLine(dot2.x, dot2.y, dot3.x, dot3.y, 1);   {3 сторона        }
        pFillTriangle(dot1.x, dot1.y, dot2.x, dot2.y, dot3.x, dot3.y, 1);   {Заливка 1 треульника}
    end;
{----SecondTriangle----}
procedure pSecondTriangle;
    begin
        pPosCalc(dot4);                             {Обработка 4 точки}
        pPosCalc(dot5);                             {Обработка 5 точки}
        pPosCalc(dot6);                             {Обработка 6 точки}
        pLine(dot4.x, dot4.y, dot5.x, dot5.y, 2);   {1 сторона        }
        pLine(dot4.x, dot4.y, dot6.x, dot6.y, 2);   {2 сторона        }
        pLine(dot5.x, dot5.y, dot6.x, dot6.y, 2);   {3 сторона        }
        pFillTriangle(dot4.x, dot4.y, dot5.x, dot5.y, dot6.x, dot6.y, 2);   {Заливка 2 треульника}
    end;
{----TableWriteDeBug----}
procedure pTWrdBug;
    begin
        for i:=1 to n do
            begin
                for j:=1 to m do
                    write(Table[i,j]);
                writeln;
            end;
    end;
{----frames----}
const   fr = 360;            {Кол-во кадров             }
        del = 300;           {Время ожиданя             }
var     l:integer;           {Счетчик кадров            }
        log:text;            {log - deBug log           }
{----deBug----}
procedure pDeBug;
    begin
        write(l, ' / ', fr);            {screen}

        writeln(log, l:3, ' / ', fr:3); {log file}
        writeln(log, '1: (', dot1.x:3, ' ; ', dot1.y:3, ')');
        writeln(log, '2: (', dot2.x:3, ' ; ', dot2.y:3, ')');
        writeln(log, '3: (', dot3.x:3, ' ; ', dot3.y:3, ')');
        writeln(log,'');
        writeln(log, '4: (', dot4.x:3, ' ; ', dot4.y:3, ')');
        writeln(log, '5: (', dot5.x:3, ' ; ', dot5.y:3, ')');
        writeln(log, '6: (', dot6.x:3, ' ; ', dot6.y:3, ')');
        writeln(log,'');
    end;
{----Main----}
begin
    readln;
    randomize;               {Подрубаем рандом          }
    pDotAssignment(dot1,1);  {Задание параметров 1 точки}
    pDotAssignment(dot2,2);  {Задание параметров 2 точки}
    {}
    //dot1.velocityX:=0;
    //dot1.velocityY:=0;
    //dot1.x:=12;
    //dot1.y:=10;
    //dot2.velocityX:=0;
    //dot2.velocityY:=0;
    //dot2.x:=12;
    //dot2.y:=9;
    {}
    pDotAssignment(dot3,3);  {Задание параметров 3 точки}
    pDotAssignment(dot4,4);  {Задание параметров 4 точки}
    pDotAssignment(dot5,5);  {Задание параметров 5 точки}
    pDotAssignment(dot6,6);  {Задание параметров 6 точки}

    assign(log,'triangle.log.txt');
    rewrite(log);

    for l:=1 to fr do
        begin
            pField;          {Заполнеие таблицы         }
            pFirstTriangle;  {Рисуем 1 треугольник      }
            pSecondTriangle; {Рисуем 2 треугольник      }
            //clrscr;          {Чистим экран              }
            gotoxy(1,1);
            pTWr;            {Виводим таблицу           }
            //pTWrdBug;
            pDeBug;
            delay(del);      {Ждем del ms               }
        end;

    close(log);

    readln;
end.
