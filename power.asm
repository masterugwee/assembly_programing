                                   global         main
                                   extern         printf
                                   extern         puts
                                   extern         atoi


                                   section        .text



                  main:
                                   push           r12                  ;Saving r12
                                   push           r13                  ;Saving r13
                                   push           r14                  ;Saving r14
                                   
                            
                                   cmp    rdi  , 3                     ;2 arguments are needed.
                                   jne    error1                       ;  
                                   mov    r12  ,  rsi                  ;Moving rsi value to r12
                                   mov    rdi  ,  [r12+16]             ;argv[2]
                                   call   atoi                         ;x in eax
                                   cmp    eax,   0                     ;comparing 
                                   jl     error2                       ;jump if lesser
                                   mov    r13d ,  eax                  ;moving 
                                   
                                   mov    rdi  ,[r12+8]
                                   call   atoi
                                   mov    r14d , eax  
                                   mov    eax  , 1
                                    
                 check:
                                
                                   test  r13d  , r13d
                                   jz    gotit
                                   imul  eax   , r14d
                                   dec   r13d
                                   jmp   check

                  
                  gotit: 
                 
                                   mov    rdi , answer
                                   movsxd rsi , eax
                                   xor    rax , rax
                                   call   printf
                                   jmp    done

                  error1:
                                   mov    edi , badArgumentCount
                                   call   puts
                                   jmp    done
                  
                  error2:
                                   mov    edi , negativeExponent
                                   call   puts

                    done: 
                                   pop    r14
                                   pop    r13
                                   pop    r12
                                   ret
                                      
                  answer:
                     
                       db          "%d", 10 , 0
        badArgumentCount:
                       db          "Requires exactely two arguments", 10,0
        
        negativeExponent:
                       db          "The exponent may not be negative", 10,0                   
