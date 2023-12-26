assume cs:code,ds:data,ss:stack
data segment
	db 'unix',0
	db 'word',0
	db 'good',0
	db 'wind',0
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
	  mov cx,4
	  mov bx,0

	s:mov si,bx
	  call capital
	  add bx,5
	  loop s

	  mov ax,4c00h
	  int 12h

capital:push cx
	  push si
change:mov cl,[si]
	  mov ch,0
	  jcxz ok
	  and byte ptr [si],11011111b
	  inc si
	  jmp short change
   ok:pop si
      pop cx
	  ret
code ends
end start
