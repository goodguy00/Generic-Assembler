; test7 ::
;        test ALU
;

.text           ; -LABEL is relative, offset
            CRO
            CRR
;            LDR.V %D1, #12
            LDN
            TAR.G %D1           ; D1: <switches>
            ORA.G %D1, %O1
            ;;
            TRA.G %D1
            AOP.G %D1, $c   ; %Dx, because aop($c:A*2) refers only to A, = #24
            ORA.G %D1, %O1
            ;;
            LDA.V #4e
            AON.G %D1, $6   ; #4e XOR #24 (from above) = #6a
            ORA.G %D1, %O1
            ;;
            TRA.G %D1
            AOP.G %D1, $c   ; %Dx, because aop($c:A*2) refers only to A, = #d4
            ORA.G %D1, %O1
            ;;
            LDA.V #e4
            AOP.G %D1, $6   ; #e4 aop($6:A-B-1) #d4 (from above) = #0f
            ORA.G %D1, %O1
            ;;
            TRA.G %D1
            AOP.G %D1, $c   ; %Dx, because aop($c:A*2) refers only to A, = #1e
            ORA.G %D1, %O1
            ;;
            LDR.V %D3, #91
            TRA.G %D3
            AOP.G %D1, $9   ; #91 aop($9c:A+B) #1e (from above) = #af
            ORA.G %D1, %O1
            ;;
            TRA.G %D1
            AOP.G %D1, $c   ; %Dx, because aop($c:A*2) refers only to A, = #5e (with carry)
            ORA.G %D1, %O1
            ;;
            NOP
            HLT

.data           ; LABEL is absolute


STACK       1MAU

; CLASSPATH=$HOME/projects/eclipse-ws/support-jars/picocli-4.2.0.jar:../bin/
; java Main -s PMScpu_spec.txt test01_alu.asm
;
; sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.out | tr -d '\n' | sed -e 's+,,+,+g' -e 's+,$+\n+g' -e 's+^,+xo0,0,+g'
;
;   xo0,0,07,08,15,90,01,29,11,30,01,40,C1,29,11,10,4E,41,61,29,11,30,01,40,C1,29,11,10,E4,40,61,29,11,30,01,40,C1,29,11,70,03,91,30,03,40,91,29,11,30,01,40,C1,29,11,00,01,00
;       xo0,0,30,01,40,C1,29,11     AOP.G %D1, $c
;       xo0,0,10,4E,41,61,29,11     AON.G %D1, $6
;       xo0,0,30,01,40,C1,29,11     AOP.G %D1, $c
;       xo0,0,10,4E,40,61,29,11     AOP.G %D1, $6
;       xo0,0,30,01,40,C1,29,11     AOP.G %D1, $c
