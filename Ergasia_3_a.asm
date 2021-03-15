title 2d_array_addressing
INCLUDE Irvine32.inc

.data
	;τα μυνηματα που θα εμφανιζονται

	mCalculating BYTE "Calculating...",0dh,0ah,0
	mAccessElement byte "The value of the element a[2,2] is :",0
	mResultSum BYTE "The sum a[2,2]+z= :",0
	mResultDiff BYTE "The sum a[2,2]-z= :",0
	
	;Δηλωση πινακα

	array1 SWORD 00d,10d,20d,30d

	ElementsPerRow =($-array1)/ TYPE array1
		SWORD 01d,11d,21d,31d
		SWORD 02d,12d,22d,32d
		SWORD 03d,13d,23d,33d

		x BYTE 2d
		y BYTE 2d
		z SWORD -30d
.code 
main PROC
	;***ASKISI 1***
	MOV edx,OFFSET mCalculating ;Load edx with the mCalculating string OFFSET
	CALL WriteString	;Show message on sreen 

	;Calculating address of array(2,2)
	;the result will be 32bit hence the arthmetic operations
	;are performed on 32bit register

	;Effectiv address(r,c)=array+(r* ElementPerRow +c)* ElementSize
	;EBX(2,2)=array1+(ROW * 4 + COLUMN)*4

	MOVZX	ebx,x	;move the row number into ebx register  ;movzx επεκτηνει τον αριθμο με μηδενικα 
	SHL		ebx,2	;EBX=ROW*4
	MOVZX	ecx,y	;move the row number into ecx register
	ADD		ebx,ecx ;ebx=row * 4+column
	SHL		ebx,2	;ebx=(row * 4+column)*2
	 
	MOV		eax,[array1+ebx]			;mov designed array element to ECX using INDIRECT ADDRESSING	
	MOV		edx,OFFSET mAccessElement	;Load EDX with the mAccessElement string OFFSET
	CALL	WriteString					;Show message on sreen
	CALL	WriteInt					;Show the elenemnt value on Screen 
	CALL	Crif						;Go to next line

	MOVSX	ecx,z						;MOVE the value of z into ecx ;movsx λαμβανει το προσιμο
	ADD		eax,ecx						;EAX=22+ ECX=-8
	MOV		edx,OFFSET mResultSum		;Load EDX with the mResultSum string OFFSET
	CALL	WriteString					;Show message on sreen
	CALL	WriteInt					;Show the elenemnt value on Screen 
	CALL	Crif						;Go to next line

	MOV		eax,[array+ebx]				;MOVE the value of z into ebx
	sub		eax,ecx						;EAX = 22 - ecx =52
	mov		edx,OFFSET mResultDiff		;Load EDX with the mResultDiff string OFFSET
	CALL	WriteString					;Show message on sreen
	CALL	WriteInt					;Show the elenemnt value on Screen 
	CALL	Crif						;Go to next line

	;***ASKISI 2***
	MOV eax,[array1+13*4]				;MOVE designed array element to ECX	using DIRECT  ADDRESSING
	MOV edx,OFFSET mAccessElement		;Load edx with the mAccessElement	string OFFSET
	CALL	WriteString					;Show message on sreen
	CALL	WriteInt					;Show the elenemnt value on Screen 
	CALL	Crif						;Go to next line

	exit
main endp
end main



