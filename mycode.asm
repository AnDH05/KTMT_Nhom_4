.model small
.stack 100h

.data
    msg db "Nhap so nguyen duong n: $"
    result db "Giai thua cua (n+1) la: $"
    n db ?
    factorial dw ?

.code
main proc

    mov ah, 09h
    lea dx, msg
    int 21h

   
    mov ah, 01h
    int 21h
    sub al, 30h 
    mov n, al


    movzx cx, byte ptr n
    inc cx 
    mov ax, 1
    mov factorial, 1
    factorial_loop:
        mul cx
        dec cx
        jnz factorial_loop
    mov [factorial], ax


    mov ah, 09h
    lea dx, result
    int 21h
    mov ax, [factorial]
    add ax, 30h
    mov dl, al
    mov ah, 02h
    int 21h


    mov ax, 4c00h
    int 21h
main endp
end main
