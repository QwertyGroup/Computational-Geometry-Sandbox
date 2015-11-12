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

const   m = 79;{x} {79} {Размеры поля}
        n = 24;{y} {24}

type    tt = array[1..n,1..m] of integer;  {тип двумерного массива}    

var     Table:tt; {Таблица - то, что будем выводить}
        i, j:integer;
        x, y, a, b, r:integer;

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
                        0:begin TextColor(7); write(char(249)); end;  {0 - пустота    }
                        1:begin TextColor(11); write(char(248)); end; {1 - окружность }  
                        2:begin TextColor(11); write(char(248)); end; {2 - окружность }
                        3:begin TextColor(11); write(char(248)); end; {2 - окружность }                 
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
{----Positive f(y)----}    
function fyPos(y:integer):integer;
    var f:real;
    begin
        f:=sqrt(sqr(r) - sqr(y-b)) + a;
        fyPos:=round(f);
    end;
{----Positive f(x)----}    
function fxPos(x:integer):integer;
    var f:real;
    begin
        f:=sqrt(sqr(r) - sqr(x-a)) + b;
        fxPos:=round(f);
    end;   
{----Negative f(y)----}    
function fyNeg(y:integer):integer;
    var f:real;
    begin
        f:= -1*(sqrt(sqr(r) - sqr(y-b))) + a;
        fyNeg:=round(f);
    end;
{----Negative f(x)----}    
function fxNeg(x:integer):integer;
    var f:real;
    begin
        f:= -1*(sqrt(sqr(r) - sqr(x-a))) + b;
        fxNeg:=round(f);
    end;       
{----Circle----} {(x-a)^2+(y-b)^2 = r^2}
procedure pCircle;
    begin

        for i:=(b-r) to (b+r) do 
            begin
                y:=i;
                x:=fyPos(y);
                inc(Table[x,y]);
                x:=fyNeg(y);
                inc(Table[x,y]);
            end;

        for i:=(a-r) to (a+r) do 
            begin
                x:=i;
                y:=fxPos(x);
                inc(Table[x,y]);
                y:=fxNeg(x);
                inc(Table[x,y]);
            end;
                
    end;
{----Main----}    
begin
    clrscr; {Чистим окно}
    write('Please enter x, y, r: ');
    read(a, b, r);
    clrscr;

    pField; {Заполняем таблицу}
    pCircle; {Рисуем круг} 
    pTWr; {Выводим таблицу на монитор}
    //pTWrTest; {Выводим числовую таблицу на монитор}

    readln;
    readln;
end.