.MODEL SMALL
.STACK 100H
.DATA
D1 DB "ENTER BINARY : $"    
D2 DB 0AH,0DH,'INVALID_ $'
.CODE
MAIN PROC 
    
    CALL REV  
    
    REVERSE:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
      
     
    
    JCXZ EXIT
    
    POPZ:
    POP DX
    INT 21H
    LOOP POPZ
    
    EXIT:
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    
    REV PROC
    
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,D1
    INT 21H 
    
    XOR CX,CX
    ;XOR BX,BX
    
    MOV AH,1
    INT 21H
    
    WHILE:
    CMP AL,0DH
    JE REVERSE 
    
    CMP AL,30H
    JE VALID_ 
    
    CMP AL,31H
    JE VALID_ 
    JG INVALID_
    
    INVALID_:
    MOV AH,9
    LEA DX,D2
    INT 21H   
    JMP EXIT
    VALID_:
    
    PUSH AX
    INC CX
    INT 21H 
    
    
    JMP WHILE
    
    
    REV ENDP
RET
    
END MAIN