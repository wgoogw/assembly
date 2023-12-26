assume cs:code,ds:data,ss:stack
data segment
	db 'conversation',0
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

	  mov si,0
	  call capital

	  mov ax,4c00h
	  int 12h

capital:mov cl,[si]
	  mov ch,0
	  jcxz ok
	  and byte ptr [si],11011111b
	  inc si
	  jmp short capital
   ok:ret
code ends
end start
