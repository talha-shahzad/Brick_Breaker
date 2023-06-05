.model small
.stack 100h


.data

stvar db 0

note1 db 'PRESS I OR i','$'
note2 db 'PRESS BACKSPACE TO MOVE TO MENU','$'
note3 db 'PRESS ENTER TO START GAME','$'
note4 db 'PRESS E OR SPACE TO END GAME FROM MENU','$'
note5 db 'PRESS RIGHT OR LEFT KEY TO MOVE PADDLE','$'
note6 db 'PRESS H TO DISPLAY HIGHSCORES','$'
note7 db 'PRESS ENTER TO CONTINUE ','$'
note8 db 'PRESS P OR p TO PAUSE GAME','$'

hs1 db 'THERE IS NOTHING TO SHOW','$'

realname db 'Scavenger','$'

entername db 'ENTER YOUR NAME :','$'
inputname db 10 DUP (0)

greatest db 5
great db 6
lop db 15

timevar db 0
temp dw 50
moves1 dw 0
moves2 dw 0

color db 0

score dw 0
bricks dw 30
level db 1

heartinc dw 0
heartc db 0

address dw 0
address2 dw 0
address3 dw 0
address4 dw 0
address5 dw 0
address7 dw 0
address8 dw 0
addressb dw 0

mover dw 100
mover2 dw 10

line1x dw 80
line2x dw 215
liney dw 0

nami1 dw 60
nami2 dw 60

life dw 3

up1 dw 0
down1 dw 0

up2 dw 0
down2 dw 0

dbtype1 db 0
dbtype2 db 0

fall1 dw 0
fall2 dw 0

rese dw 0

words dw 0

remover1 dw 0
remover2 dw 0

resc db 2 dup(0),'$'
blop db 5
ball1 dw 150
ball2 dw 170
tempor dw 0
checker dw 0
storer dw 17 DUP (0),'$'
g db 10	
frost dw 0

np1 db 0
np2 db 0

padd1 dw 0
padd2 dw 0

paddl dw 0

namd1 dw 0
namd2 dw 0

b1 db 1
b2 db 1
b3 db 1
b4 db 1
b5 db 1
b6 db 1
b7 db 1
b8 db 1
b9 db 1
b10 db 1
b11 db 1
b12 db 1
b13 db 1
b14 db 1
b15 db 1
b16 db 1
b17 db 1
b18 db 1
b19 db 1
b20 db 1
b21 db 1
b22 db 1
b23 db 1
b24 db 1
b25 db 1
b26 db 1
b27 db 1
b28 db 1
b29 db 1
b30 db 1

fob db 0


filename db 'score.txt',0
filer dw 0
text_to_be_stored db 50 DUP (0),'$'

n db 'BRICK BREAKER','$'
s db 'Start','$'
h db 'High score','$'
i db 'Instructions','$'
e db 'Exit','$'
sc db 'SCORE:','$'
lev db 'LEVEL:','$'
nm db 'NAME:','$'
win db 'YOU WIN','$'
lose db 'GAME OVER:(','$'
ps db 'PAUSED','$'
w db 'WELCOME','$'

.code
main proc
mov ax,@data
mov ds,ax
mov ax,0

mov al,13h
int 10h


call nameinput

lastdafa:


mov greatest, 5
 mov great,  6
mov lop , 15

mov level,1
mov moves1 , 0
mov moves2 , 0
mov ball1 , 150
 mov ball2 , 170

mov life,3
mov heartinc,0
mov bricks,30
mov temp,0

mov b1,1
mov b2,1
mov b3,1
mov b4,1
mov b5,1
mov b6,1
mov b7,1
mov b8,1
mov b9,1
mov b10,1
mov b11,1
mov b12,1
mov b13,1
mov b14,1
mov b15,1
mov b16,1
mov b17,1
mov b18,1
mov b19,1
mov b20,1
mov b21,1
mov b22,1
mov b23,1
mov b24,1
mov b25,1
mov b26,1
mov b27,1
mov b28,1
mov b29,1
mov b30,1





mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 100
MOV DL, 100
MOV BH, 00h
INT 10h


mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0

mov line1x , 80
mov line2x , 215
mov liney , 0
mov mover,  100
mov mover2 , 10
mov greatest, 5
mov great , 6
mov lop , 15
mov temp , 0
mov moves1 , 0
mov moves2  ,0



call menu
again:

mov ah,1
int 16h
 jz again
 mov ah,0
 int 16h
 
 cmp al,13
je html
cmp al,32
je exit
cmp al,'e'
je exit

.if(al=='i' || al=='I')
call instruct
jmp lastdafa
.elseif(al=='h' || al=='H')
call highscore
jmp lastdafa
.endif


jmp again

html:
mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 100
MOV DL, 100
MOV BH, 00h
INT 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov score,0

call boxes


jmp lastdafa

exit:	
mov ah,4ch
int 21h
main endp


menu proc


pop address

mov ax,0
mov bx,0
mov cx,0
mov dx,0



;changing background color

MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 100
MOV DL, 100
MOV BH, 68h
INT 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

MOV AH, 06h
MOV AL, 0
MOV Cx, 10
MOV DH, 30
MOV DL, 26
MOV BH, 70h
INT 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0


; printing right and left boundry line 


lin1:

mov ah,0ch
mov al,10
mov cx,line1x
mov dx,liney
int 10h

inc liney

cmp liney,200
jne lin1


mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov liney,0

lin2:

mov ah,0ch
mov al,10
mov cx,line2x
mov dx,liney
int 10h

inc liney

cmp liney,200
jne lin2

mov line1x,0
mov liney,0
lin3:

mov ah,0ch
mov al,10
mov cx,line1x
mov dx,liney
int 10h

inc liney

cmp liney,200
jne lin3


mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov line2x,319
mov liney,0

lin4:

mov ah,0ch
mov al,10
mov cx,line2x
mov dx,liney
int 10h

inc liney

cmp liney,200
jne lin4


;printing above line of heading

push mover
l1:

mov ah,0ch
mov al,10
mov cx,mover
mov dx,mover2
int 10h

inc mover

cmp mover,200
jne l1


pop mover

mov ax,0
mov bx,0
mov cx,0
mov dx,0

; printing names of player

MOV AH,02H
MOV DH, 0
MOV DL, 28 
INT 10H


lea dx,inputname
mov ah,09h
int 21h



; printing names of option of menu

mov ax,0
mov bx,0
mov cx,0
mov dx,0

MOV AH,02H
MOV DH, 2
MOV DL, 12 
INT 10H


lea dx,n
mov ah,09h
int 21h

push mover
add mover2,20
l2:

mov ah,0ch
mov al,10
mov cx,mover
mov dx,mover2
int 10h

inc mover

cmp mover,200
jne l2

pop mover


add mover2,25

; printing hexagons


mov ax,mover2
mov down1, ax

;up base line
mov ax,0
mov bx,0
mov cx,0
mov dx,0
push mover
l3:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover

cmp mover,200
jne l3
je next

; down base line
next:
mov ax,mover
mov up1,ax

pop mover
push mover


mov ax,0
mov bx,0
mov cx,0
mov dx,0

add mover2,10
mov ax,mover2
mov down2,ax
mov ax,0

l4:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover

cmp mover,200
jne l4
je next3

next3:
mov ax,mover
mov up2,ax

pop mover
push mover

mov ax,up1
mov mover,ax

mov ax,down1
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

l6:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
inc mover

cmp mover2,60
jne l6
je next4

next4:

mov ax,60
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

l7:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
dec mover

mov si,down2

cmp mover2,si
jne l7
je next6

next6:

pop mover
push mover

mov ax,down1
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

li:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
dec mover

cmp mover2,60
jne li
je next7

next7:

mov ax,60
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

ll:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
inc mover

mov si,down2
cmp mover2,si
jne ll

;printing option name

mov ax,0
mov bx,0
mov cx,0 
mov dx,0


MOV AH,02H
MOV DH, 7
MOV DL, 16
INT 10H

mov ah,09h
lea dx,s
int 21h



; 2ND HEXAGON BIENG CREATED

mov mover,100		;start from 100
mov mover2,80	;start from down to start

mov ax,mover2
mov down1, ax

;up base line
mov ax,0
mov bx,0
mov cx,0
mov dx,0
push mover
l3i:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover

cmp mover,200
jne l3i
je nexti

; down base line
nexti:
mov ax,mover
mov up1,ax

pop mover
push mover


mov ax,0
mov bx,0
mov cx,0
mov dx,0

add mover2,10
mov ax,mover2
mov down2,ax
mov ax,0

l4i:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover

cmp mover,200
jne l4i
je next3i

next3i:
mov ax,mover
mov up2,ax

pop mover
push mover

mov ax,up1
mov mover,ax

mov ax,down1
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

l6i:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
inc mover

cmp mover2,85
jne l6i
je next4i

next4i:

mov ax,85
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

l7i:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
dec mover

mov si,down2

cmp mover2,si
jne l7i
je next6i

next6i:

pop mover
push mover

mov ax,down1
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

lii:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
dec mover

cmp mover2,85
jne lii
je next7i

next7i:

mov ax,85
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

lli:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
inc mover

mov si,down2
cmp mover2,si
jne lli


mov ax,0
mov bx,0
mov cx,0 
mov dx,0


MOV AH,02H
MOV DH, 10
MOV DL, 14
INT 10H

mov ah,09h
lea dx,h
int 21h


; PRINTING 3RD HEXAGON


mov mover,100		;start from 100
mov mover2,105	;start from down to start

mov ax,mover2
mov down1, ax

;up base line
mov ax,0
mov bx,0
mov cx,0
mov dx,0
push mover
l3j:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover

