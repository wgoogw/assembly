assume cs:code,ds:data,ss:stack,es:extra
extra segment
	db 32 dup('E')
extra ends
data segment
	db 'Welcome to masm!'
data ends
stack segment
	db 32 dup('S')
stack ends
code segment
start:mov ax,extra
	  mov es,ax

	  mov ax,stack
	  mov ss,ax
	  mov sp,20h

	  mov ax,data
	  mov ds,ax

	  mov cx,8
	  
	  mov si,0 
	  mov di,16 
	  mov es,ax
	  cld

	  rep movsw

	  mov ax,4c00h
	  int 12h
code ends
end start
