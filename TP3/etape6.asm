    ;Initialisation des vecteurs;
    
    org $4
Vector_001 dc.l Main

    ;Programme principal;
    
    org $550
    
Main movea.l #String1,a0
    jsr Atoui

    movea.l #String2,a0
    jsr Atoui

    illegal
    
    ;Sous-Programme;
    
Atoui   movem.l d1/a0,-(a7)
    
    clr.l d0
    clr.l d1
\loop
    move.b (a0)+,d1
    beq \quit

    subi.b #'0',d1

    mulu.w #10,d0
    add.l d1,d0
    bra \loop
    
\quit movem.l (a7)+,d1/a0
    rts

    ;Données;
    
String1 dc.b "1234",0
String2 dc.b "678907",0
