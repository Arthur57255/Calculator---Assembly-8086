   
.model tiny

		code    segment

        org     100h
        
        
largeur equ 200
hauteur_cadre_haut equ 50
hauteur_cadre_milieu equ 190

larbtn equ 20
hautbtn equ 20
        
start : 

		MOV AL, 13h ; Mode vidéo INT 10h-13h
		MOV AH, 0
		INT 10h
		
		MOV AH, 10h ; Couleur de fond INT 10h Fonction 10h Sous-fonction 10h
		MOV AL, 10h
		MOV CH, 145 ; vert
		MOV CL, 145 ; bleu
		MOV DH, 0 ; rouge
		INT 10h
		
		MOV DL, 14 ; Placement du mot "Calculatrice"
		MOV DH, 4
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, calc
		MOV AH, 9
		INT 21h
		
		MOV DL, 33 ; Placement du mot "+"
		MOV DH, 9
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, plus
		MOV AH, 9
		INT 21h
		
		MOV DL, 33 ; Placement du mot "-"
		MOV DH, 12
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, moins
		MOV AH, 9
		INT 21h
		
		MOV DL, 33 ; Placement du mot "*"
		MOV DH, 14
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, fois
		MOV AH, 9
		INT 21h
		
		MOV DL, 33 ; Placement du mot "/"
		MOV DH, 17
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, par
		MOV AH, 9
		INT 21h
		
		MOV DL, 33 ; Placement du mot "="
		MOV DH, 19
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, eg
		MOV AH, 9
		INT 21h
		
		MOV DL, 5; Placement du mot "1"
		MOV DH, 9
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, un
		MOV AH, 9
		INT 21h
		
		MOV DL, 5; Placement du mot "4"
		MOV DH, 14
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, quatre
		MOV AH, 9
		INT 21h
		
		MOV DL, 5; Placement du mot "7"
		MOV DH, 19
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, sept
		MOV AH, 9
		INT 21h
		
		MOV DL, 15; Placement du mot "2"
		MOV DH, 9
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, deux
		MOV AH, 9
		INT 21h
		
		MOV DL, 15; Placement du mot "5"
		MOV DH, 14
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, cinq
		MOV AH, 9
		INT 21h
		
		MOV DL, 15; Placement du mot "8"
		MOV DH, 19
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, huit
		MOV AH, 9
		INT 21h
		
		MOV DL, 25; Placement du mot "3"
		MOV DH, 9
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, trois
		MOV AH, 9
		INT 21h
		
		MOV DL, 25; Placement du mot "6"
		MOV DH, 14
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, six
		MOV AH, 9
		INT 21h
		
		MOV DL, 25; Placement du mot "9"
		MOV DH, 19
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, neuf
		MOV AH, 9
		INT 21h
		
		MOV DL, 0; Placement du mot "press"
		MOV DH, 21
		MOV AH, 2
		MOV BH, 0
		INT 10h
		
		LEA DX, press
		MOV AH, 9
		INT 21h
				
		; Dessin
		
		MOV CX, 100+largeur ; Depart X
		MOV DX, 10 ; Depart Y
		MOV AL, 15 ; Couleur
		
CardreHautLigneDessus : 

		MOV AH, 0Ch ; Fonction dessin pixel
		INT 10h
		
		DEC CX
		CMP CX, 20 ; Position arrivee X
		JAE CardreHautLigneDessus
		
		MOV CX, 100+largeur
		MOV DX, hauteur_cadre_haut
		MOV AL, 15
	
CardreHautLigneDessous : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 20
		JA CardreHautLigneDessous	

		MOV CX, 20
		MOV DX, hauteur_cadre_haut
		MOV AL, 15
		
CardreHautLigneGauche :

		MOV AH, 0Ch
		INT 10h 
		
		DEC DX
		CMP DX, 10
		JA CardreHautLigneGauche

    	MOV CX, 100+largeur   
    	MOV DX, hauteur_cadre_haut   
    	MOV AL, 15    
    
CadreHautLigneDroite: 

		MOV AH, 0ch   
    	INT 10h
    
    	DEC DX
    	CMP DX, 10
    	JA CadreHautLigneDroite 
    	
    	MOV CX, 100+largeur ; X
		MOV DX, 55 ; Y
		MOV AL, 15
	
