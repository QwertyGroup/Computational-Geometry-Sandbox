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

uses 	crt;

const   m = 79;{x} {размеры поля}
        n = 24;{y} 

type	tt = array[1..n,1..m] of integer;      

var		Table:tt;
		i, j:integer;
{----Field----} {Заполнение таблицы нулями}
procedure pField;
    begin
        for i:=1 to n do
            for j:=1 to m do
                Table[i,j]:=0;
    end;
{----Main----}
begin

end.