cmp mover,200
jne l3j
je nextj

; down base line
nextj:
mov ax,mover
mov up1,ax

pop mover
push mover


mov ax,0
mov bx,0
mov cx,0
mov dx,0

add mover2,10
mov ax,mover2
mov down2,ax
mov ax,0

l4j:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover

cmp mover,200
jne l4j
je next3j

next3j:
mov ax,mover
mov up2,ax

pop mover
push mover

mov ax,up1
mov mover,ax

mov ax,down1
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

l6j:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
inc mover

cmp mover2,110
jne l6j
je next4j

next4j:

mov ax,110
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

l7j:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
dec mover

mov si,down2

cmp mover2,si
jne l7j
je next6j

next6j:

pop mover
push mover

mov ax,down1
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

lij:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
dec mover

cmp mover2,110
jne lij
je next7j

next7j:

mov ax,110
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

llj:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
inc mover

mov si,down2
cmp mover2,si
jne llj


mov ax,0
mov bx,0
mov cx,0 
mov dx,0


MOV AH,02H
MOV DH, 13
MOV DL, 13
INT 10H

mov ah,09h
lea dx,i
int 21h



; PRINTING 3RD HEXAGON


mov mover,100		;start from 100
mov mover2,125	;start from down to start

mov ax,mover2
mov down1, ax

;up base line
mov ax,0
mov bx,0
mov cx,0
mov dx,0
push mover
l3k:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover

cmp mover,200
jne l3k
je nextk

; down base line
nextk:
mov ax,mover
mov up1,ax

pop mover
push mover


mov ax,0
mov bx,0
mov cx,0
mov dx,0

add mover2,10
mov ax,mover2
mov down2,ax
mov ax,0

l4k:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover

cmp mover,200
jne l4k
je next3k

next3k:
mov ax,mover
mov up2,ax

pop mover
push mover

mov ax,up1
mov mover,ax

mov ax,down1
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

l6k:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
inc mover

cmp mover2,130
jne l6k
je next4k

next4k:

mov ax,130
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

l7k:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
dec mover

mov si,down2

cmp mover2,si
jne l7k
je next6k

next6k:

pop mover
push mover

mov ax,down1
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

lik:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
dec mover

cmp mover2,130
jne lik
je next7k

next7k:

mov ax,130
mov mover2,ax

mov ax,0
mov bx,0
mov cx,0
mov dx,0

llk:
mov ah,0ch
mov al,0Eh
mov cx,mover
mov dx,mover2
int 10h
inc mover2
inc mover

mov si,down2
cmp mover2,si
jne llk


mov ax,0
mov bx,0
mov cx,0 
mov dx,0


MOV AH,02H
MOV DH, 16
MOV DL, 16
INT 10H

mov ah,09h
lea dx,e
int 21h


MOV AH,02H
MOV DH, 20
MOV DL, 13
INT 10H

mov ah,09h
lea dx,note1
int 21h



push address

ret
menu endp

; printing boxes in game
;------------------------------------------->>>>>>  LEVEL 1  <<<<<<--------------------------------------------------------

boxes proc

pop addressb



;making upper line in game mode

mov ax,0
mov bx,0
mov cx,0
mov dx,0

MOV AH, 06h
MOV AL, 0
MOV Cx, 0
MOV DH, 1
MOV DL, 100
MOV BH, 75h
INT 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0



MOV AH,02H
MOV DH, 0
MOV DL, 15
INT 10H

mov ah,09h
lea dx,sc
int 21h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

MOV AH,02H
MOV DH, 0
MOV DL, 30
INT 10H

mov ah,09h
lea dx,lev
int 21h

mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH,02H
MOV DH, 0
MOV DL, 36
INT 10H

mov ah,02h
mov dl,level
add dl,30h
int 21h


mov ax,0
mov bx,0
mov cx,0
mov dx,0

call heartdis

add heartinc,8
call heartdis

add heartinc,8
call heartdis


mov heartinc,0

; making of boxes 



stoper:


mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov si,10

mov color,0
mov di,60
mov greatest,5
mov great,6
mov lop,15


greatestlop:

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,10
add moves2,20

greatlop:

push di
inc color
mov ax,0
mov bx,0
mov cx,0
.if(color==6)
mov color,9
.endif

mainw:

mov moves1,si

mov ax,moves2
add ax,1
mov moves2,ax

l2:

mov ah,0ch
mov al,color
mov cx,moves1
mov dx,moves2
int 10h
inc moves1
cmp moves1,di
jne l2

sub lop,1
cmp lop,0
jne mainw

add moves1,5
mov si,moves1
mov ax,temp
mov moves2,ax
add moves2,20
mov lop,15
pop di
add di,50

dec great


cmp great,0
jne greatlop


mov moves1,0
mov si,moves1
mov di,60
add temp,17
mov ax,temp
mov moves2,ax
mov lop,15
mov color,0
mov great,6


mov ax,0
mov bx,0
mov cx,0
mov dx,0


dec greatest
cmp greatest,0
jne greatestlop


; making the moving paddle

mov moves2,180
mov moves1,120

mov si,moves1
mov di,200


mov bx,moves1
mov padd1,bx
mov bx,moves2
mov padd2,bx
mov paddl,di

mov lop,5

movingpad:

maint:

mov moves1,si
mov ax,moves2
add ax,1
mov moves2,ax

l2t:

mov ah,0ch
mov al,06h
mov cx,moves1
mov dx,moves2
int 10h
inc moves1
cmp moves1,di
jne l2t

sub lop,1
cmp lop,0
jne maint


;ball code


mov blop,3
mov bx, ball2
mov tempor, bx
mov si, ball1
push ball1
mov di, ball1
add di, 3


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0



man:
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

lg1 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne lg1

sub blop, 1
cmp blop, 0
jne man

mov si, 0


; moving the ball <------------------------------------------->

kj :

mov ah,02ch
int 21h
mov timevar,dl
mov ax,0

mov ah, 1
int 16h
jz ghomo
jnz hd

ghomo:


mov ah,02ch
int 21h
cmp timevar,dl
je ghomo
mov ax,0


mov bx, tempor
mov ball2, bx
pop ball1

push ball1
mov di, ball1
add di, 4

mov blop, 4

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0



man2:
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

lg2 :

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne lg2

sub blop, 1
cmp blop, 0

jne man2

; replacing with new ball location



add di, 4

pop ball1
add ball1, 4
push ball1

mov blop, 4
sub tempor, 4

mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

man3:
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

lg3 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne lg3

sub blop, 1
cmp blop, 0
jne man3



; making boundry for ball

cmp ball1, 305
jg aggla
cmp ball2, 25
jl aggla2
cmp ball2,185
jg endline
cmp ball1,15
jl aggla

;----------------------------------------------random falling object




;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1==1 )

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20
dec b1

call remover

inc score
 call display 

dec bricks
.if(bricks==0)

jmp damn

.endif

jmp aggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2

call remover
inc score
 call display 
 
 dec bricks
.if(bricks==0)

jmp damn

.endif

jmp aggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

call remover
inc score
 call display 
 dec bricks
.if(bricks==0)

jmp damn

.endif

jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,90
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71

dec b4

call remover
inc score
 call display 
 dec bricks
.if(bricks==0)

jmp damn

.endif

jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,90
mov bx,105
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b5==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,88

dec b5

call remover
inc score
 call display 
 dec bricks
 
.if(bricks==0)
jmp damn
.endif

 
jmp aggla2
.endif
;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6==1 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

call remover
inc score
 call display 
 dec bricks
.if(bricks==0)

jmp damn

.endif

jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

call remover
inc score
 call display 
 dec bricks
.if(bricks==0)

jmp damn

.endif

jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

call remover
inc score
 call display 
 dec bricks
.if(bricks==0)

jmp damn

.endif

jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9
inc score
 call display 
 dec bricks
.if(bricks==0)

jmp damn

.endif

call remover

jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b10==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b10

call remover

inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif

jmp aggla2
.endif

;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11==1 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b15==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b15

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif



;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16==1 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b20==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b20

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif



;_________________________________________________________5rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21==1 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b24

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b25==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b25

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26==1 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b26

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b29

call remover
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b30==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b30

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif



jmp kj

hd:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn

.if(al=='P' || al=='p')
call pausemenu
.endif

mov bh,0
push bx
call movingpaddle

jmp kj


tj :

mov ah,02ch
int 21h
mov timevar,dl
mov ax,0

mov ah, 1
int 16h
jz aggla
jnz hf

aggla :


mov ah,02ch
int 21h
cmp timevar,dl
je aggla
mov ax,0



mov blop, 4
mov bx, tempor
mov ball2, bx
pop ball1

mov di, ball1
add di, 4
push ball1


man4 :
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

lg4 :

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne lg4

sub blop, 1
cmp blop, 0
jne man4

; creating new ball

pop ball1
mov di, ball1
sub ball1, 4
push ball1

mov blop, 4
sub tempor, 4

mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

man5:
pop ball1

push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

lg5 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne lg5

sub blop, 1
cmp blop, 0
jne man5

; creating boundry for ball

cmp ball1, 15
jl ghomo
cmp ball1, 305
jg aggla2
cmp ball2,180
jg endline
cmp ball2,25
jl aggla3

mov ax,moves1
mov bx,moves2

.if(ball1>= ax && ball2>=bx)
jmp ghomo
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1==1 )

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20
dec b1

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,90
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71

dec b4

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,90
mov bx,105
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b5==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,88

dec b5

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif


  





jmp aggla2
.endif
;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6==1 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b10==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b10

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif

;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11==1 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b15==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b15

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif



;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16==1 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b20==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b20

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif


;_________________________________________________________5rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21==1 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b24

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b25==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b25

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif


