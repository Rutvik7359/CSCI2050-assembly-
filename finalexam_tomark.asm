extern printf
extern scanf

global main

section .text


isDivisibleByThree:
  mov rbx, 0
  mov rax, [rbx] ;make array
  mov rdx, 0
  mov rcx, 3
  idiv rcx

  cmp rdx, 0
  jne isDivisibleByThreeLoop



isDivisibleByThreeLoop:
  mov rsi, [rbx]
  add [rbx], rdx
  mov rdx, rsi

  inc rbx
  cmp rbx,rdi
  jne isDivisibleByThreeLoop

  mov rax, [rbx]
  ret

main:
  mov rdi, prompt
  mov rax, 0
  call printf

  mov rdi, inputFormat
  mov rsi, n
  mov rax, 0
  call scanf

  mov rdi, n
  call isDivisibleByThree

  mov rdi, outputFormat
  mov rsi, [n]
  mov rdx, rax
  mov rax, 0
  call printf

endOfProgram:
  mov rax, 0
  ret


section .data
  prompt  db "Enter a value for n:", 0
  inputFormat db "%d", 0
  n dq  0
  outputFormat  db  "The Sum of all values divisible by 3 is %d.", 0ah, 0dh, 0
