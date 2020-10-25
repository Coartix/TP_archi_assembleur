    org $4
Vector_001 dc.l Main
    org $500
Main movea.l #STRING,a0  ; Initialise A0 avec l'adresse de la chaîne.
    
    clr.l d0
    clr.l d1

StrLen move.b (a0)+,d1       ;Compte le nobmre de caracteres dans STRING.
    beq quit
    add.l #1,d0
    bra StrLen

quit illegal

    org $550

STRING dc.b "Cette",0