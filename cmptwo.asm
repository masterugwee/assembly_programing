                                global      main
                                extern      printf
                                extern      scanf




                               section       .data
                                 msg             db "Number 1 ", 10 ,0
                                 msg2            db "Number 2 ", 10 ,0
                                 fmt             db "%d" , 0
                                 fmtout          db "%d" , 10 , 0
                                 inpt1 : times 4 db 0
                                 inpt2 : times 4 db 0



                               section       .text

main:

                               push          ebx
                               push          ecx

                               push          msg
                               call          printf
                                add          esp , 4


                               push          inpt1
                               push          fmt
                               call          scanf
                               add           esp , 8

                               push          msg2
                               call          printf
                                add          esp , 4


                               push          inpt2
                               push          fmt
                               call          scanf
                                add          esp , 8

                                mov          ebx , dword[inpt1]
                                mov          ecx , dword[inpt2]
                                cmp          ebx ,   ecx
                                 jl          print
                                 jg          print2
print:
                               push          ecx
                               push          fmtout
                               call          printf
                                add          esp , 8
                                pop          ecx
                                jmp          done

print2:
                               push          ebx
                               push          fmtout
                               call          printf
                                add          esp , 4
                                pop          ebx
                                jmp          done


done:
                                pop          ecx
                                pop          ebx
                                mov          eax , 0
                                ret
