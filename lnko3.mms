d	GREG
a	GREG
b	GREG
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
	SET 	a,21
	SET	b,9
	SET	x,a
	SET	y,b
1H	OR	t,a,b
	AND	t,t,1
	BNZ	t,2F

3H	SL	d,d,1
	SR	a,a,1
	SR	b,b,1
	
	JMP 	1B

2H	AND	t,a,1
	AND	t,b,t
	BZ	t,7F
	SUB	a,a,b

7H	AND	t,a,1
	BZ	t,4F
	SET	x,a
	SET	y,b
	JMP	5F
4H	SET	x,b
	SET	y,a

5H	AND	t,y,1
	BNZ	t,6F
	SR	y,y,1
	JMP	5B

6H	CMP	t,x,y
	BNN	t,8F
	SET	a,x
	SET	x,y
	SET	y,a	
8H	SUB	x,x,y

	BNZ	x,5B
	
	MUL 	a,y,d
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
