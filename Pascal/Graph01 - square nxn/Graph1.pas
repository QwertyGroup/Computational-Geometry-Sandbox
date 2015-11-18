{graph 1 ex}
uses crt;
const	a = 20;
		b = 20;
var x, y, i, j: integer;

begin
 for i:=1 to b do
 	begin
 		for j:= 1 to a do write(char(249));
 		writeln;
 	end;
 for i:=1 to a do 
 	begin
 		gotoxy(i,i);	
 		write(char(248));
 		{write('\');}

 	end;
 	readln;
end.
