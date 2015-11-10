{$IFDEF NORMAL}
  {$H-,I+,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF NORMAL}
{$IFDEF DEBUG}
  {$H-,I+,OBJECTCHECKS-,Q+,R+,S-}
{$ENDIF DEBUG}
{$IFDEF RELEASE}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF RELEASE}

{graph 5 - random triangle}

uses crt;

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