CadreMilieuLigneHaut : 

		MOV AH, 0ch
		INT 10h
	
		DEC CX 
		CMP CX, 20 ; Arrive en X = 20
		JAE CadreMilieuLigneHaut

    	MOV CX, 100+largeur  ; X
    	MOV DX, hauteur_cadre_milieu   ; Y
    	MOV AL, 15  
       
CadreMilieuLigneBas : 

		MOV AH, 0ch    
    	INT 10h
    
    	DEC CX
    	CMP CX, 20 ; Arrive en X = 20
    	JA CadreMilieuLigneBas
    
    	MOV CX, 20    
    	MOV DX, hauteur_cadre_milieu   
    	MOV AL, 15     
    
CadreMilieuLigneGauche : 

		MOV AH, 0ch    ; put pixel
    	INT 10h
    
    	DEC DX
    	CMP DX, 10
    	JA CadreMilieuLigneGauche 

    	MOV CX, 100+largeur  ; x
    	MOV DX, hauteur_cadre_milieu   ; y
    	MOV AL, 15     ; white
    
CadreMilieuLigneDroite : 

		MOV AH, 0ch    
    	INT 10h
    
    	DEC DX
    	CMP DX, 10
    	JA CadreMilieuLigneDroite 
    	
    	MOV CX, 40+larbtn
    	MOV DX, 65
    	MOV AL, 15
    	
Btn1Haut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 30
		JA Btn1Haut
		
		MOV CX, 40+larbtn
		MOV DX, 65+hautbtn
		MOV AL, 15
	
Btn1Bas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 30
		JA Btn1Bas 
		
		MOV CX, 30
		MOV DX, 65+hautbtn
		MOV AL, 15
		
Btn1Gauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 64
		JA Btn1Gauche
		
		MOV CX, 40+larbtn
		MOV DX, 65+hautbtn
		MOV AL, 15
		
Btn1Droite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 65
		JA Btn1Droite 
		
		; --
		
    	MOV CX, 120+larbtn
    	MOV DX, 65
    	MOV AL, 15
    	
Btn2Haut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 110
		JA Btn2Haut
		
		MOV CX, 120+larbtn
		MOV DX, 65+hautbtn
		MOV AL, 15
	
Btn2Bas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 110
		JA Btn2Bas 
		
		MOV CX, 140
		MOV DX, 65+hautbtn
		MOV AL, 15
		
Btn2Gauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 64
		JA Btn2Gauche
		
		MOV CX, 90+larbtn
		MOV DX, 65+hautbtn
		MOV AL, 15
		
Btn2Droite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 64
		JA Btn2Droite		

		; --
  
    	MOV CX, 200+larbtn
    	MOV DX, 65
    	MOV AL, 15
    	
Btn3Haut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 190
		JA Btn3Haut
		
		MOV CX, 200+larbtn
		MOV DX, 65+hautbtn
		MOV AL, 15
	
Btn3Bas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 190
		JA Btn3Bas 
		
		MOV CX, 190
		MOV DX, 65+hautbtn
		MOV AL, 15
		
Btn3Gauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 64
		JA Btn3Gauche
		
		MOV CX, 200+larbtn
		MOV DX, 65+hautbtn
		MOV AL, 15
		
Btn3Droite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 64
		JA Btn3Droite 
		
		; --
		
    	MOV CX, 200+larbtn
    	MOV DX, 105
    	MOV AL, 15
    	
Btn4Haut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 190
		JA Btn4Haut
		
		MOV CX, 200+larbtn
		MOV DX, 105+hautbtn
		MOV AL, 15
	
Btn4Bas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 190
		JA Btn4Bas 
		
		MOV CX, 190
		MOV DX, 105+hautbtn
		MOV AL, 15
		
Btn4Gauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 104
		JA Btn4Gauche
		
		MOV CX, 200+larbtn
		MOV DX, 105+hautbtn
		MOV AL, 15
		
Btn4Droite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 104
		JA Btn4Droite
		
		; --   
 
    	MOV CX, 200+larbtn
    	MOV DX, 145
    	MOV AL, 15
    	
Btn5Haut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 190
		JA Btn5Haut
		
		MOV CX, 200+larbtn
		MOV DX, 145+hautbtn
		MOV AL, 15
	
