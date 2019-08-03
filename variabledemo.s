#GDB

.data

Hellowrld:
 .ascii "Hello World!"

Bytelocation:
 .byte = 10

Int32:
 .int 2

Int16:
 .short 3

Float:
 .float 10.21
IntegerArray:
 .int 10,20,30,40,50

.bss
   .comm LargeBuffer, 10000

.text
  .globl _start

_start:
 nop

 movl $10 ,%eax

 #Mov value into memory location

 movw $50,Int16

 #Mov value 50 into memory location

 movl %eax,%ebx 

#Mov data between registers

 movl Int32, %eax 

#Mov value from register to  memory

 movb $3, %al
 movb %al , Bytelocation

 # Mov data into an indexed memory location.
 # Location is decided by baseaddress(offset,Index,Datasize)
 # Offset and Index must be registers,Datasize can be a numerical value

 movl $0, %ecx
 movl $2, %edi
 movl $22, IntegerArray(%ecx,%edi,4)

# Indirect addressing using registers

movl $Int32, %eax
movl (%eax), %ebx

movl $9, (%eax)

#Exit syscall to exit the program
 movl $1,%eax
 movl $0,%ebx
 int $0x80 
