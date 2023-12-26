assume cs:code,ds:data
data segment
	   db 'Yao'
	   db '19800912'
	   db 15
	   db 32
	   db 'SHH'
data ends
code segment
start:mov ax,data
	  mov ds,ax
	  mov bx,0
	  mov si,0
	  mov word ptr [bx][0bh],11
	  mov word ptr [bx][0ch],13
	  mov byte ptr [bx][0dh][si],'H'
	  inc si
	  mov byte ptr [bx][0dh][si],'O'
	  inc si
	  mov byte ptr [bx][0dh][si],'U'
	  
	  mov ax, 4c00h
	  int 12h
code ends
end start