Btn5Bas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 190
		JA Btn5Bas 
		
		MOV CX, 190
		MOV DX, 145+hautbtn
		MOV AL, 15
		
Btn5Gauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 144
		JA Btn5Gauche
		
		MOV CX, 200+larbtn
		MOV DX, 145+hautbtn
		MOV AL, 15
		
Btn5Droite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 144
		JA Btn5Droite
		
		; --
		
    	MOV CX, 120+larbtn
    	MOV DX, 105
    	MOV AL, 15
    	
Btn6Haut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 110
		JA Btn6Haut
		
		MOV CX, 120+larbtn
		MOV DX, 105+hautbtn
		MOV AL, 15
	
Btn6Bas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 110
		JA Btn6Bas 
		
		MOV CX, 140
		MOV DX, 105+hautbtn
		MOV AL, 15
		
Btn6Gauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 104
		JA Btn6Gauche
		
		MOV CX, 90+larbtn
		MOV DX, 105+hautbtn
		MOV AL, 15
		
Btn6Droite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 104
		JA Btn6Droite
		
		; -- 
		
    	MOV CX, 120+larbtn
    	MOV DX, 145
    	MOV AL, 15
    	
Btn7Haut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 110
		JA Btn7Haut
		
		MOV CX, 120+larbtn
		MOV DX, 145+hautbtn
		MOV AL, 15
	
Btn7Bas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 110
		JA Btn7Bas 
		
		MOV CX, 140
		MOV DX, 145+hautbtn
		MOV AL, 15
		
Btn7Gauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 144
		JA Btn7Gauche
		
		MOV CX, 90+larbtn
		MOV DX, 145+hautbtn
		MOV AL, 15
		
Btn7Droite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 144
		JA Btn7Droite	
		
		; --
		
		MOV CX, 40+larbtn
    	MOV DX, 105
    	MOV AL, 15
    	
Btn8Haut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 30
		JA Btn8Haut
		
		MOV CX, 40+larbtn
		MOV DX, 105+hautbtn
		MOV AL, 15
	
Btn8Bas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 30
		JA Btn8Bas 
		
		MOV CX, 30
		MOV DX, 105+hautbtn
		MOV AL, 15
		
Btn8Gauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 104
		JA Btn8Gauche
		
		MOV CX, 40+larbtn
		MOV DX, 105+hautbtn
		MOV AL, 15
		
Btn8Droite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 105
		JA Btn8Droite 
		
		; --
		
		MOV CX, 40+larbtn
    	MOV DX, 145
    	MOV AL, 15
    	
Btn9Haut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 30
		JA Btn9Haut
		
		MOV CX, 40+larbtn
		MOV DX, 145+hautbtn
		MOV AL, 15
	
Btn9Bas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 30
		JA Btn9Bas 
		
		MOV CX, 30
		MOV DX, 145+hautbtn
		MOV AL, 15
		
Btn9Gauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 144
		JA Btn9Gauche
		
		MOV CX, 40+larbtn
		MOV DX, 145+hautbtn
		MOV AL, 15
		
Btn9Droite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 145
		JA Btn9Droite 	
		
		; --
		
    	MOV CX, 260+larbtn
    	MOV DX, 65
    	MOV AL, 15
    	
BtnPHaut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 250
		JA BtnPHaut
		
		MOV CX, 260+larbtn
		MOV DX, 65+hautbtn
		MOV AL, 15
	
BtnPBas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 250
		JA BtnPBas 
		
		MOV CX, 250
		MOV DX, 65+hautbtn
		MOV AL, 15
		
BtnPGauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 64
		JA BtnPGauche
		
		MOV CX, 260+larbtn
		MOV DX, 65+hautbtn
		MOV AL, 15
		
BtnPDroite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 64
		JA BtnPDroite 
		
		; --
		
    	MOV CX, 260+larbtn
    	MOV DX, 105
    	MOV AL, 15
    	
BtnMHaut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 250
		JA BtnMHaut
		
		MOV CX, 260+larbtn
		MOV DX, 105+hautbtn
		MOV AL, 15
	
BtnMBas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 250
		JA BtnMBas 
		
		MOV CX, 250
		MOV DX, 105+hautbtn
		MOV AL, 15
		
BtnMGauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 64
		JA BtnMGauche
		
		MOV CX, 260+larbtn
		MOV DX, 105+hautbtn
		MOV AL, 15
		
