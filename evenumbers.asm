                                       section         .text
	                                global         main
                                        extern         printf

main:
	                                   mov         ebx  ,  0         ;number 0 to ebx
                                           mov         esi  ,  100       ;number 100 to esi
loop:
                                          push         esi               ;first  parameter
                                          push         ebx               ;second parameter
	                                  push         message           ;third  parameter
	                                  call         printf            ;call inbuilt printf statement for outputting
	                                   add         ebx  ,  2         ;increment the value of ebx by 2
                                           cmp         ebx  , esi        ;compare  ebx to esi
                                           jle         loop              ;if less than or equal to zero go to loop
                                           add         esp  ,  80	 ;clear all the stack
	                                   ret
                                           syscall

                                       message	       db	     "Value = %d",10,0
