assume cs:code,ds:data
data segment
	db 'BaSiC'
	db 'MiniX' 
data ends
code segment
start: mov ax,data
	   mov ds,ax
	   mov bx,0
	   mov cx,5

	s: mov al,[bx]
	   and al,11011111b
	   mov [bx],al
	   add bx,5
	   mov al,[bx]
	   or al,00100000b
	   mov [bx],al
	   sub bx,5
	   inc bx
	   loop s

	   mov ax, 4c00h
	   int 12h
code ends
end start