BtnMDroite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 64
		JA BtnMDroite 
		
		; --
		
    	MOV CX, 260+larbtn
    	MOV DX, 145
    	MOV AL, 15
    	
BtnEHaut : 

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 250
		JA BtnEHaut
		
		MOV CX, 260+larbtn
		MOV DX, 145+hautbtn
		MOV AL, 15
	
BtnEBas :

		MOV AH, 0Ch
		INT 10h
		
		DEC CX
		CMP CX, 250
		JA BtnEBas 
		
		MOV CX, 250
		MOV DX, 145+hautbtn
		MOV AL, 15
		
BtnEGauche : 

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 64
		JA BtnEGauche
		
		MOV CX, 260+larbtn
		MOV DX, 145+hautbtn
		MOV AL, 15
		
BtnEDroite :

		MOV AH, 0Ch
		INT 10h
		
		DEC DX
		CMP DX, 64
		JA BtnEDroite 
		    	
    	; ---------------------
		
		MOV AH, 01h ; Attente d'une pression clavier pour la suite
		INT 21h
		
		; On recrer l'affichage pour effacer le contenu d'avant
		
		MOV AL, 13h ; Mode vidéo INT 10h-13h
		MOV AH, 0
		INT 10h
		
		MOV AH, 10h ; Couleur de fond INT 10h Fonction 10h Sous-fonction 10h
		MOV AL, 10h
		MOV CH, 145 ; vert
		MOV CL, 145 ; bleu
		MOV DH, 0 ; rouge
		INT 10h
		
		MOV AH, 09h
		LEA DX, bienvenue
		INT 21h
		
		MOV AH, 09h
		LEA DX, auteur
		INT 21h
		
		MOV AH, 09h
		LEA DX, commencer
		INT 21h
	
		MOV AH, 01h
		INT 21h
		

	  	JMP DEB

AJUST PROC

; conversion du resultat : ASCII ==> Décimal

        MOV AL, 30h ; 30h : code ASCII de 0
        OR  res+6, AL ; On réajuste pour chaque digits le nombre associé au code ASCII
        OR  res+5, AL
        OR  res+4, AL
        OR  res+3, AL
        CMP res+2, 09H ; si c'est un nombre alors on soustrait 30h pour associer le nombre au code ASCII
        JA AJUSTFIN
        OR  res+2, AL
        
AJUSTFIN:
        RET ; sinon on garde le "-"
AJUST ENDP
       
CRLF MACRO ; permet de sauter une ligne

        MOV AH, 02h
        MOV DL, 0Dh
        INT 21h
        MOV DL, 0Ah
        INT 21h
endm

VERIFQD MACRO ; verification que les nombres saisis ne depassent pas 4 digits

verifnb1:
           CMP nb1+1, 3h ; on verifie la taille du nombre
           JBE ajustementnb1 ; si la taille est en dessous ou egale à 3 alors on l'ajuste : ajoute de 0
           JMP fintraitementnb1 ; sinon : on passe a la verification du deuxieme nombre
          
ajustementnb1:  
           MOV AH, nb1+4 ; on effectue un décallage et on remplace les cases vides par 0
           MOV nb1+5, AH ; _123 ==> _0123
           MOV AH, nb1+3
           MOV nb1+4, AH
           MOV AH, nb1+2
           MOV nb1+3, AH
           MOV nb1+2, 00h ; ex : on rentre 25 ==> on obtient 0025
           INC nb1+1 ; on ajoute un digit de plus a nb1
           JMP verifnb1
       
fintraitementnb1:

verifnb2:
           CMP nb2+1, 3h ; on verifie la taille du nombre
           JBE ajustementnb2 ; si la taille est en dessous ou egale à 3 alors on l'ajuste : ajoute de 0 
           JMP choise

ajustementnb2 :  
           MOV AH, nb2+4 ; on effectue un décallage et on remplace les cases vides par 0
           MOV nb2+5, AH ;
           MOV AH, nb2+3
           MOV nb2+4, AH
           MOV AH, nb2+2
           MOV nb2+3, AH
           MOV nb2+2, 00h ; ex : on rentre 25 ==> on obtient 00025
           INC nb2+1 ; on ajoute un digit de plus a nb2
           JMP verifnb2

endm


