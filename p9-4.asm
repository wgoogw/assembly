assume cs:code
code segment
start:jmp short s
	  db 127 dup(0)
	s:mov ax,5
  	
	  mov ax,4c00h
	  int 12h
code ends
end start
