section.text:
	global _start
	extern sprintf
	extern dprintf

%define		FILENAME		`Sully_%d.s`

_start:
	mov rbp, rsp
	push rbp
	mov rsp, rbp
	sub rsp, 256
	mov rcx, 5
	cmp rcx, 0x0
	jle .end_loop
	.loop:
		cmp rcx, 0x0
		jl .end_loop

		mov rdi, rsp
		lea rsi, [rel filename]
		mov rdx, rcx
		mov r12, rcx
		call sprintf

		mov rdi, rsp
		push r12
		mov rsi, 420
		mov rax, 90
		syscall

		push rsi
		pop rdx
		mov rsi, 577
		mov rax, 2
		syscall

		pop rcx

		mov r12, rax
		mov rdi, rax
		lea rsi, [rel code]
		mov rdx, 10
		mov r13, rcx
		mov r8, 37
		mov r9, 96
		lea rax, [rel code]
		push rax
		xor rax, rax
		call dprintf

		cmp rax, 0x0
		jl .next_loop

		push r12
		pop rdi
		mov rax, 3
		syscall

		push r13
		pop rcx

		.next_loop:
		dec rcx
		jmp .loop
	.end_loop:
	add rsp, 256
	pop rbp

exit:
	xor rdi, rdi
	mov rax, 60
	syscall

filename db FILENAME, 0x0
code db `section.text:%1$c	global _start%1$c	extern sprintf%1$c	extern dprintf%1$c%1$c%3$cdefine		FILENAME		%4$cSully_%3$cd.s%4$c%1$c%1$c_start:%1$c	mov rbp, rsp%1$c	push rbp%1$c	mov rsp, rbp%1$c	sub rsp, 256%1$c	mov rcx, %2$d%1$c	cmp rcx, 0x0%1$c	jle .end_loop%1$c	.loop:%1$c		cmp rcx, 0x0%1$c		jl .end_loop%1$c%1$c		mov rdi, rsp%1$c		lea rsi, [rel filename]%1$c		mov rdx, rcx%1$c		mov r12, rcx%1$c		call sprintf%1$c%1$c		mov rdi, rsp%1$c		push r12%1$c		mov rsi, 420%1$c		mov rax, 90%1$c		syscall%1$c%1$c		push rsi%1$c		pop rdx%1$c		mov rsi, 577%1$c		mov rax, 2%1$c		syscall%1$c%1$c		pop rcx%1$c%1$c		mov r12, rax%1$c		mov rdi, rax%1$c		lea rsi, [rel code]%1$c		mov rdx, 10%1$c		mov r13, rcx%1$c		mov r8, 37%1$c		mov r9, 96%1$c		lea rax, [rel code]%1$c		push rax%1$c		xor rax, rax%1$c		call dprintf%1$c%1$c		cmp rax, 0x0%1$c		jl .next_loop%1$c%1$c		push r12%1$c		pop rdi%1$c		mov rax, 3%1$c		syscall%1$c%1$c		push r13%1$c		pop rcx%1$c%1$c		.next_loop:%1$c		dec rcx%1$c		jmp .loop%1$c	.end_loop:%1$c	add rsp, 256%1$c	pop rbp%1$c%1$cexit:%1$c	xor rdi, rdi%1$c	mov rax, 60%1$c	syscall%1$c%1$cfilename db FILENAME, 0x0%1$ccode db %4$c%5$s%4$c, 0x0%1$c`, 0x0
