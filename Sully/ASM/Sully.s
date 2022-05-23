section.text:
	global _start
	extern system
	extern sprintf
	extern dprintf

%define		FILENAME		`Sully_%d.s`
%define		COMPILE			`nasm -felf64 Sully_%1$d.s -o Sully_%1$d.o; gcc -Wall -Wextra -Werror -no-pie -nostartfiles Sully_%1$d.o -o Sully_%1$d; rm -rf Sully_%1$d.o; ./Sully_%1$d`

_start:
	mov rbp, rsp
	push rbp
	mov rcx, 5
	mov r8, 1

	cmp rcx, 0
	jle exit
	cmp r8, 0
	je .decre
	jmp .next
	.decre:
	dec rcx
	.next:
	mov rsp, rbp
	sub rsp, 256

	mov rdi, rsp
	lea rsi, [rel filename]
	mov rdx, rcx
	mov r13, rcx
	call sprintf

	mov rdi, rsp
	mov rsi, 420
	mov rax, 90
	syscall

	mov rdx, rcx
	push rsi
	pop rdx
	mov rsi, 577
	mov rax, 2
	syscall

	cmp rax, 0
	jl exit

	push r13
	pop rcx

	cmp rcx, 0
	jne .zero
	mov r8, 1
	jmp .nnext
	.zero:
	mov r8, 0
	.nnext:

	mov r12, rax
	mov rdi, rax
	lea rsi, [rel code]
	mov rdx, 10
	mov r13, rcx
	mov r9, 37
	push 96
	lea rax, [rel code]
	push rax
	xor rax, rax
	call dprintf

	push r12
	pop rdi
	mov rax, 3
	syscall

	mov rdi, rsp
	lea rsi, [rel compile]
	mov rdx, r13
	call sprintf

	mov rdi, rsp
	call system

	add rsp, 256
	pop rbp

exit:
	xor rdi, rdi
	mov rax, 60
	syscall

filename db FILENAME, 0x0
compile db COMPILE, 0x0
code db `section.text:%1$c	global _start%1$c	extern system%1$c	extern sprintf%1$c	extern dprintf%1$c%1$c%4$cdefine		FILENAME		%6$cSully_%4$cd.s%6$c%1$c%4$cdefine		COMPILE			%6$cnasm -felf64 Sully_%4$c1$d.s -o Sully_%4$c1$d.o; gcc -Wall -Wextra -Werror -no-pie -nostartfiles Sully_%4$c1$d.o -o Sully_%4$c1$d; rm -rf Sully_%4$c1$d.o; ./Sully_%4$c1$d%6$c%1$c%1$c_start:%1$c	mov rbp, rsp%1$c	push rbp%1$c	mov rcx, %2$d%1$c	mov r8, %3$d%1$c%1$c	cmp rcx, 0%1$c	jle exit%1$c	cmp r8, 0%1$c	je .decre%1$c	jmp .next%1$c	.decre:%1$c	dec rcx%1$c	.next:%1$c	mov rsp, rbp%1$c	sub rsp, 256%1$c%1$c	mov rdi, rsp%1$c	lea rsi, [rel filename]%1$c	mov rdx, rcx%1$c	mov r13, rcx%1$c	call sprintf%1$c%1$c	mov rdi, rsp%1$c	mov rsi, 420%1$c	mov rax, 90%1$c	syscall%1$c%1$c	mov rdx, rcx%1$c	push rsi%1$c	pop rdx%1$c	mov rsi, 577%1$c	mov rax, 2%1$c	syscall%1$c%1$c	cmp rax, 0%1$c	jl exit%1$c%1$c	push r13%1$c	pop rcx%1$c%1$c	cmp rcx, 0%1$c	jne .zero%1$c	mov r8, 1%1$c	jmp .nnext%1$c	.zero:%1$c	mov r8, 0%1$c	.nnext:%1$c%1$c	mov r12, rax%1$c	mov rdi, rax%1$c	lea rsi, [rel code]%1$c	mov rdx, 10%1$c	mov r13, rcx%1$c	mov r9, 37%1$c	push 96%1$c	lea rax, [rel code]%1$c	push rax%1$c	xor rax, rax%1$c	call dprintf%1$c%1$c	push r12%1$c	pop rdi%1$c	mov rax, 3%1$c	syscall%1$c%1$c	mov rdi, rsp%1$c	lea rsi, [rel compile]%1$c	mov rdx, r13%1$c	call sprintf%1$c%1$c	mov rdi, rsp%1$c	call system%1$c%1$c	add rsp, 256%1$c	pop rbp%1$c%1$cexit:%1$c	xor rdi, rdi%1$c	mov rax, 60%1$c	syscall%1$c%1$cfilename db FILENAME, 0x0%1$ccompile db COMPILE, 0x0%1$ccode db %6$c%5$s%6$c, 0x0%1$c`, 0x0
