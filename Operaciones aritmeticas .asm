 ;Programa que realiza las operaciones aritméticas 
 
.model small
.stack
.data 

n1 db 0
n2 db 0
r db 0 

suma db 0
resta db 0 
multiplicacion db 0
division db 0
modulo db 0

sol1 db 13, 10,'ingrese el primer numero', 13,10, '$'
sol2 db 13, 10,'ingrese el segundo numero',13,10,'$'

Fsuma db 13,10, 'la suma de los numeros es: $ '
Fresta db 13, 10, 'la resta de los numeros es: $'
Fmultiplicacion db 13,10, 'la multiplicacion de los numeros es: $'
Fdivision db 13,10, 'la division de los numeros es: $' 

msg db 'SUMA DE NUMEROS'

lea dx,msg ;ontenemos la direccion de memoria de ms

.code

    mov ax,  @data
    mov ds, ax 
    
    
   
    mov ah,09h ;Interrupcion para imprimir una cadena 
    lea dx,sol1 ; obtenemos la direccion de memoria ms
    int 21h     ;ejecutamos la interrupcion
    
    mov ah,01h  ;interrupcion lee el caracter 1 del numero 1
    int 21h     ;ejecutamos la interrupcion
    sub al,30h  ;hacemos le ajuste de caracter a numero 
    mov n1,al   ;guardamos el numero en n1 
    
    
    mov ah,09h   ;Interrupcion para imprimir una cadena 
    lea dx,sol2  ; obtenemos la direccion de memoria ms
    int 21h      ;ejecutamos la interrupcion
    
    mov ah,01h
    int 21h
    sub al,30h
    mov n2,al 
    
                   
    ;SUMA
    
    mov al,n1
    add al,n2
    mov r, al
    
    mov ah,09h
    lea dx,Fsuma
    int 21h
    
    mov al,r
    AAM
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h
           
    
 
  
    ;RESTA
    
    mov al,n1
    sub al,n2
    mov r, al
    
    mov ah,09h
    lea dx,Fresta
    int 21h
    
    mov al,r
    AAM
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h
    
    
    
    ;multi
    
    mov al,n1
    ;add bl,n2 
    mul n2
    mov r,al
    
    mov ah,09h  
    lea dx,Fmultiplicacion
    int 21h
    
    mov al,r
    AAM
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h   
    
      
      
   ;DIVISION
    
    xor ax,ax
    mov bl,n2
    mov al,n1
    div bl
    mov r, al
    
   
   mov ah,09h  
    lea dx,Fdivision
    int 21h
    
    mov al,r
    AAM
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h   
    
    
   .exit
ret