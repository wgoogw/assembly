assume cs:code,ds:data
data segment
	dd 100001
	dw 100
	dw 0
data ends
code segment
start:mov ax,data
	  mov ds,ax
	  mov bx,0

	  mov ax,ds:[0]
	  mov dx,ds:[2]
	  mov bx,ds:[4]
	  div bx
	  mov ds:[6],ax

	  mov ax,4c00h
	  int 12h
code ends
end start
