assume cs:code
; ��������ĸ��ɴ�д
data segment
    db 'abcdefg',0
    dw 7
data ends

code segment

start:
    mov ax,data
    mov ds,ax
    
    mov si,0   ; ���ݲ�������ĸ�����ַ
    mov cx,7   ; ���ݲ��� 7����ĸ
    
    call capital_i2
    
    mov ax,4c00h
    int 21h 
    
    ; �ַ����׵�ַ��si
    ; �ַ������ȣ�cx
capital:
    and [si], 11011111b
    inc si
    loop capital
    ret
    
    ; �Ľ��棬��һ��ȫ����ĸ����0Ϊ��β���ַ��ܣ�ת��Ϊ��д
    ; �ַ����׵�ַ��si
    ; cx�����ڼ�⵱ǰ�ֽ��Ƿ�Ϊ��
capital_i:
    mov cl, [si]
    mov ch, 0                   
    jcxz ok
    and [si], 11011111b
    inc si
    jmp short capital_i
ok:
    ret
    
    
    ; ����Ĵ�����ͻ
    ; ��д�ӳ����ʱ�򲻱ع��ĵ�����ʹ������Щ�Ĵ���
    ; ��д�����ӳ���ĳ��򲻱ع����ӳ��򵽵�ʹ������Щ�Ĵ���
    ; ���Ĵ����е����ݶ������������ڷ���ǰ�ָ�
    ; �Ľ���2����һ��ȫ����ĸ����0Ϊ��β���ַ��ܣ�ת��Ϊ��д
    ; �ַ����׵�ַ��si
    ; cx�����ڼ�⵱ǰ�ֽ��Ƿ�Ϊ��
capital_i2:
    push cx
    push si
change:
    mov cl, [si]
    mov ch, 0
    jcxz ok_i2
    and byte ptr [si], 11011111b
    inc si
    jmp short change
ok_i2: 
    pop si
    pop cx
    ret
    
    
code ends
       
       
end start