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

.code
main PROC



	exit
main endp
end main



