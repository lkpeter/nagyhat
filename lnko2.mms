d	GREG
a	GREG
x	GREG
y	GREG
num	GREG
q	GREG
r	GREG
ret	GREG

t	IS	$255
ta	IS	$255
tb	IS	$255

	LOC Data_Segment
	GREG @
pref	BYTE 	"LNKO: ",0
line	BYTE	#a,0
BUF	OCTA

	LOC	#100
Main	SET	d,1
	SET 	x,252
	SET	y,105
1H	AND	ta,x,1
	AND	tb,y,1
	OR	t,ta,tb
	BZ	t,2F

3H	SL	d,d,1
	SR	x,x,1
	SR	y,y,1
	
	JMP 	1B


2H	SET 	a,d

	LDA 	t,pref
	TRAP	0,Fputs,StdOut
	SET	num,a
	SET	ret,@+8
	JMP 	pnum
	LDA	t,line
	TRAP	0,Fputs,StdOut
	TRAP	0,Halt,0
pnum	LDA	t,BUF+7
	SET	r,0
	STBU	r,t,0
0H	SUB 	t,t,1
	DIV 	num,num,10
	GET 	r,rR
	INCL	r,'0'
	STBU	r,t,0
	PBNZ	num,0B
	TRAP	0,Fputs,StdOut
	GO	ret,ret,0
