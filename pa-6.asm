assume cs:code,ds:data,ss:stack
data segment
	dw 0a452h,0a8f5h,78e6h,0a8eh,8b7ah,54f6h,0f04h,67e1h
	dw 0e71eh,0ef04h,54f6h,8b7ah,0a8eh,78e6h,58f5h,0452h
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

	  mov cx,8
	  mov si,0
	  mov di,16

	  call add128

	  mov ax,4c00h
	  int 12h

add128:push ax
	  push cx
	  push si
	  push di

	  sub ax,ax
	s:mov ax,[si]
	  adc ax,[di]
	  mov [si],ax
	  inc si
	  inc si
	  inc di
	  inc di
	  loop s
	  
	  pop di
	  pop si
	  pop cx
	  pop ax

	  ret

code ends
end start
