	;Initialisation des vecteurs;
	
	org $4
Vector_001 dc.l Main

	;Programme principal;
	
	org $500
	
Main movea.l #String1,a0
	jsr RemoveSpace

	movea.l #String2,a0
	jsr IsCharError
	
	movea.l #String3,a0
	jsr IsCharError

	movea.l #String4,a0
	jsr IsMaxError
	

	illegal


	;Sous-Programmes;

	
RemoveSpace movem.l d0/a1/a0,-(a7)
		
	move.l #$650,a1   ;la ou on va stocker la bonne string, on pointe vers l'adresse $650
	

	clr.l d0
	
\loop move.b (a0)+,d0
	beq \quit
	
	cmp.b #' ',d0
	beq \loop
	
	move.b d0,(a1)+   ;on ajoute d0.b -> a1 et on incremente le pointeur
	bra \loop
	
\quit movem.l (a7)+,d0/a1/a0
	rts




IsCharError movem.l d0/a0,-(a7)
	clr.l d0
	
\loop move.b (a0)+,d0
	beq \false
	
	cmp.b #'0',d0
	blo \true

	cmp.b #'9',d0
	bhi \true
	bra \loop
	
\true ori.b #%00000100,ccr   ; Positionne le flag Z à 1 (true).
	bra \quit
	
\false andi.b #%11111011,ccr ; Positionne le flag Z à 0 (false).
	bra \quit
	
\quit movem.l (a7)+,d0/a0
	rts



IsMaxError movem.l a0/a1/a2/d0/d1,-(a7)
           move.l a0,a1
           movea.l #String5,a2
           clr.l d0

\StrLen move.b (a0)+,d1       ;Compte le nombre de caracteres dans a0.
    beq \check
    add.l #1,d0
    bra \StrLen

\check
    clr.l d1
    cmp.l #$5,d0
    bhi \false
    beq \compare
    blo \true

\compare add.l #1,d1
         cmp.b (a2)+,(a1)+
         bhi \false
         blo \true
         cmp.b d0,d1
         blo \compare

\false ori.b #%00000100,ccr
       bra \quit

\true andi.b #%11111011,ccr
      bra \quit

\quit movem.l (a7)+,a0/a1/a2/d0/d1
    illegal
    

	;Donnees;
	
String1 dc.b " 5 +  12* 3 ",0
String2 dc.b "512",0
String3 dc.b "5a12",0
String4 dc.b "32766",0
String5 dc.b "32767",0