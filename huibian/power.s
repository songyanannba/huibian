# 目的 展示程序怎么工作

# 主程序中的所有内容都存储在寄存器中，因此数据段不含任何内容
 .ection .data
 
 .section .text

 .global _start
_start:
 pushl $3 #押入第二个参数
 pushl $2 #押入第一个参数
 call power
 addl $8 , %esp
 pushl %eax

 pushl $2
 pushl $5
 call power
 addl $8 , %esp
 popl %ebx

 addl %eax,%ebx

 movl $1,%eax
 int $0x80


# 本函数用于计算 一个数的幂 
# 输入
# 输出
# 注意
# 变量

 .type power, @function
power:
 pushl %ebp
 movl %esp , %ebp 
 subl $4 , %esp  #为本地存储保留空间
 movl 8(%ebp), %ebp
 movl 12(%ebp), %ecx

 movl %ebx ,-4(%ebp) #存储当前结果
 
power_loop_start:
 cmpl $1 ,%ecp
 je end_power
 mover -4(%ebp), %eax #将当前结果移入%eax
 imull %ebx, %eax
 movl %eax, -4(%ebp)

 decl %ecx
 jmp power_loop_start
 
end_power:
 movl -4(%ebp) , %eax
 movl %ebp , %esp
 popl %ebp #恢复基址指针
 ret






