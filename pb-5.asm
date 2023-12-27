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

	  mov al,60
	  call showsign

	  mov ax,4c00h
	  int 21h
	  
showsign:
	  jmp short show
	  table dw ag0,ag30,ag60,ag90,ag120,ag150,ag180
	  ag0   db '0',0
	  ag30  db '0.5',0
	  ag60  db '0.866',0
	  ag90  db '1',0
	  ag120 db '0.866',0
	  ag150 db '0.5',0
	  ag180 db '0',0
 show:push bx
	  push es
	  push si
	  
	  
	  mov bx,0b800h
	  mov es,bx

	  mov ah,0
	  mov bl,30
	  div bl
	  mov bl,al
	  mov bh,0
	  add bx,bx
	  mov bx,table[bx]

	  mov si,120*12+30*2
shows:mov ah,cs:[bx]
	  cmp ah,0
	  je showret
	  mov es:[si],ah
	  inc bx
	  mov ah,71h
	  mov es:[si].1,ah
	  inc si
	  jmp shows

showret:

	  pop si
	  pop es
	  pop bx
	  ret
	  
code ends
end start
