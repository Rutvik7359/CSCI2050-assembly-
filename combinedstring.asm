extern printf
extern scanf

global main

section .text

Copy1:
	mov al, [rdi]
	mov [rsi],al
	inc rsi
	inc rdi
	jmp endOfString1

endOfString1:
	mov cl,[rdi]
	cmp cl,0
	je nextString
	jmp Copy1

nextString:
	mov rdi, string2
	jmp Copy2

Copy2:
	mov al, [rdi]
	mov [rsi],al
	inc rsi
	inc rdi
	jmp endOfString2

endOfString2:
	mov cl,[rdi]
	cmp cl,0
	je Display
	jmp Copy2

Display:
	mov rdi, outputFormat
	mov rsi,string3
 	mov rax, 0
  	call printf
	ret

main:
  	mov rdi, prompt
  	mov rax, 0
 	call printf

 	mov rdi, inputFormat
 	mov rsi, string1
 	mov rax, 0
 	call scanf

 	mov rdi, prompt2
 	mov rax, 0
 	call printf
	
 	mov rdi, inputFormat
 	mov rsi, string2
 	mov rax, 0
 	call scanf
	

 	mov rsi, string3
 	mov rdi, string1
  
  	jmp Copy1

section .data
  prompt       db "Enter the first string: ", 0
  inputFormat  db "%s", 0
  prompt2      db "Enter the second string: ", 0
  inputFormat2 db "%s",0
  outputFormat db "Combined String: %s", 0ah, 0dh, 0

section .bss
	string1: resb 100
	string2: resb 100
	string3: resb 100
