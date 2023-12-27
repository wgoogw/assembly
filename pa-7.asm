assume cs:code,ds:data,ss:stack
data segment
	db 8,11,8,1,8,5,63,38
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
	  mov bx,0
	  mov dx,0
	s:cmp byte ptr [bx],8
	  jge s0
	  inc dx
   s0:inc bx
      loop s

	  mov ax,4c00h
	  int 12h
code ends
end start
