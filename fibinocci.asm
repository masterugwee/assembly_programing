                      global    main
                      extern    printf

                      section   .text

main:
  	            
                      push      rbx                                               ;rbx will be used in the future.
                      mov       ecx  ,  100                                       ;ecx will be counted down from 100 to 0
                      xor       rax  ,  rax                                       ;xoroing will change the value to 0
                      xor       rbx  ,  rbx                                       ;xoring rbx will change it to zero
                      inc       rbx                                               ; rbx is 1

print:         
                      push      rax                                               ;saving rax
                      push      rcx                                               ;saving rcx
                      mov       rdi  ,  format                                    ;set first parameter
                      mov       rsi  ,  rax                                       ;setting second parameter(ie current number)  
                      xor       rax  ,  rax                                       ;again changing rax value to zero


                      call      printf                                            ;printf(first parameter, current)
                      pop       rcx                                               ;restoring rcx  
                      pop       rax                                               ;restoring rax
                      

                      mov       rdx  ,  rax                                       ;saving the current number
                      mov       rax  ,  rbx                                       ;changing next number to current  
                      add       rbx  ,  rdx                                       ;get the new next number
                      dec       ecx                                               ;reducing ecx for the loop
                      jnz       print                                             ;if not zero then print more 
                      

                      pop       rbx                                               ;restoring rbx
                      ret                                                         ;return 

format:
                      db       "%20ld" , 10, 0                                    ;20ld is for long integer value
