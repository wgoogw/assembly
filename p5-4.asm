assume cs:code
code segment
	mov bx,0
	mov cx,6
	mov dx,0

  s:mov ax,0ffffh
	mov ds,ax
	mov dx,[bx]	

	mov ax,0h
	mov ds,ax
	add bx,200h
	mov [bx],dx
	
	sub bx,200h
	add bx,2
	loop s

	mov ax,4c00h
	int 21h
code ends
end

