{graph 2 ex}
uses crt;
const	b = 11;	 {y}
		a = 2*b; {x}
var i, j: integer;
	 x, y: integer;
{----f(y)----}
{procedure f(a);
	begin
		f:=a		
	end;}
{----Main----}
begin
 for i:=1 to b do
 	begin
 		for j:= 1 to a do write(char(249));
 		writeln;
 	end;

 	x:=0;
 	y:=0;
 for i:=1 to b do 
 	begin
 		inc(x,2);
 		inc(y);
 		gotoxy(x,y);	
 		write(char(248));
 		gotoxy(x-1,y);	
 		write(char(248));
 	end;
 	readln;
end.