;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26==1 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b26

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b29

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b30==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b30

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


jmp tj

hf:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn
.if(al=='P' || al=='p')
call pausemenu
.endif
mov bh,0
push bx
call movingpaddle


jmp tj


rj:
mov ah,2ch
int 21h
mov timevar,dl
mov ax,0

mov ah, 1
int 16h
jz aggla2
jnz hg


aggla2 :


mov ah,2ch
int 21h
cmp timevar,dl
je aggla2

mov blop, 4
mov bx, tempor
mov ball2, bx
pop ball1

mov di, ball1
add di, 4
push ball1


man6 :
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

lg6 :

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne lg6

sub blop, 1
cmp blop, 0
jne man6

; creating new ball


pop ball1
mov ball1, di
add di, 4
push ball1

mov blop,4


add tempor, 4
mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0


man7:
pop ball1

push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

lg7 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne lg7

sub blop, 1
cmp blop, 0
jne man7

; making boundry for ball

cmp ball1, 15
jl aggla2
cmp ball1, 305
jg aggla3
cmp ball2,185
jg endline
cmp ball2,25
jl aggla2

mov ax,moves1
mov bx,moves2
mov si,bx
sub bx,8
mov cx,ax
add ax,8
sub cx,80

;main ------------------------------------------------------------------------------------------------->

.if( (ball2>=bx && ball2<=si) && (ball1<=ax && ball1>=cx ))
jmp ghomo
.endif

;-------------------------->>>> falling object <<<<<<<---------------------------------------------------




;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1==1 )

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20
dec b1

call remover
inc score
 call display 
jmp aggla2

.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,90
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71

dec b4

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,90
mov bx,105
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b5==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,88

dec b5

call remover
inc score
 call display 
  dec bricks

.if(bricks==0)
jmp damn
.endif


jmp aggla2
.endif
;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6==1 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b10==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b10

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif


;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11==1 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b15==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b15

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif



;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16==1 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
 
jmp aggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b20==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b20

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif


;_________________________________________________________5rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21==1 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b24

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b25==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b25

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif


;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26==1 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b26


call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b29

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b30==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b30

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla
.endif



jmp rj

hg:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn
.if(al=='P' || al=='p')
call pausemenu
.endif
mov bh,0
push bx
call movingpaddle

jmp rj


oj:
mov ah,02ch
int 21h
mov timevar,dl

mov ah, 1
int 16h
jz aggla3
jnz hj


aggla3:


mov ah,02ch
int 21h
cmp timevar,dl
je aggla3

mov blop, 4
mov bx, tempor
mov ball2, bx
pop ball1

mov di, ball1
add di, 4
push ball1


man8 :
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

lg8:

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne lg8
sub blop, 1
cmp blop, 0
jne man8

;creating new ball location

pop ball1
mov  di,ball1
sub ball1, 4
push ball1

mov blop, 4


add tempor, 4
mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0


man9:
pop ball1

push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

lg9 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne lg9

sub blop, 1
cmp blop, 0
jne man9

; making boundry for ball


cmp ball2,185
jge endline
cmp ball2,15
jl aggla2
cmp ball1,305
jg aggla2
cmp ball1,10
jl aggla2



mov ax,moves1
mov bx,moves2
mov si,bx
sub bx,8
mov cx,ax
add ax,8
sub cx,80

;main ------------------------------------------------------------------------------------------------->

.if( (ball2>=bx && ball2<=si) && (ball1<=ax && ball1>=cx ))
jmp aggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1==1 )

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20
dec b1

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,90
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71

dec b4

call remover
inc score
 call display
 dec bricks
.if(bricks==0)
jmp damn
.endif 
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,90
mov bx,105
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b5==1 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,88

dec b5

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6==1 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b10==1 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b10

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11==1 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
 
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b15==1 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b15

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16==1 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b20==1 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b20

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;_________________________________________________________5rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21==1 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b24

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b25==1 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b25

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,40
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26==1 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b26

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,55
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,70
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b29

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b30==1 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b30

call remover
inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn
.endif
jmp aggla2
.endif


jmp oj

hj:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn
.if(al=='P' || al=='p')
call pausemenu
.endif
mov bh,0
push bx
call movingpaddle

jmp oj



endline:

call soundoff
sub life ,1
cmp life,0
je damn

call heartdisapear
add heartinc,8

jmp ghomo



damn:

.if(life==0)
call finish
.endif

.if(bricks<=0)
call boxes2
.endif

push addressb
ret
boxes endp


;---------------------------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------------------------------------------
;---------------------------->>>>>>>>>>>>>>>>>>>>>>>> LEVEL 2 <<<<<<<<<<<<<<<<<<<<<<<<------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------------------




boxes2 proc

pop address7



mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 100
MOV DL, 100
MOV BH, 00h
INT 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov up1, 0
mov down1, 0

mov up2, 0
mov down2, 0

mov ball1,150
mov ball2,170


mov mover  ,100
mov mover2 ,10

mov temp,0

mov life,3
mov heartinc,0
mov bricks,30
mov level,2

mov b1,2
mov b2,2
mov b3,2
mov b4,2
mov b5,2
mov b6,2
mov b7,2
mov b8,2
mov b9,2
mov b10,2
mov b11,2
mov b12,2
mov b13,2
mov b14,2
mov b15,2
mov b16,2
mov b17,2
mov b18,2
mov b19,2
mov b20,2
mov b21,2
mov b22,2
mov b23,2
mov b24,2
mov b25,2
mov b26,2
mov b27,2
mov b28,2
mov b29,2
mov b30,2

mov remover2,0
mov remover2,0

mov tempor,0
mov color ,1



;making upper line in game mode


mov ax,0
mov bx,0
mov cx,0
mov dx,0

MOV AH, 06h
MOV AL, 0
MOV Cx, 0
MOV DH, 1
MOV DL, 100
MOV BH, 75h
INT 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0



MOV AH,02H
MOV DH, 0
MOV DL, 15
INT 10H

mov ah,09h
lea dx,sc
int 21h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

MOV AH,02H
MOV DH, 0
MOV DL, 30
INT 10H

mov ah,09h
lea dx,lev
int 21h

mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH,02H
MOV DH, 0
MOV DL, 36
INT 10H

mov dx,0
mov ah,02h
mov dl,level
add dl,30h
int 21h


mov ax,0
mov bx,0
mov cx,0
mov dx,0

call heartdis

add heartinc,8
call heartdis

add heartinc,8
call heartdis


mov heartinc,0

; making of boxes 

mov moves1,0
mov moves2,0
stoper2:

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov si,10

mov color,0
mov di,60
mov greatest,5
mov great,6
mov lop,15


greatestlop2:

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,10
add moves2,20



greatlop2:

push di

add color,3
.if(color>=10 && color<=16)
add color,6
.endif
.if(color>=7 && color<=9)
add color,80
.endif

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mainw2:

mov moves1,si

mov ax,moves2
add ax,1
mov moves2,ax

l22:

mov ah,0ch
mov al,color
mov cx,moves1
mov dx,moves2
int 10h
inc moves1
cmp moves1,di
jne l22

sub lop,1
cmp lop,0
jne mainw2

add moves1,5
mov si,moves1
mov ax,temp
mov moves2,ax
add moves2,20
mov lop,15
pop di
add di,50

dec great

cmp great,0
jne greatlop2


mov moves1,0
mov si,moves1
mov di,60
add temp,17
mov ax,temp
mov moves2,ax
mov lop,15
call randomcolor
mov great,6

mov ax,0
mov bx,0
mov cx,0
mov dx,0


dec greatest
cmp greatest,0
jne greatestlop2


; making the moving paddle

mov moves2,180
mov moves1,120

mov si,moves1
mov di,170


mov bx,moves1
mov padd1,bx
mov bx,moves2
mov padd2,bx
mov paddl,di

mov lop,5

movingpad2:

maint2:

mov moves1,si
mov ax,moves2
add ax,1
mov moves2,ax

l2t2:

mov ah,0ch
mov al,06h
mov cx,moves1
mov dx,moves2
int 10h
inc moves1
cmp moves1,di
jne l2t2

sub lop,1
cmp lop,0
jne maint2


;ball code


mov blop,3
mov bx, ball2
mov tempor, bx
mov si, ball1
push ball1
mov di, ball1
add di, 3


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0



manee:
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

flg12 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne flg12

sub blop, 1
cmp blop, 0
jne manee

mov si, 0


; moving the ball <------------------------------------------->

kj2:

mov ah,02ch
int 21h
mov timevar,dl
mov ax,0

mov ah, 1
int 16h
jz sghomo2
jnz hd2

sghomo2:


mov ah,02ch
int 21h
cmp timevar,dl
je sghomo2
mov ax,0


mov bx, tempor
mov ball2, bx
pop ball1

push ball1
mov di, ball1
add di, 5

mov blop, 5

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0



mane2e:
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

flg2e :

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne flg2e

sub blop, 1
cmp blop, 0

jne mane2e

; replacing with new ball location

add di, 5

pop ball1
add ball1, 5
push ball1

mov blop, 5
sub tempor, 5

mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

mane3:
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

flg3 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne flg3

sub blop, 1
cmp blop, 0
jne mane3

; making boundry for ball

cmp ball1, 305
jg saggla
cmp ball2, 25
jl saggla2
cmp ball2,185
jg endline2
cmp ball1,15
jl saggla


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1>0 )

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20
dec b1

.if(b1==0)
call remover
inc score
 call display 

dec bricks
.endif


.if(bricks==0)

jmp damn2

.endif