AFFICHADD MACRO
        MOV AH, 09h
        LEA DX, resadd
        INT 21H   
        
        MOV CX, 5 ; Nombre d'octets à écrire

        MOV AH, 40h ; ; Fonction d'affichage
        LEA DX, res+2 ; On affiche à partir de cette adresse
        INT 21h
       
        CRLF
   
endm

AFFICHSOUS MACRO
        MOV AH, 09h
        LEA DX, ressous
        INT 21h
        
        MOV CX, 5 ; Nombre d'octets à écrire
       
        MOV AH, 40h
        LEA DX, res+2
        INT 21h
       
        CRLF
endm



DEB:

        MOV recupnum, 0 ; variable dite "booléene" qui détermine si les nombres sont récupérés ou non pour l'addition et soustraction

        MOV AH, 09h
        LEA DX, msgdebut
        INT 21h
        MOV AH, 01h
        INT 21h

        MOV choix, AL

        CMP choix, '1'
        JE additioninter
        CMP choix, '2'
        JE soustractioninter
        CMP choix, '3'
        JE multiplicationinter
        CMP choix, '4'
        JE divisioninter
        CMP choix, '5'
        JE piinter
        CMP choix, '6'
        JE carreinter
        CMP choix, '7'
        JE hexainter
        CMP choix, '8'
        JE fin

fin :

        MOV AH, 4Ch
        INT 21h

recupnum1 :

        CRLF

        MOV AH, 09h
        LEA DX, premier
        INT 21h

        MOV AH, 0Ah
        LEA DX, nb1
        INT 21h
       
        CRLF

        JMP recupnum2

additioninter:

    JMP addition

soustractioninter:

    JMP soustraction
   
multiplicationinter :

    JMP multiplication

divisioninter :

    JMP division
    
piinter : 
	
	JMP pi
	
hexainter : 

	JMP hexa
	
carreinter :

	JMP carre

recupnum2 :

        MOV AH, 09h
        LEA DX, deuxieme
        INT 21h
       
        MOV AH, 0Ah
        LEA DX, nb2
        INT 21h
       
        CRLF

        MOV recupnum, 1
        
        VERIFQD ; Appel de la MACRO qui ajuste les nombres sur 4 digits
       
choise :

        CMP choix, '1'
        JE additioninter
        CMP choix, '2'
        JE soustractioninter
        CMP choix, '3'
        JE multiplicationinter
        CMP choix, '4'
        JE divisioninter
        CMP choix, '5'
        JE piinter
        CMP choix, '6'
        JE carreinter
        CMP choix, '7'
        JE hexainter
        CMP choix, '8'
        JE fin

recupnuminter :

        JMP recupnum1

addition :

        CMP recupnum, 0
        JE recupnuminter

        MOV AL,  nb1+5
        ADD AL,  nb2+5
        AAA ; adjust ascii for addition : on converti les nombres pour l'addition
        MOV res+6, AL
        MOV AL,  nb1+4
        ADC AL,  nb2+4
        AAA
        MOV res+5, AL
        MOV AL,  nb1+3
        ADC AL,  nb2+3
        AAA
        MOV res+4, AL
        MOV AL,  nb1+2
        ADC AL,  nb2+2
        AAA
        MOV res+3, AL
        MOV AL, 0
        ADC AL, 0
        MOV res+2, AL
   
        CALL AJUST

        AFFICHADD

        JMP DEB

soustraction :

        CMP recupnum, 0
        JE recupnuminter
       
        MOV AH,nb1+2
        MOV AL,nb2+2        
        CMP AH,AL
        JG souspos
        JL sousneg
       
        MOV AH,nb1+3       
        CMP AH,nb2+3
        JG souspos
        JL sousneg
       
        MOV AH,nb1+4
        MOV AL,nb2+4        
        CMP AH,AL
        JG souspos
        JL sousneg
       
        MOV AH, nb1+5
        MOV AL, nb2+5        
        CMP AH, AL
        JG souspos
        JL sousneg

       
souspos :        
       
        MOV AL, nb1+5
        SUB AL, nb2+5
        AAS
        MOV res+6, AL
        MOV AL, nb1+4
        SBB AL, nb2+4
        AAS
        MOV res+5, AL
        MOV Al, nb1+3
        SBB AL, nb2+3
        AAS
        MOV res+4, AL
        MOV AL, nb1+2
        SBB AL, nb2+2
        AAS
        MOV res+3, AL
        MOV AL, 0
        SBB AL, 0
        MOV res+2, AL
       
        CALL AJUST

        AFFICHSOUS

        JMP DEB
       
