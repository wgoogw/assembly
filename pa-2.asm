assume cs:code,ds:data,ss:stack
data segment
	db 'conversation'
data ends
stack segment
	db 16 dup('A')
stack ends
code segment
start:mov ax,data
	  mov ds,ax
	  mov ax,stack
	  mov ss,ax
	  mov sp,10h

	  mov cx,12
	  mov si,0
	  
	s:and byte ptr [si],11011111b	
	  inc si
	  loop s

	  mov ax,4c00h
	  int 12h
code ends
end start
