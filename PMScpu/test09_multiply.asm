; test9, multiplication ::
;       <pseudo code>
;

.text           ; -LABEL is relative, offset
            CRR
            CRO
            ;;;;
            LDN
            TAR.G %D1           ; D1: <switches>
            LDR.V %D2, #5       ; D2: 5
            LDR.V %D3, #0       ; result
            ORA.G %D1, %O1
            ORA.G %D2, %O2
            ORA.G %D3, %O3
            ;;
loop        TRA.G %D2           ; D2 & #01 (get LSB) → A
            CAN
            CAZ                 ; A<>0?
            BRA.O -addit        ; if true: add it, else: go on to next binary place
            JMP.O -goon
            ;;
addit       TRA.G %D1           ; D3 += D1
            AOP.G %D3, $9
            ORA.G %D3, %O3
            ;;
goon        SHL.G %D1           ; D1 *= 2 // or: SHL.G %D1 ; AOP.G %D1, $c
            ORA.G %D1, %O1
            ;;
            SHR.G %D2           ; D2 /= 2
            ORA.G %D2, %O2
            CAZ                 ; is there more to do?
            BRA.O -loop         ; if true: loop, else: we're done
end         ORA.G %D3, %O7      ; result (D3) → O7 (N(#12)=#5a, N(#06)=#1e)
            ;;;;
            NOP
            HLT

.data           ; LABEL is absolute


STACK       1MAU

; CLASSPATH=$HOME/projects/eclipse-ws/support-jars/picocli-4.2.0.jar:../bin/
; java Main -s PMScpu_spec.txt test09_multiply.asm
;
; sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.out | tr -d '\n' | sed -e 's+,,+,+g' -e 's+,$+\n+g' -e 's+^,+xo0,0,+g'
;
;   xo0,0,08,09,1E,38,01,18,02,05,18,03,00,29,11,29,22,29,33,30,02,6F,B0,67,FE,02,F1,06,30,01,40,93,29,33,54,01,29,11,55,02,29,22,67,FE,E6,29,73,00,01,00


;------------

;  xo0,0,08,09,18,01,12,18,02,05,18,03,00,29,11,29,22,29,33
;  xo0,0,29,11,29,22,29,33
;loop:
;  xo0,0,30,02,6F,B0,67
;:add it
;  xo0,0,30,01,40,93,29,33
;:end/goon
;  xo0,0,54,01,29,11
;  xo0,0,55,02,29,22,67
;:true loop
;  xo0,0,29,13

;------------


