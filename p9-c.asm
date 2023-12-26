assume cs:code,ds:data,ss:stack
data segment
	db 16 dup('d')
data ends
stack segment
	db 16 dup('s')
stack ends
code segment
start:mov ax,data
	  mov ds,ax
	  mov ax,stack
	  mov ss,ax
	  mov sp,10h

	  mov cx,3
	  mov ax,1
	  call s
	  mov ax,4c00h
	  int 12h

	s:add ax,ax
	  loop s
	  ret
code ends
end start
