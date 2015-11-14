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
        a, b, r:integer;
        x, y:real;

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
                        1..1000:begin TextColor(11); write(char(248)); end; {1 - окружность }  
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
{----Circle----} {(x-a)^2+(y-b)^2 = r^2}
procedure pCircle;
    var i, j:real;
    begin
        while i <= n do
            while j<= m do 
                begin
                    if (sqr(j-a) + sqr(i-b) <= sqr(r)) then
                        inc(Table[round(i),round(j)]);
                    i:=i+0.1;
                    j:=j+0.1;    
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