{$IFDEF NORMAL}
  {$H-,I+,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF NORMAL}
{$IFDEF DEBUG}
  {$H-,I+,OBJECTCHECKS-,Q+,R+,S-}
{$ENDIF DEBUG}
{$IFDEF RELEASE}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF RELEASE}

{graph 4 ex}
uses	crt;

const	b = 79;{x} {79} 
		a = 24;{y} {24}

type	tt = array[1..a,1..b] of byte; 	
		ttb = array[1..a,1..b] of boolean; 

var 	Table:tt; 
		BoolTable:ttb; 
		i, j:integer;
		x, y:real;
		k, t:real;
		maxy:integer;
		F:text;
{----Field----}
procedure pField; 
	begin
		for i:=1 to a do
			for j:=1 to b do
				Table[i,j]:=0;
	end;	
{----TableWrite----}		
procedure pTWr; 
	begin
		for i:=1 to a do
			begin
				for j:=1 to b do
					case Table[i,j] of
						0:begin TextColor(7); write(char(249)); end;
						1:begin TextColor(11); write(char(248)); end;
						2:begin TextColor(11); write(char(248)); end;
						3:begin TextColor(11); write(char(248)); end;
					end;
				writeln;	
			end;	
	end;

procedure pTWrTest;
	begin
		assign(F,'Graph4.txt');
  		rewrite(F);
		for i:=1 to a do
			begin
				for j:=1 to b do
					case Table[i,j] of
						0:begin write(F,' '); end;
						1:begin write(F,'*'); end;
						2:begin write(F,'*'); end;
					end;
				writeln(F);	
			end;	
		close(F);
	end;
{----FieldBoolean----}	
procedure pFieldBool;
	begin
		for i:=1 to a do
			for j:=1 to b do
				BoolTable[i,j]:=false;
	end;
{----Line----}
procedure pLine(x1,y1,x2,y2:integer); {j=x}{i=y}
	var v:integer;
	begin
		if (y1=y2) and (x1=x2) then
			begin
				Table[y1,x1]:=1;
				exit;	
			end;

		if (y1=y2) and (x1<>x2) then
            begin

                if x1 > x2 then
                    begin
                        v:=x2;
                        x2:=x1;
                        x1:=v;
                    end;

                for i:=x1 to x2 do
                    Table[y1,i]:=1;
                exit;   

            end;

        if (y1<>y2) and (x1=x2) then
            begin

                if y1 > y2 then
                    begin
                        v:=y2;
                        y2:=y1;
                        y1:=v;
                    end;

                for i:=y1 to y2 do
                    Table[i,x1]:=1;
                exit;   
                
            end;        

		if y1 < y2 then 	
			begin
				maxy:=y2;
				y:=y1;
			end	
		else
			begin
				maxy:=y1;
				y:=y2;	
			end;

		k:=(y1-y2)/(x1-x2);
		t:=y1-k*x1;

		while y <= maxy do
			begin
				x:=(y-t)/k;
				if not BoolTable[round(y),round(x)] then
					begin
						inc(Table[round(y),round(x)]);
						BoolTable[round(y),round(x)]:=true;
					end;
				y:=y+0.0001;
			end;
	end;
{----Main----}
var t1,t2,t3,t4,t5,t6:integer;
	m:integer;

begin
	clrscr;
	TextColor(15);
	writeln('First dot (x,y):');
	read(t1,t2);
	writeln('Second dot (x,y):');
	read(t3,t4);
	writeln('Third dot (x,y):');
	read(t5,t6);
	clrscr;

	pField;
	pFieldBool;
	
	pLine(t1,t2,t3,t4);
	pFieldBool;

	pLine(t1,t2,t5,t6);
	pFieldBool;

	pLine(t3,t4,t5,t6);
	pFieldBool;

	pTWr;
	pTWrTest;

    write('(', t1, ' ', t2, ')', ' ', '(', t3, ' ', t4, ')', ' ', '(', t5, ' ', t6, ')'); {Для отладки}

	readln;
	readln;
end.
