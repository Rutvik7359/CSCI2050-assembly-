extern printf
extern scanf

global main

section .text

isPrime:

	; strategy:  check if divisible by 2..(n-1)
	mov rbx, 2

primeLoop:
	mov rdx, 0
	mov rax, rdi
	div rbx
	cmp rdx, 0
	je notPrime

	inc rbx              ; divisor++
	cmp rbx, rdi
	jne primeLoop

	mov rax, 1
	ret

notPrime:
	mov rax, 0
	ret

isPalindrome:
  mov rsi, rdi
  ; rdi - end of string
  ; rsi - start of string

  ; find the last character of the string
nextCharLastChar:
  mov al, [rdi]
  cmp al, 0
  je foundLastChar

  inc rdi
  jmp nextCharLastChar

foundLastChar:
  dec rdi       ; rdi now points to the last character


palLoop:
	mov al, [rsi]   ; first character
	mov ah, [rdi]   ; last character
	cmp al, ah
	jne notPal

	inc rsi
	dec rdi
	cmp rdi, rsi
	jge palLoop

	mov rax, 1 ; return true
	ret

notPal:
	mov rax, 0 ; return false
	ret


main:
	; read in the number
  mov rdi, numberPrompt
  mov rax, 0
  call printf

  mov rdi, numberFormat
	mov rsi, number
	mov rax, 0
	call scanf

	; determine if the number is prime
	mov rdi, [number]
	call isPrime

	cmp rax, 0
	je printNotPrime

  mov rdi, primeMessage
  mov rax, 0
  call printf

	jmp nextStep

printNotPrime:
  mov rdi, notPrimeMessage
  mov rax, 0
  call printf

nextStep:

	; read in the string
  mov rdi, stringPrompt
  mov rax, 0
  call printf

  mov rdi, stringFormat
	mov rsi, string
	mov rax, 0
	call scanf

	mov rdi, string
	call isPalindrome

	cmp rax, 0
	je printNotPal

  mov rdi, palMessage
  mov rax, 0
  call printf

	jmp endProgram

printNotPal:
  mov rdi, notPalMessage
  mov rax, 0
  call printf

endProgram:
	mov rax, 0
	ret				; return 0

section .data

numberPrompt    db "Enter a number: ", 0
numberFormat    db "%d", 0
number          dq 0
primeMessage    db "This number is prime.", 0ah, 0dh, 0
notPrimeMessage db "This number is not prime.", 0ah, 0dh, 0

stringPrompt    db "Enter a string: ", 0
stringFormat    db "%s", 0
string          times 50 db 0
palMessage      db "This string is a palindrome.", 0ah, 0dh, 0
notPalMessage   db "This string is not a palindrome.", 0ah, 0dh, 0
