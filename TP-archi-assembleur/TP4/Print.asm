; ==============================
; Initialisation des vecteurs
; ==============================

	org $0
	
vector_000 dc.l $ffb500
vector_001 dc.l Main


; ==============================
; Programme principal
; ==============================

	org $500
	
Main lea sTest,a0
	move.b #24,d1
	move.b #20,d2
	jsr Print
	
	illegal
	
; ==============================
; Sous-programmes
; ==============================

Print move.l a0,-(a7)
	bra \loop

\loop move.b (a0)+,d0
	beq \quit
	jsr PrintChar
	add.l #1,d1
	bra \loop

\quit move.l (a7)+,a0
	rts
	
PrintChar incbin "PrintChar.bin"

; ==============================
; Données
; ==============================

sTest dc.b "Hello World",0