sousneg :

        
        MOV AL,nb2+5
        SUB AL,nb1+5
        AAS
        MOV res+6,AL
        MOV AL, nb2+4
        SBB AL, nb1+4
        AAS
        MOV res+5, AL
        MOV Al, nb2+3
        SBB AL, nb1+3
        AAS
        MOV res+4, AL
        MOV AL, nb2+2
        SBB AL, nb1+2
        AAS
        MOV res+3, AL
        MOV AL, 0
        SBB AL, 0
        MOV res+2,AL
        MOV res+2,2Dh ; 2D est le code ascii du "-"

        CALL AJUST

        AFFICHSOUS

        JMP DEB
       
multiplication :

		CRLF

		LEA DX, premier ; entrer le premier nombre
		MOV AH, 09h
		INT 21h
		
		MOV BX, 0 ; on initialise BX à 0

recupnb1mul :

		MOV AH, 01h ; INT 21 - Fonction 01 : Permet de lire un caractère 
		INT 21h
		CMP AL, 0dh ; On compare le buffer au CR (Touche Entré) 
		JE entrer1mul ; Si la touche entré est presée, on passe à la saisie du deuxième nombre
		MOV AH, 0 ; Sinon on continu la saisie des autres chiffres
		SUB AL, 30h ; On soustrait 30 en héxa (48 en décimal) pour ne pas avoir le nombre en ASCII
		MOV tempmul1, AX 
		MOV AX, 10d ; AX := 10
		MUL BX 
		MOV BX, tempmul1 
		ADD BX, AX ; BX := BX + AX 
		JMP recupnb1mul ; On retourne à la saisie d'un caractère 

entrer1mul :

		MOV nb1mul, BX
		LEA DX, deuxieme
		MOV AH, 09h
		INT 21h

		MOV BX, 0

recupnb2mul :
 
		MOV AH, 01h ; Même procédure qu'au dessus
		INT 21h
		CMP AL, 0dh
		JE fairemul
		MOV AH, 0
		SUB AL, 30h
		MOV tempmul2, AX
		MOV AX, 10d
		MUL BX
		MOV BX, tempmul2
		ADD BX, AX
		JMP recupnb2mul

fairemul :
 
    	MOV AX, nb1mul 
    	MUL BX ; AX := BX * AX
    	
   		MOV ptfaible, AX 
    	MOV ptfort, DX 
    	
    	LEA DX, resaffmul
    	MOV AH, 09h
    	INT 21h
    	
    	MOV DX, ptfort  
    	MOV AX, ptfaible 
    	    	
    	JMP AffMul 

AffMul : ; Affichage de 8 digits au maximum (4 digits * 4 digits = resultat de 8 digits)

    	MOV BX, 10 ; BX := 10
    	PUSH BX ; On sauvegarde BX dans la pile
    	
ajumul : 

		MOV CX, AX ; CX := AX 															----------------------
    	MOV AX, DX ; AX := DX															| Les algorithmes en |	
    	MOV DX, 0 ;	On remet DX à 0									    				|  pseudo-code sont  |
    	DIV BX ; AX := quotient(AX / BX) 												|   dans le dossier  |
		XOR AX, CX ; 							           								----------------------
		XOR CX, AX ; Echange AX et CX
		XOR AX, CX ;
		
    	DIV BX ; AX prend la valeur du quotient et DX la valeur du reste
    	PUSH DX ; On sauvegarde DX dans la pile
    	MOV DX, CX ; DX := CX
    	OR CX, AX ; CX OU AX
    	JNZ ajumul ; Si CX OU AX n'est pas égale à 0 alors on retourne à l'étiquette ajmul
    	POP DX ; On récupère le sommet de la pile dans DX
    	
convers : 

		ADD DL, 30h ; On passe les nombres en mode affichage, 30h = 0
    	MOV AH, 02h 
    	INT 21h     
    	POP DX      
    	CMP DX, BX  ; Si DX < BX alors on continue la conversion
    	JB convers  
    	
    	CRLF
       
        JMP DEB 

