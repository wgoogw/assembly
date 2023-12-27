assume cs:code,ds:data,ss:stack,es:extra
extra segment
	db 32 dup('E')
extra ends
data segment
	db 32 dup('D')
data ends
stack segment
	db 32 dup('S')
stack ends
code segment
	a db 1,2,3,4,5,6,7,8
	b dw 0
start:mov ax,extra
	  mov es,ax

	  mov ax,stack
	  mov ss,ax
	  mov sp,20h

	  mov ax,data
	  mov ds,ax

	  mov cx,8
	  mov si,0
	  mov di,0
	s:mov al,a[si]
	  mov ah,0
	  add b[di],ax
	  inc si
	  loop s

	  mov ax,4c00h
	  int 12h
code ends
end start
