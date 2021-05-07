#查找最大值
.section .data

#这些是数据项
data_items: # data_items是一个指代其后位置的标签
 .long 3,67,34,222,45,75,54,35,44,90,33,32,22,11,66,0

 .section .text

 .globl _start
_start:
 movl $0, %edi 
 movl data_items(,%edi,4), %eax 
 movl %eax, %ebx

start_loop:
 cmpl $0,%eax
 je loop_exit
 incl %edi
 movl data_items(,%edi,4), %eax
 cmpl %ebx , %eax
 jle start_loop

 movl %eax, %ebx
 jmp start_loop

loop_exit:
 movl $1,%eax
 int $0x80
