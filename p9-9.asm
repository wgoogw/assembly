assume cs:code,ds:data,ss:stack
data segment
	db 16 dup('d')
data ends
stack segment
	db 16 dup('s')
stack ends
code segment
	  mov ax,4c00h
	  int 12h
start:mov ax,data
	  mov ds,ax
	  mov ax,stack
	  mov ss,ax
	  mov sp,10h
	  mov ax,0
	  push ax
	  mov bx,0
	  ret
code ends
end start
