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
start:mov ax,extra
	  mov es,ax

	  mov ax,stack
	  mov ss,ax
	  mov sp,20h

	  mov ax,data
	  mov ds,ax

	  mov al,2bh
	  call showbyte

	  mov ax,4c00h
	  int 12h
	  
showbyte:
	  jmp short show
	  table db '0123456789abcdef'
 show:push bx
	  push es
	  push cx
	  
	  mov ah,al
	  mov cl,4
	  shr ah,cl
	  and al,00001111b

	  mov bl,ah
	  mov bh,0
	  mov ah,table[bx]
	  
	  mov bx,0b800h
	  mov es,bx
	  mov es:[120*12+30*2],ah
	  mov ah,74h
	  mov es:[120*12+30*2+1],ah

	  mov bl,al
	  mov bh,0
	  mov al,table[bx]
	  
	  mov es:[120*12+30*2],al
	  mov al,75h
	  mov es:[120*12+30*2+1],al

	  pop cx
	  pop es
	  pop bx
	  ret
	  
code ends
end start
