assume cs:code,ds:data,ss:stack
data segment
	db 16 dup('D')
data ends
stack segment
	db 16 dup('S')
stack ends
code segment
start:mov ax,data
	  mov ds,ax
	  mov ax,stack
	  mov ss,ax
	  mov sp,10h

	  mov ax,1
	  push ax
	  mov bx,3
	  push bx
	  call difcube

	  mov ax,4c00h
	  int 12h

difcube:push bp
		mov bp,sp
		mov ax,[bp].4
		mov bx,[bp].6
		sub ax,bx
		mov bp,ax
		mul bp
		mul bp
		pop bp
		ret 4 
code ends
end start
