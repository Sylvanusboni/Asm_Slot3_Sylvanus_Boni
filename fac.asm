global my_find

my_find:
	xor rax, rax
	cmp sil, 0
	je arobase
	cmp sil, '0'
	jl arobase
	cmp sil, '9'
	jg arobase
	cmp byte[rdi], 0
	je arobase
	jmp loop

loop:
	cmp byte[rdi + rax], 0
	je arobase
	mov bl, byte[rdi + rax]
	cmp bl, sil
	je found
	inc rax
	jmp loop

found:
	mov bl, byte[rdi + rax]
	cmp bl, '5'
	jle increment
	cmp bl, '5'
	jg decrement
	ret

increment:
	mov bl, byte[rdi + rax]
	add bl, 1
	movsx rax, bl
	ret

decrement:
	mov bl, byte[rdi + rax]
	sub bl, 1
	movsx rax, bl
	ret

arobase:
	mov bl, '@'
	movsx  rax, bl
	ret
