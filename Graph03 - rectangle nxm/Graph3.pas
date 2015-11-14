{graph 3 ex}
uses crt;
const	b = 20;	{y}
		a = 37; {x}
var i, j: integer;
	 x, y: real;
{----Main----}
begin
 for i:=1 to b do
 	begin
 		for j:= 1 to a do write(char(249));
 		writeln;
 	end;

 	y:=0;
 while (y+0.1) < b do 
 	begin
 		y:=y+0.01;
 		x:=y*(a/b);
		gotoxy(round(x+0.5),round(y+0.5));
 		write(char(248));
 	end;
 	readln;
end.