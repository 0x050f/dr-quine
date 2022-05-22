section.text:
	global main
	extern printf

main:
	push rbp
	; Does a empty label with a ret count as a function ?
	call f
	lea rdi, [rel code]
	push 10
	pop rsi
	push 96
	pop rdx
	lea rcx, [rel code]
	call printf
	xor rax, rax
	pop rbp
	ret

; This is a empty function f. Cool.
f:
	ret

code db `section.text:%1$c	global main%1$c	extern printf%1$c%1$cmain:%1$c	push rbp%1$c	; Does a empty label with a ret count as a function ?%1$c	call f%1$c	lea rdi, [rel code]%1$c	push 10%1$c	pop rsi%1$c	push 96%1$c	pop rdx%1$c	lea rcx, [rel code]%1$c	call printf%1$c	xor rax, rax%1$c	pop rbp%1$c	ret%1$c%1$c; This is a empty function f. Cool.%1$cf:%1$c	ret%1$c%1$ccode db %2$c%3$s%2$c, 0x0%1$c`, 0x0