division :

		CRLF

		LEA DX, premier ; entrer le premier nombre
		MOV AH, 09h
		INT 21h
		MOV BX, 0

recupnb1div :

		MOV AH, 01h ; Même procédure qu'au desssus
		INT 21h
		CMP AL, 0dh
		JE entrer1div
		MOV AH, 0
		SUB AL, 30h
		MOV tempdiv1, AX
		MOV AX, 10d
		MUL BX
		MOV BX, tempdiv1
		ADD BX, AX
		JMP recupnb1div


entrer1div :

		MOV nb1div, BX
		
		LEA DX, deuxieme
		MOV AH, 09h
		INT 21h

		MOV BX, 0

recupnb2div :

		MOV AH, 01h
		INT 21h
		CMP AL, 0dh
		JE fairediv
		MOV AH, 0
		SUB AL, 30h
		MOV tempdiv2, AX
		MOV AX, 10d
		MUL BX
		MOV BX, tempdiv2
		ADD BX, AX
		JMP recupnb2div

fairediv :

		MOV AX, nb1div
		MOV DX, 0 ; DX := 0 
		DIV BX  ; AX := quotient(AX / BX) 
		
		MOV quotient, AX 
		
		LEA DX, resaffdiv ; Affichage 
		MOV AH, 09h
		INT 21h
		
		MOV AX, quotient
		
		MOV CX, 0 ; CX := 0
		MOV DX, 0 ; DX := 0
		MOV BX, 10d ; BX := 10
		
		JMP suite

suite :

		MOV DX, 0 ; DX := 0
		DIV BX
		PUSH DX	
		MOV DX, 0 ; DX := 0
		INC CX ; CX := CX + 1, Nombre de digit à afficher 
		OR AX, AX
		JNE suite

AffDiv :

		POP DX
		ADD DL, 30h
		MOV AH, 02h
		INT 21h
		LOOP AffDiv
		
		CRLF
       
        JMP DEB
              
pi :   
 		
 		CRLF 
 		
 		MOV AH, 09h
 		LEA DX, valpi
 		INT 21h
 		
 		CRLF
 		
 		JMP DEB
 		
hexa : 

		CMP recupnum, 0
		JE recupnum1
		
DECEX1:

        MOV AX,0
        MOV CX,5
        LEA SI,nb1+4
   
DECHEX1:

        MUL DIXHEX
        ADD AL,[SI]
        ADC AH,0
        DEC SI
        DEC CX
        JNZ DECHEX1
        MOV nb1hex, AX ; supposé etre AX
       
DECEX2:

        MOV AX,0
        MOV CX,5
        LEA SI,nb2+4
   
DECHEX2:

        MUL DIXHEX
        ADD AL,[SI]
        ADC AH,0
        DEC SI
        DEC CX
        JNZ DECHEX2
        MOV nb2hex, AX ; supposé etre AX 
        
        ; -------------------
       
        MOV CX, 5
       
        MOV AH, 09h
        LEA DX, reshex1
        INT 21h
       
        MOV AH, 40h
        LEA DX, nb1hex
        INT 21h
       
        CRLF
        
        MOV CX, 5
       
        MOV AH, 09h
        LEA DX, reshex2
        INT 21h
       
        MOV AH, 40h
        LEA DX, nb2hex
        INT 21h
       
        CRLF  
 		
 		JMP DEB
 		
carre : 

		CRLF

		LEA DX, premier ; entrer le premier nombre
		MOV AH, 09h
		INT 21h
		
		MOV BX, 0 ; on initialise BX à 0

recupnb1car :

		MOV AH, 01h ; INT 21 - Fonction 01 : Permet de lire un caractère 
		INT 21h
		CMP AL, 0dh ; On compare le buffer au CR (Touche Entré) 
		JE fairecar ; Si la touche entré est presée, on passe à la saisie du deuxième nombre
		MOV AH, 0 ; Sinon on continu la saisie des autres chiffres
		SUB AL, 30h ; On soustrait 30 en héxa (48 en décimal) pour ne pas avoir le nombre en ASCII
		MOV tempcar1, AX 
		MOV AX, 10d ; AX := 10
		MUL BX 
		MOV BX, tempcar1 
		ADD BX, AX ; BX := BX + AX 
		JMP recupnb1car ; On retourne à la saisie d'un caractère 	
		
