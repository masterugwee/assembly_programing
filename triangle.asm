         section .bss
maxlines equ      8
datasize equ      44
output:  resb      datasize
        
         section .text
         
         global _start
         
_start:
         mov      rdx,  output    ;rdx holds the byte to write
         mov      r8,   1         ;initial line length
         mov      r9,   0         ;number of stars to be printed

line:  
         mov      byte[rdx],'*'   ;character to print
         inc      rdx             ;advance the pointer to next cell to write  
         inc      r9              ;increment the star counter
         cmp      r9,   r8        ;compare if the line count = number of stars
         jne      line            ;not yet, keep looping

lineDone:
         mov      byte[rdx],10    ;write a new line
         inc      rdx             ;move the pointer to 	where next char goes
         inc      r8              ;increment the line counter
         mov      r9,   0         ;make the number of stars to zero
         cmp      r8,   maxlines  ;check if we have reached the maxlines
         jng      line            ;no, then start writing

done:
         mov      rax,  1         ;system call to write
         mov      rdi,  1	  ;file handle 1 is stdout 
         mov      rsi,  output    ;address of string to output
         mov      rdx,  datasize  ;number of lines
         syscall                  ;invoke system to write
         mov      rax,1           ;exit sys call
         xor      rdi,rdi         ;exit code 0
         syscall                  ;invoke OS to exit
