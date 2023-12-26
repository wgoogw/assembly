assume cs:code
code segment
start:mov ax,0
	  jmp short s
	  add ax,1
	  nop
	  nop
	s:inc ax
  	
	  mov ax,4c00h
	  int 12h
code ends
end start