jmp saggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2
.if(b2==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn2

.endif

jmp saggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

.if(b3==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn2

.endif

jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4>0)


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71

dec b4

.if(b4==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn2

.endif

jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,90
mov bx,110
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b5>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,88

dec b5

.if(b5==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn2

.endif

jmp saggla2
.endif
;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6>0 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

.if(b6==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn2

.endif

jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

.if(b7==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn2

.endif

jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

.if(b8==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn2

.endif

jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9>0)


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9

.if(b9==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn2

.endif

call remover

jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b10>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

.if(b10==0)
call remover
inc score
 call display 
 dec bricks

.endif



.if(bricks==0)
jmp damn2
.endif


inc score
 call display 
  dec bricks
.if(bricks==0)
jmp damn2
.endif

jmp saggla2
.endif

;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11>0 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

.if(b11==0)
call remover
inc score
 call display 

dec bricks
.endif


.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12
.if(b12==0)
call remover
inc score
 call display 

dec bricks
.endif


.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13

.if(b13==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

.if(b14==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b15>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b15

.if(b15==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif



;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16>0 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

.if(b16==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17

.if(b17==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

.if(b18==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

.if(b19==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b20>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b20

.if(b20==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif



;_________________________________________________________5rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21>0 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

.if(b21==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

.if(b22==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

.if(b23==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b24

.if(b24 == 0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b25>0)


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b25

.if(b25==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26>0 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b26

.if(b26==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27
.if(b27==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

.if(b28==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b29

.if(b29==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b30>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b30

.if(b30==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif



jmp kj2

hd2:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn2

.if(al=='P' || al=='p')
call pausemenu
.endif

mov bh,0
push bx
call movingpaddle

jmp kj2


tj2 :

mov ah,02ch
int 21h
mov timevar,dl
mov ax,0

mov ah, 1
int 16h
jz saggla
jnz hf2

saggla :


mov ah,02ch
int 21h
cmp timevar,dl
je saggla
mov ax,0



mov blop, 5
mov bx, tempor
mov ball2, bx
pop ball1

mov di, ball1
add di, 5
push ball1


mane4 :
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

flg4 :

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne flg4

sub blop, 1
cmp blop, 0
jne mane4

; creating new ball

pop ball1
mov di, ball1
sub ball1, 5
push ball1

mov blop, 5
sub tempor, 5

mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

mane5:
pop ball1

push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

flg5 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne flg5

sub blop, 1
cmp blop, 0
jne mane5

; creating boundry for ball

cmp ball1, 15
jl sghomo2
cmp ball1, 305
jg saggla2
cmp ball2,180
jg endline2
cmp ball2,25
jl saggla3

mov ax,moves1
mov bx,moves2

.if(ball1>= ax && ball2>=bx)
jmp sghomo2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1>0 )

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20
dec b1

.if(b1==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2

.if(b2==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

.if(b3==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71

dec b4

.if(b4==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,90
mov bx,110
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b5>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,88

dec b5

.if(b5==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6>0 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

.if(b6==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

.if(b7==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

.if(b8==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9>0)

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9

.if(b9==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b10>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b10

.if(b10==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif

;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11>0 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

.if(b11==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12

.if(b12==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,74
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13

.if(b13==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

.if(b14==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b15>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b15
.if(b15==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif



;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16>0 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

.if(b16==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17

.if(b17==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

.if(b18==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

.if(b19==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b20>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b20
.if(b20==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif


;_________________________________________________________5rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21>0 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

.if(b21==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

.if(b22==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

.if(b23==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b24

.if(b24==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b25>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b25
.if(b25==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif


;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26>0 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b26

.if(b26==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27

.if(b27==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

.if(b28==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b29
.if(b29==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b30>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b30

.if(b30==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


jmp tj2

hf2:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn2
.if(al=='P' || al=='p')
call pausemenu
.endif
mov bh,0
push bx
call movingpaddle


jmp tj2


rj2:
mov ah,2ch
int 21h
mov timevar,dl
mov ax,0

mov ah, 1
int 16h
jz saggla2
jnz hg2


saggla2 :


mov ah,2ch
int 21h
cmp timevar,dl
je saggla2

mov blop, 5
mov bx, tempor
mov ball2, bx
pop ball1

mov di, ball1
add di, 5
push ball1


mane6 :
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

flg6 :

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne flg6

sub blop, 1
cmp blop, 0
jne mane6

; creating new ball


pop ball1
mov ball1, di
add di, 5
push ball1

mov blop,5


add tempor, 5
mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0


mane7:
pop ball1

push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

flg7 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne flg7

sub blop, 1
cmp blop, 0
jne mane7

; making boundry for ball

cmp ball1, 15
jl saggla2
cmp ball1, 305
jg saggla3
cmp ball2,185
jg endline2
cmp ball2,25
jl saggla2

mov ax,moves1
mov bx,moves2
mov si,bx
sub bx,8
mov cx,ax
add ax,8
sub cx,50

;main ------------------------------------------------------------------------------------------------->

.if( (ball2>=bx && ball2<=si) && (ball1<=ax && ball1>=cx ))
jmp sghomo2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1>0 )

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20
dec b1
.if(b1==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2

.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2

.if(b2==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

.if(b3==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71

dec b4

.if(b4==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,90
mov bx,110
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b5>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,88

dec b5

.if(b5==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6>0 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

.if(b6==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

.if(b7==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

.if(b8==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9

.if(b9==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b10>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b10

.if(b10==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif


;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11>0 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

.if(b11==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12

.if(b12==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13
.if(b13==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

.if(b14==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b15>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b15

.if(b15==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif



;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16>0 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

.if(b16==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17
.if(b17==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

.if(b18==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
 
jmp saggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

.if(b19==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b20>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b20

.if(b20==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif


;_________________________________________________________5rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21>0 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

.if(b21==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

.if(b22==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

.if(b23==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b24

.if(b24==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b25>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b25

.if(b25==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif


;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26>0 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b26


.if(b26==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27

.if(b27==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

.if(b28==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b29

.if(b29==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b30>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b30

.if(b30==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla
.endif



jmp rj2

hg2:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn2
.if(al=='P' || al=='p')
call pausemenu
.endif
mov bh,0
push bx
call movingpaddle

jmp rj2


oj2:
mov ah,02ch
int 21h
mov timevar,dl

mov ah, 1
int 16h
jz saggla3
jnz hj2


saggla3:


mov ah,02ch
int 21h
cmp timevar,dl
je saggla3

mov blop, 5
mov bx, tempor
mov ball2, bx
pop ball1

mov di, ball1
add di, 5
push ball1


mane8 :
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

flg8:

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne flg8
sub blop, 1
cmp blop, 0
jne mane8

;creating new ball location

pop ball1
mov  di,ball1
sub ball1, 5
push ball1

mov blop, 5


add tempor, 5
mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0


mane9:
pop ball1

push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

flg9 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne flg9

sub blop, 1
cmp blop, 0
jne mane9

; making boundry for ball


cmp ball2,185
jge endline2
cmp ball2,15
jl saggla2
cmp ball1,305
jg saggla2
cmp ball1,10
jl saggla2



mov ax,moves1
mov bx,moves2
mov si,bx
sub bx,8
mov cx,ax
add ax,8
sub cx,50

;main ------------------------------------------------------------------------------------------------->

.if( (ball2>=bx && ball2<=si) && (ball1<=ax && ball1>=cx ))
jmp saggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1>0)

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20
dec b1

.if(b1==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2

.if(b2==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

.if(b3==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,90
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4>0)


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71

dec b4

.if(b4==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif 
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,90
mov bx,105
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b5>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,88

dec b5

.if(b5==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6>0 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

.if(b6==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

.if(b7==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

.if(b8==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9

.if(b9==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,110
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b10>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b10

.if(b10==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11>0 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

.if(b11==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12

.if(b12==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13
.if(b13==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

.if(b14==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
 
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b15>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b15

.if(b15==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16>0 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

.if(b16==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17

.if(b17==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

.if(b18==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

.if(b19==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b20>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b20
.if(b20==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;_________________________________________________________5rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21>0 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

.if(b21==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

.if(b22==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

.if(b23==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b24
.if(b24<=0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b25>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b25
.if(b25==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,45
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26>0 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b26

.if(b26==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,60
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27

.if(b27==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,75
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

.if(b28==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b29

.if(b29==0)
call remover
inc score
 call display 
dec bricks
.endif

.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,95
mov bx,105
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b30>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,88

dec b30
.if(b30==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn2
.endif
jmp saggla2
.endif


jmp oj2

hj2:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn2
.if(al=='P' || al=='p')
call pausemenu
.endif
mov bh,0
push bx
call movingpaddle

jmp oj2



endline2:

call soundoff

sub life ,1
cmp life,0
je damn2

cmp score,60
je damn2

call heartdisapear
add heartinc,8

jmp sghomo2



damn2:
.if(bricks<=0)
call boxes3
.endif

call finish
push address7
ret
boxes2 endp

;-------------------------------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------>>>> LEVEL2 ENDS <<<<<--------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------->>>>>> LEVEL3 <<<<<<-------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------



boxes3 proc

pop address8



mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 100
MOV DL, 100
MOV BH, 00h
INT 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov up1, 0
mov down1, 0

mov up2, 0
mov down2, 0

mov ball1,150
mov ball2,170


mov mover  ,100
mov mover2 ,10

mov temp,0

mov life,3
mov heartinc,0
mov bricks,20
mov level,3

mov b1,3
mov b2,3
mov b3,3
mov b4,3
mov b5,3
mov b6,3
mov b7,3
mov b8,3
mov b9,3
mov b10,3
mov b11,3
mov b12,3
mov b13,3
mov b14,3
mov b15,3
mov b16,3
mov b17,3
mov b18,3
mov b19,3
mov b20,3
mov b21,3
mov b22,3
mov b23,3
mov b24,3
mov b25,3
mov b26,3
mov b27,3
mov b28,3
mov b29,3
mov b30,3

mov remover2,0
mov remover2,0

mov tempor,0
mov color ,1


;making upper line in game mode


mov ax,0
mov bx,0
mov cx,0
mov dx,0

MOV AH, 06h
MOV AL, 0
MOV Cx, 0
MOV DH, 1
MOV DL, 100
MOV BH, 75h
INT 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0



MOV AH,02H
MOV DH, 0
MOV DL, 15
INT 10H

mov ah,09h
lea dx,sc
int 21h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

MOV AH,02H
MOV DH, 0
MOV DL, 30
INT 10H

mov ah,09h
lea dx,lev
int 21h

mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH,02H
MOV DH, 0
MOV DL, 36
INT 10H

mov dx,0
mov ah,02h
mov dl,level
add dl,30h
int 21h


mov ax,0
mov bx,0
mov cx,0
mov dx,0

call heartdis

add heartinc,8
call heartdis

add heartinc,8
call heartdis


mov heartinc,0

; making of boxes 

mov moves1,0
mov moves2,0
stoper3:

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov si,10

mov color,0
mov di,60
mov greatest,4
mov great,6
mov lop,15


greatestlop3:

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,10
add moves2,20



greatlop3:

push di

add color,3
.if(color>=10 && color<=16)
add color,7
.endif
.if(color>=6 && color<=8 || color==0)
add color,80
.endif


mov al,color
mov g,al

.if(great==6 && greatest==4)
mov color,8

.endif
.if(great==1 && greatest==4)

mov color,8
.endif
.if(great==6 && greatest==1)

mov color,8
.endif
.if(great==1 && greatest==1)
mov color,8

.endif


mov ax,0
mov bx,0
mov cx,0
mov dx,0

mainw3:

mov moves1,si

mov ax,moves2
add ax,1
mov moves2,ax

l23:

mov ah,0ch
mov al,color
mov cx,moves1
mov dx,moves2
int 10h
inc moves1
cmp moves1,di
jne l23

sub lop,1
cmp lop,0
jne mainw3

mov al,g
mov color,al

add moves1,5
mov si,moves1
mov ax,temp
mov moves2,ax
add moves2,20
mov lop,15
pop di
add di,50


dec great

cmp great,0
jne greatlop3


mov moves1,0
mov si,moves1
mov di,60
add temp,17
mov ax,temp
mov moves2,ax
mov lop,15

mov great,6

mov ax,0
mov bx,0
mov cx,0
mov dx,0


dec greatest
cmp greatest,0
jne greatestlop3


; making the moving paddle

mov moves2,180
mov moves1,120

mov si,moves1
mov di,160


mov bx,moves1
mov padd1,bx
mov bx,moves2
mov padd2,bx
mov paddl,di

mov lop,5

movingpad2:

maint3:

mov moves1,si
mov ax,moves2
add ax,1
mov moves2,ax

l2t3:

mov ah,0ch
mov al,06h
mov cx,moves1
mov dx,moves2
int 10h
inc moves1
cmp moves1,di
jne l2t3

sub lop,1
cmp lop,0
jne maint3


;ball code


mov blop,3
mov bx, ball2
mov tempor, bx
mov si, ball1
push ball1
mov di, ball1
add di, 3


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0



madee:
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

glg12 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne glg12

sub blop, 1
cmp blop, 0
jne madee

mov si, 0


; moving the ball <------------------------------------------->

kj3:

mov ah,02ch
int 21h
mov timevar,dl
mov ax,0

mov ah, 1
int 16h
jz sghomo3
jnz hd3

sghomo3:


mov ah,02ch
int 21h
cmp timevar,dl
je sghomo3
mov ax,0


mov bx, tempor
mov ball2, bx
pop ball1

push ball1
mov di, ball1
add di, 6

mov blop, 6

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0



made2e:
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

glg2e :

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne glg2e

sub blop, 1
cmp blop, 0

jne made2e

; replacing with new ball location

add di, 6

pop ball1
add ball1, 6
push ball1

mov blop, 6
sub tempor, 6

mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

made3:
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

glg3 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne glg3

sub blop, 1
cmp blop, 0
jne made3

; making boundry for ball

cmp ball1, 305
jg faggla
cmp ball2, 30
jl faggla2
cmp ball2,185
jg endline3
cmp ball1,15
jl faggla


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,20
mov bx,46
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1>0 )

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20


.if(b1==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)

jmp damn3

.endif

jmp faggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,61
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2
.if(b2==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn3

.endif

jmp faggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

.if(b3==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn3

.endif

jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,96
mov cx,5
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4>0)


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71



.if(b4==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn3

.endif

jmp faggla3
.endif

;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6>0 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

.if(b6==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn3

.endif

jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,56
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

.if(b7==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn3

.endif

jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,78
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

.if(b8==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn3

.endif

jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,96
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9>0)


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9

.if(b9==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)

jmp damn3

.endif

call remover

jmp faggla2
.endif


;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11>0 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

.if(b11==0)
call remover
inc score
 call display 

dec bricks
.endif


.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,56
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12
.if(b12==0)
call remover
inc score
 call display 

dec bricks
.endif


.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13

.if(b13==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,96
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

.if(b14==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif

;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16>0 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

.if(b16==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,56
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17

.if(b17==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

.if(b18==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

.if(b19==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;_________________________________________________________5th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21>0 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

.if(b21==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,56
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

.if(b22==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

.if(b23==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,96
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

sub b24,1

.if(b24==0)
call remover
inc score
dec bricks
call kaboom

 call display 
.endif

.if(bricks==0)
jmp damn3
.endif

jmp faggla3
.endif


;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,258
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26>0 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20


.if(b26==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,69
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27
.if(b27==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,79
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

.if(b28==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,250
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29>0 )


mov lop,15
mov remover1,255
mov si,remover1
mov di,remover1
add di,50
mov remover2,71



.if(b29==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif



jmp kj3

hd3:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn3

.if(al=='P' || al=='p')
call pausemenu
.endif

mov bh,0
push bx
call movingpaddle

jmp kj3


tj3 :

mov ah,02ch
int 21h
mov timevar,dl
mov ax,0

mov ah, 1
int 16h
jz faggla
jnz hf3

faggla :


mov ah,02ch
int 21h
cmp timevar,dl
je faggla
mov ax,0



mov blop, 6
mov bx, tempor
mov ball2, bx
pop ball1

mov di, ball1
add di, 6
push ball1


made4 :
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

glg4 :

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne glg4

sub blop, 1
cmp blop, 0
jne made4

; creating new ball

pop ball1
mov di, ball1
sub ball1, 6
push ball1

mov blop, 6
sub tempor, 6

mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

made5:
pop ball1

push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

glg5 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne glg5

sub blop, 1
cmp blop, 0
jne made5

; creating boundry for ball

cmp ball1, 16
jl sghomo3
cmp ball1, 305
jg faggla2
cmp ball2,180
jg endline3
cmp ball2,30
jl faggla3

mov ax,moves1
mov bx,moves2

.if(ball1>= ax && ball2>=bx)
jmp sghomo3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1>0 )

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20


.if(b1==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2

.if(b2==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,79
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

.if(b3==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71



.if(b4==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif

;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6>0 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

.if(b6==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,35
mov bx,59
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

.if(b7==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

.if(b8==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9>0)

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9

.if(b9==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif

;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11>0 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

.if(b11==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12

.if(b12==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13

.if(b13==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

.if(b14==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif



;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16>0 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

.if(b16==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17

.if(b17==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

.if(b18==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

.if(b19==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif


;_________________________________________________________5rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21>0 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

.if(b21==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

.if(b22==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

.if(b23==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b24

.if(b24==0)
call remover
inc score

dec bricks
call kaboom
 call display 
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif


;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26>0 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20


.if(b26==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27

.if(b27==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

.if(b28==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,71


.if(b29==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


jmp tj3

hf3:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn3
.if(al=='P' || al=='p')
call pausemenu
.endif
mov bh,0
push bx
call movingpaddle


jmp tj3


rj3:
mov ah,2ch
int 21h
mov timevar,dl
mov ax,0

mov ah, 1
int 16h
jz faggla2
jnz hg3


faggla2 :


mov ah,2ch
int 21h
cmp timevar,dl
je faggla2

mov blop, 6
mov bx, tempor
mov ball2, bx
pop ball1

mov di, ball1
add di, 6
push ball1


made6 :
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

glg6 :

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne glg6

sub blop, 1
cmp blop, 0
jne made6

; creating new ball


pop ball1
mov ball1, di
add di, 6
push ball1

mov blop,6


add tempor, 6
mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0


made7:
pop ball1

push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

glg7 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne glg7

sub blop, 1
cmp blop, 0
jne made7

; making boundry for ball

cmp ball1, 16
jl faggla2
cmp ball1, 305
jg faggla3
cmp ball2,185
jg endline3
cmp ball2,25
jl faggla2

mov ax,moves1
mov bx,moves2
mov si,bx
sub bx,11
mov cx,ax
add ax,8
sub cx,40

;main ------------------------------------------------------------------------------------------------->

.if( (ball2>=bx && ball2<=si) && (ball1<=ax && ball1>=cx ))
jmp sghomo3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1>0 )

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20

.if(b1==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla

.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2

.if(b2==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

.if(b3==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,64
mov bx,100
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71



.if(b4==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif

;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6>0 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

.if(b6==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

.if(b7==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

.if(b8==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9

.if(b9==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif

;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11>0 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

.if(b11==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12

.if(b12==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13
.if(b13==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

.if(b14==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif


;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16>0 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

.if(b16==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla3
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17
.if(b17==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

.if(b18==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
 
jmp faggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

.if(b19==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif


;_________________________________________________________5rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21>0 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

.if(b21==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

.if(b22==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

.if(b23==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b24

.if(b24==0)
call remover
inc score

dec bricks
call kaboom
 call display 
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif


;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26>0 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20



.if(b26==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27

.if(b27==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

.if(b28==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,71


.if(b29==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif


jmp rj3

hg3:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn3
.if(al=='P' || al=='p')
call pausemenu
.endif
mov bh,0
push bx
call movingpaddle

jmp rj3


oj3:
mov ah,02ch
int 21h
mov timevar,dl

mov ah, 1
int 16h
jz faggla3
jnz hj3


faggla3:


mov ah,02ch
int 21h
cmp timevar,dl
je faggla3

mov blop, 6
mov bx, tempor
mov ball2, bx
pop ball1

mov di, ball1
add di, 6
push ball1


made8 :
pop ball1
push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

glg8:

mov ah, 0ch
mov al, 0h
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne glg8
sub blop, 1
cmp blop, 0
jne made8

;creating new ball location

pop ball1
mov  di,ball1
sub ball1, 6
push ball1

mov blop, 6


add tempor, 6
mov bx, tempor
mov ball2, bx
mov tempor, bx


mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0


made9:
pop ball1

push ball1

mov ax, ball2
add ax, 1
mov ball2, ax

glg9 :

mov ah, 0ch
mov al, 0Fh
mov cx, ball1
mov dx, ball2
int 10h
inc ball1
cmp ball1, di
jne glg9

sub blop, 1
cmp blop, 0
jne made9

; making boundry for ball


cmp ball2,185
jge endline3
cmp ball2,15
jl faggla2
cmp ball1,305
jg faggla2
cmp ball1,10
jl faggla2



mov ax,moves1
mov bx,moves2
mov si,bx
sub bx,11
mov cx,ax
add ax,8
sub cx,40

;main ------------------------------------------------------------------------------------------------->

.if( (ball2>=bx && ball2<=si) && (ball1<=ax && ball1>=cx ))
jmp faggla
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,26
mov bx,46
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b1>0)

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,20


.if(b1==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp sghomo3
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b2>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37

dec b2

.if(b2==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b3>0 )


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

dec b3

.if(b3==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,65
mov bx,96
mov cx,10
mov dx,70

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b4>0)


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,71



.if(b4==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif 
jmp sghomo3
.endif


;_________________________________________________________2nd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b6>0 )

mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b6

.if(b6==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b7>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b7

.if(b7==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b8>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b8

.if(b8==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,65
mov dx,115

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b9>0 )


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b9

.if(b9==0)
call remover
inc score
 call display 
dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;_________________________________________________________3rd row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b11>0 )

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b11

.if(b11==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b12>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b12

.if(b12==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b13>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b13
.if(b13==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,115
mov dx,165

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b14>0 )


mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b14

.if(b14==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
 
jmp faggla2
.endif



;_________________________________________________________4rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b16>0 )

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b16

.if(b16==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b17>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b17

.if(b17==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b18>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b18

.if(b18==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,95
mov cx,165
mov dx,215

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b19>0 )


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b19

.if(b19==0)
call remover
inc score
 call display 

dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;_________________________________________________________5rth row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b21>0 )

mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,20
dec b21

.if(b21==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b22>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b22

.if(b22==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b23>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b23

.if(b23==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,215
mov dx,265

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b24>0 )


mov lop,15
mov remover1,215
mov si,remover1
mov di,remover1
add di,50
mov remover2,71

dec b24
.if(b24==0)
call remover
inc score

dec bricks
call kaboom
 call display 
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif

;_________________________________________________________6th row breaker_________________________________________________________

;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,25
mov bx,46
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) &&   (ball1>=cx && ball1<=dx) && b26>0 )

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,20


.if(b26==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,40
mov bx,59
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b27>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

dec b27

.if(b27==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif


;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,55
mov bx,76
mov cx,265
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b28>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54

dec b28

.if(b28==0)
call remover
inc score
 call display 

dec bricks
.endif
.if(bricks==0)
jmp damn3
.endif
jmp faggla2
.endif
;-----------------------BREAKING CONDITIONS -------------------------------

mov ax,70
mov bx,100
mov cx,255
mov dx,315

.if( (ball2>=ax && ball2<=bx) && (ball1>=cx && ball1<=dx) && b29>0 )


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,71



.if(b29==0)
call remover
inc score
 call display 
dec bricks
.endif

.if(bricks==0)
jmp damn3
.endif
jmp faggla
.endif


jmp oj3

hj3:
mov ah, 0
int 16h
mov bl, ah
cmp al, 8
je damn3
.if(al=='P' || al=='p')
call pausemenu
.endif
mov bh,0
push bx
call movingpaddle

jmp oj3



endline3:

call soundoff
; sub life ,1
; cmp life,0
; je damn3

call heartdisapear
add heartinc,8

jmp sghomo3



damn3:
.if(bricks<=0)
call winner
.endif
.if(life==0)
call finish
.endif

push address8
ret
boxes3 endp


;------------------------------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;----------------------------------------------------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------------------------;


;-----------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------

movingpaddle proc

pop address
pop bx

cmp bl,4bh
je left
cmp bl,4dh
je right
jne ex


left:




mov di,paddl
mov bx,padd1
mov moves1,bx
mov bx,padd2
mov moves2,bx


mov bx,moves1
mov padd1,bx
mov bx,moves2
mov padd2,bx
mov paddl,di


mov si,moves1
mov lop,5



maint1:

mov moves1,si
mov ax,moves2
add ax,1
mov moves2,ax

l2t1:

mov ah,0ch
mov al,00h
mov cx,moves1
mov dx,moves2
int 10h
inc moves1
cmp moves1,di
jne l2t1

sub lop,1
cmp lop,0
jne maint1

;replacing with new pad

mov di,paddl
mov bx,padd1
mov moves1,bx
mov bx,padd2
mov moves2,bx

.if(padd1<=0)
jmp gtr
.endif


sub moves1,10
sub di,10
mov si,moves1


gtr:
mov lop,5

mov bx,moves1
mov padd1,bx
mov bx,moves2
mov padd2,bx
mov paddl,di

maintl:

mov moves1,si
mov ax,moves2
add ax,1
mov moves2,ax

l2tl:

mov ah,0ch
mov al,06h
mov cx,moves1
mov dx,moves2
int 10h
inc moves1
cmp moves1,di
jne l2tl

sub lop,1
cmp lop,0
jne maintl

jmp ex


right:

mov di,paddl
mov bx,padd1
mov moves1,bx
mov bx,padd2
mov moves2,bx

mov bx,moves1
mov padd1,bx
mov bx,moves2
mov padd2,bx
mov paddl,di

mov si,moves1
mov lop,5



maint3:

mov moves1,si
mov ax,moves2
add ax,1
mov moves2,ax

l2tt3:

mov ah,0ch
mov al,00h
mov cx,moves1
mov dx,moves2
int 10h
inc moves1
cmp moves1,di
jne l2tt3

sub lop,1
cmp lop,0
jne maint3

; replacing with new paddle

mov di,paddl
mov bx,padd1
mov moves1,bx
mov bx,padd2
mov moves2,bx

.if(di>=310)
jmp gtx
.endif


add moves1,10
add di,10
mov si,moves1

gtx:
mov lop,5
mov bx,moves1
mov padd1,bx
mov bx,moves2
mov padd2,bx
mov paddl,di


maintr:

mov moves1,si
mov ax,moves2
add ax,1
mov moves2,ax

l2tr:

mov ah,0ch
mov al,06h
mov cx,moves1
mov dx,moves2
int 10h
inc moves1
cmp moves1,di
jne l2tr

sub lop,1
cmp lop,0
jne maintr



ex:
push address
ret
movingpaddle endp




nameinput proc

mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 100
MOV DL, 100
MOV BH, 085h
INT 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0








mov namd1,120
mov namd2,35

mov ax,0
mov bx,0
mov cx,0
mov dx,0


ladf:

mov ah,0ch
mov al,10
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,220
jne ladf


mov namd1,0
mov namd2,55

mov ax,0
mov bx,0
mov cx,0
mov dx,0


ladff:

mov ah,0ch
mov al,1h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne ladff

mov namd1,70
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0


ladfe:

mov ah,0ch
mov al,1h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,200
jne ladfe

mov namd1,270
mov namd2,0

ladfg:

mov ah,0ch
mov al,1h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,200
jne ladfg

mov namd1,0
mov namd2,150

ladfk:

mov ah,0ch
mov al,1h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne ladfk

mov namd1,0
mov namd2,0

;whole boundry printing code

ladfl:

mov ah,0ch
mov al,1h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne ladfl

mov namd1,0
mov namd2,199

mov ax,0
mov bx,0
mov cx,0
mov dx,0

ladfs:

mov ah,0ch
mov al,1h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne ladfs

mov namd1,70
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0


mov namd1,0
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

ladfa:

mov ah,0ch
mov al,1h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,199
jne ladfa

mov namd1,70
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov namd1,319
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

ladza:

mov ah,0ch
mov al,1h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,199
jne ladza



MOV AH,02H
MOV DH, 3
MOV DL, 15
INT 10H


lea dx,n
mov ah,09h
int 21h

mov ax,0
mov bx,0
mov cx,0
mov dx,0



MOV AH,02H
MOV DH, 5
MOV DL, 1
INT 10H


lea dx,w
mov ah,09h
int 21h


mov ax,0
mov bx,0
mov cx,0
mov dx,0



;creatng upper line

mov nami1,80
nameil:

MOV AH, 0Ch
 MOV AL, 4
 MOV CX, nami1
 MOV DX, nami2
 INT 10H

inc nami1
cmp nami1,260

jne nameil

mov nami1,80
add nami2,80
namei2:

MOV AH, 0Ch
 MOV AL, 4
 MOV CX, nami1
 MOV DX, nami2
 INT 10H

inc nami1
cmp nami1,260

jne namei2

mov nami1,80
mov nami2,60
namei3:

MOV AH, 0Ch
 MOV AL, 4
 MOV CX, nami1
 MOV DX, nami2
 INT 10H

inc nami2
cmp nami2,140

jne namei3

mov nami1,260
mov nami2,60
namei4:

MOV AH, 0Ch
 MOV AL, 4
 MOV CX, nami1
 MOV DX, nami2
 INT 10H

inc nami2
cmp nami2,140

jne namei4


MOV AH,02H
MOV BX,0
MOV DH, 9 
MOV DL, 11
INT 10H

lea dx,entername
mov ah,09h
int 21h


mov si,offset inputname
mov ax,0

mov cx,11

agl:

mov ah,1
int 16h
 jz agl
 mov ah,0
 int 16h
 
 cmp al,13
je retl
cmp al,32
je retl

mov ah,0

mov [si],ax

MOV AH,02H
MOV BX,0
MOV DH,11 
MOV DL, cl 
INT 10H

inc cl

mov ah,02h
mov dl,[si]

int 21h
inc checker
inc si

jmp agl

retl:

mov ax,'$'
mov [si],ax
ret

nameinput endp

instruct proc 

mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 100
MOV DL, 100
MOV BH, 00h
INT 10h


mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0




;whole boundry printing code

mov namd1,0
mov namd2,0

ladr:

mov ah,0ch
mov al,30h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne ladr

mov namd1,0
mov namd2,199

mov ax,0
mov bx,0
mov cx,0
mov dx,0

lads:

mov ah,0ch
mov al,30h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne lads

mov namd1,70
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0


mov namd1,0
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

lada:

mov ah,0ch
mov al,30h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,199
jne lada

mov namd1,70
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov namd1,319
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

ladz:

mov ah,0ch
mov al,30h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,199
jne ladz







MOV AH,02H
MOV BX,0
MOV DH, 1
MOV DL, 5
INT 10H

lea dx,i 
mov ah,09h
int 21h

mov si,30

lfg:

mov ah,0ch
mov al,10
mov cx,si
mov dx,18
int 10h

inc si

cmp si,140
jne lfg



MOV AH,02H
MOV BX,0
MOV DH, 5
MOV DL, 2
INT 10H

lea dx,note2
mov ah,09h
int 21h

MOV AH,02H
MOV BX,0
MOV DH, 7
MOV DL, 2
INT 10H

lea dx,note3
mov ah,09h
int 21h

MOV AH,02H
MOV BX,0
MOV DH, 9
MOV DL, 2
INT 10H

lea dx,note4
mov ah,09h
int 21h

MOV AH,02H
MOV BX,0
MOV DH, 11
MOV DL, 2
INT 10H

lea dx,note5
mov ah,09h
int 21h

MOV AH,02H
MOV BX,0
MOV DH, 13
MOV DL, 2
INT 10H

lea dx,note6
mov ah,09h
int 21h

MOV AH,02H
MOV BX,0
MOV DH, 15
MOV DL, 2
INT 10H


lea dx,note8
mov ah,09h
int 21h



agd:

mov ah,1
int 16h
 jz agd
 mov ah,0
 int 16h
  cmp al,8
je retr
 cmp al,13
je retr
cmp al,32
je retr


jmp agd


retr :

ret
instruct endp

highscore proc



mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 100
MOV DL, 100
MOV BH, 6Dh
INT 10h


mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0




;whole boundry printing code

mov namd1,0
mov namd2,0

larr:

mov ah,0ch
mov al,5h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne larr

mov namd1,0
mov namd2,199

mov ax,0
mov bx,0
mov cx,0
mov dx,0

lars:

mov ah,0ch
mov al,5h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne lars

mov namd1,70
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0


mov namd1,0
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

lara:

mov ah,0ch
mov al,5h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,199
jne lara

mov namd1,70
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov namd1,319
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

latz:

mov ah,0ch
mov al,5h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,199
jne latz







MOV AH,02H
MOV BX,0
MOV DH, 5
MOV DL, 1
INT 10H

lea dx,inputname
mov ah,09h
int 21h

MOV AH,02H
MOV BX,0
MOV DH, 1
MOV DL, 1
INT 10H

lea dx,nm
mov ah,09h
int 21h


MOV AH,02H
MOV BX,0
MOV DH, 1
MOV DL, 21
INT 10H

lea dx,sc
mov ah,09h
int 21h



MOV AH,02H
MOV BX,0
MOV DH, 1
MOV DL, 12
INT 10H

lea dx,lev
mov ah,09h
int 21h


MOV AH,02H
MOV BX,0
MOV DH, 5
MOV DL, 15
INT 10H

mov ah,0
mov al,level
add al,30h
mov dx,ax
mov ah,02h
int 21h



mov ax,score
mov cl,ah
mov ah,0
mov bl,10
div bl
mov np1,al
mov np2,ah


MOV AH,02H
MOV BX,0
MOV DH, 5
MOV DL, 22
INT 10H

mov al,np1
mov dl,al
add  dl,30h
mov ah,02h
int 21h

MOV AH,02H
MOV BX,0
MOV DH, 5
MOV DL, 23
INT 10H

mov al,np2
mov dl,al
add  dl,30h
mov ah,02h
int 21h

call filehandling

aghs:
mov ah,1
int 16h
 jz aghs
 mov ah,0
 int 16h
 cmp al,8
 je reths
 cmp al,13
je reths
cmp al,32
je reths


jmp aghs

reths:
ret
highscore endp



remover proc
pop address3

mov lop,15


mov ax,0
mov bx,0
mov cx,0
mov dx,0


mainat1:

mov remover1,si

mov ax,remover2
add ax,1
mov remover2,ax

lat1:

mov ah,0ch
mov al,0h
mov cx,remover1
mov dx,remover2
int 10h
inc remover1
cmp remover1,di
jne lat1

sub lop,1
cmp lop,0
jne mainat1




grt:

call soundon

push address3
ret
remover endp 

display proc

pop address4

mov ax,score
mov cl,ah
mov ah,0
mov bl,10
div bl
mov np1,al
mov np2,ah


MOV AH,02H
MOV BX,0
MOV DH, 0
MOV DL, 22
INT 10H

mov al,np1
mov dl,al
add  dl,30h
mov ah,02h
int 21h

MOV AH,02H
MOV BX,0
MOV DH, 0
MOV DL, 23
INT 10H

mov al,np2
mov dl,al
add  dl,30h
mov ah,02h
int 21h

push address4
ret
display endp

heartdis proc

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4

mov cx,6
add cx,heartinc
mov dx,3
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,10
add cx,heartinc
mov dx,3
int 10h


;2nd line
mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4

mov cx,5
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,6
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,7
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,9
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,10
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,11
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

;3rd line


mov ah,0ch
mov al,4
mov cx,5
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0

mov dx,0

mov ah,0ch
mov al,4
mov cx,6
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,7
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,8
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,9
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0


mov ah,0ch
mov al,4
mov cx,10
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,11
add cx,heartinc
mov dx,5
int 10h

;4 line



mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,6
add cx,heartinc
mov dx,6
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,7
add cx,heartinc
mov dx,6
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,8
add cx,heartinc
mov dx,6
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,9
add cx,heartinc
mov dx,6
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0


mov ah,0ch
mov al,4
mov cx,10
add cx,heartinc
mov dx,6
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

;5 line



mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,7
add cx,heartinc
mov dx,7
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,8
add cx,heartinc
mov dx,7
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,9
add cx,heartinc
mov dx,7
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0


;6 line




mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,4
mov cx,8
add cx,heartinc
mov dx,8
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0




ret
heartdis endp


heartdisapear proc

pop address5

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0

mov cx,6
add cx,heartinc
mov dx,3
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,10
add cx,heartinc
mov dx,3
int 10h


;2nd line
mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0

mov cx,5
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,6
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,7
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,9
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,10
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,11
add cx,heartinc
mov dx,4
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

;3rd line


mov ah,0ch
mov al,0
mov cx,5
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0

mov dx,0

mov ah,0ch
mov al,0
mov cx,6
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,7
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,8
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,9
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0


mov ah,0ch
mov al,0
mov cx,10
add cx,heartinc
mov dx,5
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,11
add cx,heartinc
mov dx,5
int 10h

;4 line



mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,6
add cx,heartinc
mov dx,6
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,7
add cx,heartinc
mov dx,6
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,8
add cx,heartinc
mov dx,6
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,9
add cx,heartinc
mov dx,6
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0


mov ah,0ch
mov al,0
mov cx,10
add cx,heartinc
mov dx,6
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

;5 line



mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,7
add cx,heartinc
mov dx,7
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,8
add cx,heartinc
mov dx,7
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,9
add cx,heartinc
mov dx,7
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0


;6 line




mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,0ch
mov al,0
mov cx,8
add cx,heartinc
mov dx,8
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0



push address5
ret
heartdisapear endp

soundon proc

mov al, 182         ; Prepare the speaker for the
out 43h, al         ;  note.
mov ax,1200        ; Frequency number (in decimal)
                                ;  for middle C.
out 42h, al         ; Output low byte.
mov  al, ah          ; Output high byte.
 out 42h, al 
 in al, 61h         ; Turn on note (get value from
                                ;  port 61h).
or al, 11110011b   ; Set bits 1 and 0.
out 61h, al         ; Send new value.

mov bx, 15       ; Pause for duration of note.
p1:
mov cx, 6550
p2:
dec cx
jne p2
dec bx
jne p1
in al, 61h         ; Turn off note (get value from
                              ;  port 61h).
and al, 11110000b   ; Reset bits 1 and 0.
out 61h, al         ; Send new value.

ret
soundon endp

soundoff proc

mov al, 182        
out 43h, al         
mov ax,2200      ; Frequency number in decimal
                               
out 42h, al       
mov  al, ah         
 out 42h, al 
 in al, 61h         
                              
or al, 00001111b  
out 61h, al      

mov bx, 20        
p1:
mov cx, 6550
p2:
dec cx
jne p2
dec bx
jne p1
in al, 61h         ; Turn off note (get value from
                              ;  port 61h).
and al, 00000000b   ; Reset bits 1 and 0.
out 61h, al         ; Send new value.

ret
soundoff endp

filehandling proc

mov ah,3dh
mov al,2 
mov dx,offset filename
int 21h
mov filer,ax


mov bx,filer
mov cx,0
mov dx, 0
mov ah,42h
mov al,2 
int 21h

mov cx,checker

mov dx, offset inputname
mov ah, 40h 
int 21h

mov al,' '
mov si,offset resc
mov [si],al

mov bx,filer
mov cx,0
mov dx, 0
mov ah,42h
mov al,2 
int 21h

mov cx,1

mov dx,offset resc
mov ah, 40h 
int 21h

;printing level on file

mov al,level
mov si,offset resc
add al,30h
mov [si],al

mov bx,filer
mov cx,0
mov dx, 0
mov ah,42h
mov al,2 
int 21h
mov cx,1
mov dx,offset resc
mov ah, 40h 
int 21h


mov al,' '
mov si,offset resc
mov [si],al

mov bx,filer
mov cx,0
mov dx, 0
mov ah,42h
mov al,2 
int 21h
mov cx,1
mov dx,offset resc
mov ah, 40h 
int 21h



mov ax,score
mov bx,10
div bl
mov dbtype1,al
mov dbtype2, ah

; printing score on file
mov ah,0
mov si,offset resc
mov al,dbtype1
add al,30h
mov [si],al
inc si
mov al,dbtype2
add al,30h
mov [si],al


mov ax,0
mov bx,0


mov bx,filer
mov cx,0
mov dx, 0
mov ah,42h
mov al,2 
int 21h
mov cx,2
mov dx,offset resc
mov ah, 40h 
int 21h


mov al,10
mov si,offset resc
mov [si],al

mov bx,filer
mov cx,0
mov dx, 0
mov ah,42h
mov al,2 
int 21h
mov cx,1
mov dx,offset resc
mov ah, 40h 
int 21h




mov ax,checker
mov words,ax
add words,5

mov ax,0
mov bx,0

mov ah, 3eh 
mov bx, filer
int 21h

;reading a file


mov ah,3dh 
mov al,2 
mov dx,offset filename
int 21h 
mov filer,ax

mov ah,3fh
mov cx,words
mov dx,offset storer
mov bx,filer
int 21h


MOV AH,02H
MOV BX,0
MOV DH, 8
MOV DL, 3
INT 10H

lea dx,storer
mov ah,09h
int 21h


mov ah, 3eh 
mov bx, filer
int 21h


ret
filehandling endp

winner proc




mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 100
MOV DL, 100
MOV BH, 90h
INT 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0



;whole boundry printing code

mov namd1,0
mov namd2,0

larr:

mov ah,0ch
mov al,5h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne larr

mov namd1,0
mov namd2,199

mov ax,0
mov bx,0
mov cx,0
mov dx,0

lard:

mov ah,0ch
mov al,2h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne lard

mov namd1,70
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0


mov namd1,0
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

lark:

mov ah,0ch
mov al,2h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,199
jne lark

mov namd1,70
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov namd1,319
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

lakz:

mov ah,0ch
mov al,2h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,199
jne lakz






mov nami1,100
mov nami2,30
mov ax,0
mov bx,0
mov cx,0
mov dx,0

upli:

mov ah,0ch
mov al,05h
mov cx,nami1
mov dx,nami2
int 10h

inc nami1

cmp nami1,200
jne upli


mov nami1,100
mov nami2,60
mov ax,0
mov bx,0
mov cx,0
mov dx,0

doli:

mov ah,0ch
mov al,05h
mov cx,nami1
mov dx,nami2
int 10h

inc nami1

cmp nami1,200
jne doli


mov nami1,100
mov nami2,30
mov ax,0
mov bx,0
mov cx,0
mov dx,0

rili:

mov ah,0ch
mov al,05h
mov cx,nami1
mov dx,nami2
int 10h

inc nami2

cmp nami2,60
jne rili

mov nami1,200
mov nami2,30
mov ax,0
mov bx,0
mov cx,0
mov dx,0

lefi:

mov ah,0ch
mov al,05h
mov cx,nami1
mov dx,nami2
int 10h

inc nami2

cmp nami2,60
jne lefi


MOV AH,02H
MOV BX,0
MOV DH, 5
MOV DL, 15
INT 10H

lea dx,win
mov ah,09h
int 21h


MOV AH,02H
MOV BX,0
MOV DH, 20
MOV DL, 5
INT 10H

lea dx,note7
mov ah,09h
int 21h


log:
mov ah,1
int 16h
 jz log
 mov ah,0
 int 16h
 
 cmp al,13
jne log


ret
winner endp

finish proc

mov ax,0
mov bx,0
mov cx,0
mov dx,0


MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 100
MOV DL, 100
MOV BH, 90h
INT 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0




;whole boundry printing code

mov namd1,0
mov namd2,0

larn:

mov ah,0ch
mov al,4h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne larn

mov namd1,0
mov namd2,199

mov ax,0
mov bx,0
mov cx,0
mov dx,0

larq:

mov ah,0ch
mov al,4h
mov cx,namd1
mov dx,namd2
int 10h

inc namd1

cmp namd1,320
jne larq

mov namd1,70
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0


mov namd1,0
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

larw:

mov ah,0ch
mov al,4h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,199
jne larw

mov namd1,70
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov namd1,319
mov namd2,0

mov ax,0
mov bx,0
mov cx,0
mov dx,0

laty:

mov ah,0ch
mov al,4h
mov cx,namd1
mov dx,namd2
int 10h

inc namd2

cmp namd2,199
jne laty




mov nami1,100
mov nami2,30
mov ax,0
mov bx,0
mov cx,0
mov dx,0

uplid:

mov ah,0ch
mov al,05h
mov cx,nami1
mov dx,nami2
int 10h

inc nami1

cmp nami1,200
jne uplid


mov nami1,100
mov nami2,60
mov ax,0
mov bx,0
mov cx,0
mov dx,0

dolid:

mov ah,0ch
mov al,05h
mov cx,nami1
mov dx,nami2
int 10h

inc nami1

cmp nami1,200
jne dolid


mov nami1,100
mov nami2,30
mov ax,0
mov bx,0
mov cx,0
mov dx,0

rilid:

mov ah,0ch
mov al,05h
mov cx,nami1
mov dx,nami2
int 10h

inc nami2

cmp nami2,60
jne rilid

mov nami1,200
mov nami2,30
mov ax,0
mov bx,0
mov cx,0
mov dx,0

lefid:

mov ah,0ch
mov al,05h
mov cx,nami1
mov dx,nami2
int 10h

inc nami2

cmp nami2,60
jne lefid


MOV AH,02H
MOV BX,0
MOV DH, 5
MOV DL, 13
INT 10H

lea dx,lose
mov ah,09h
int 21h


MOV AH,02H
MOV BX,0
MOV DH, 20
MOV DL, 5
INT 10H

lea dx,note7
mov ah,09h
int 21h


logd:
mov ah,1
int 16h
 jz logd
 mov ah,0
 int 16h
 
 cmp al,13
jne logd


ret
finish endp

pausemenu proc



lofd:
mov ah,1
int 16h
 jz lofd
 mov ah,0
 int 16h
 
 .if(al=='P' || al=='p')
jmp frrr
.endif

jmp lofd

frrr:
ret
pausemenu endp

randomcolor proc

mov ah,2ch
int 21h
mov bx,0
mov color,dl

mov bl,0

.if(dl==bl)
mov color,90h
.endif

ret 
randomcolor endp

;magic function removing random five tiles 

kaboom proc

.if(bricks>=5)

mov ah,2ch
int 21h
mov g,dl

.while(g>5)
mov ah,2ch
int 21h
mov g,dl

.endw

sub bricks,5
add score,5



.if(g>=0 && g<3)
mov b3,0
mov b27,0
mov b7,0
mov b13,0
mov b16,0


mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

call remover


mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

call remover


mov lop,15
mov remover1,65
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

call remover

mov lop,15
mov remover1,115
mov si,remover1
mov di,remover1
add di,50
mov remover2,54
call remover

mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20

call remover
.endif

.if(g>=3 && g<=5)
mov b3,0
mov b2,0
mov b28,0
mov b27,0
mov b16,0



mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,54

call remover

mov lop,15
mov remover1,10
mov si,remover1
mov di,60
mov remover2,37



call remover



mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,54


call remover

mov lop,15
mov remover1,265
mov si,remover1
mov di,remover1
add di,50
mov remover2,37

call remover


mov lop,15
mov remover1,165
mov si,remover1
mov di,remover1
add di,50
mov remover2,20


call remover

.endif


.endif
ret
kaboom endp


end main