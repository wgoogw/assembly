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
	  mov ax,0123h
	  mov ds:[0],ax
	  mov word ptr ds:[2],0
	  call dword ptr ds:[0]
  	
	  mov ax,4c00h
	  int 12h
code ends
end start