fairecar :

		MOV nb1car, BX

		MOV BX, nb1car
    	MOV AX, nb1car 
    	MUL BX ; AX := BX * AX
    	
   		MOV ptfaible, AX 
    	MOV ptfort, DX 
    	
    	LEA DX, resaffcar
    	MOV AH, 09h
    	INT 21h
    	
    	MOV DX, ptfort  
    	MOV AX, ptfaible 
    	    	
    	JMP AffCar

AffCar : ; Affichage de 8 digits au maximum (4 digits * 4 digits = resultat de 8 digits)

    	MOV BX, 10 ; BX := 10
    	PUSH BX ; On sauvegarde BX dans la pile
    	
ajucar : 

		MOV CX, AX ; CX := AX 															
    	MOV AX, DX ; AX := DX															
    	MOV DX, 0 ;	On remet DX à 0									    				
    	DIV BX ; AX := quotient(AX / BX) 												
		XOR AX, CX ; 							           								
		XOR CX, AX ; Echange AX et CX
		XOR AX, CX ;
		
    	DIV BX ; AX prend la valeur du quotient et DX la valeur du reste
    	PUSH DX ; On sauvegarde DX dans la pile
    	MOV DX, CX ; DX := CX
    	OR CX, AX ; CX OU AX
    	JNZ ajucar ; Si CX OU AX n'est pas égale à 0 alors on retourne à l'étiquette ajucar
    	POP DX ; On récupère le sommet de la pile dans DX
    	
converscar : 

		ADD DL, 30h ; On passe les nombres en mode affichage, 30h = 0
    	MOV AH, 02h 
    	INT 21h     
    	POP DX      
    	CMP DX, BX  ; Si DX < BX alors on continue la conversion
    	JB converscar			

		CRLF 

		JMP DEB
 		
 		; fin programme 
 		
 		MOV AH, 4Ch
        INT 21h
       
; Zone de données ;

commencer db 0Dh, 0Ah, "Appuyer sur une touche pour debuter !", 24h
       
bienvenue db "Bienvenue sur la calculatrice programmee en Assembleur 8086", 24h
auteur db 0Dh, 0Ah, "Ce programme a ete realise par FRANCOIS Arthur et DUDON Adrien", 24h

premier db "Saisir le premier nombre : ", 24h
nb1 db 5, ?, 5 DUP(?)

deuxieme db "Saisir le deuxieme nombre : ", 24h
nb2 db 5, ?, 5 DUP(?)

resadd db "Resultat de l'addition : ", 24h

res db 6, ?, 6 DUP(?)

ressous db "Resultat de la soustraction : ", 24h

recupnum db 1, ?, 1 DUP(?)
choix db 1, ?, 1 DUP(?)

msgdebut db 0Dh, 0Ah, "1) Addition ", 0Ah, "2) Soustraction", 0Ah, "3) Multiplication", 0Ah , "4) Division", 0Ah,"5) Pi", 0Ah, "6) Carre", 0Ah, "7) Decimal --> Hexadecimal (bug)",0Ah,"8) Fin", 0Ah, 0Ah, "Selectionner une operation : ", 24h  

valpi db "Valeur de pi : 3.1415", 24h
 
resaffmul db "Resultat de la multiplication : ", 24h
resaffdiv db "Resultat de la division : ", 24h
resaffcar db "Carre : ", 24h

tempmul1 dw ?
tempmul2 dw ?

tempcar1 dw ?

tempdiv1 dw ?
tempdiv2 dw ?

nb1div dw ?
nb1mul dw ?

nb1car dw ?

quotient dw ?

DIXHEX dw 0000AH
nb1hex dw ?
nb2hex dw ?

ptfaible dw ?
ptfort dw ?
dix dw ?

reshex1 db "Hexadecimal (1) : ", 24h
reshex2 db "Hexadecimal (2) : ", 24h

calc db "Calculatrice", 24h
plus db "+", 24h
moins db "-", 24h
fois db "*", 24h
par db "/", 24h
eg db "=", 24h

un db "1", 24h
deux db "2", 24h
trois db "3", 24h
quatre db "4", 24h
cinq db "5", 24h
six db "6", 24h
sept db "7", 24h
huit db "8", 24h
neuf db "9", 24h

press db "appuyer sur un touche (clavier) pour     continuer...", 24h
       
        code    ends

end start