; test8 ::
;       d4=0;
;       for (d0=0; d0<=4; d0++) {d4+=d0};
;       o7=d4;  // =6
;

.text           ; -LABEL is relative, offset
            CRO
            LDR.V %D1, #0
            TRA.G %D1
            ;;
loop        CGT.V #4            ; D0 > 4 (D0 is still in A)
            BRA.O -loopend
            ;;
            TAR.G %D0
            AOP.G %D1, $9       ; D4 += D0
            TAR.G %D1
            ;;
            TRA.G %D0           ; D0++
            ICA
            ;;
            JMP.O -loop
            ;;
loopend     ORA.G %D1, %O7      ; result (D4) → O7 (4= #0a; 6= #15)
            NOP
            HLT

.data           ; LABEL is absolute


STACK       1MAU

;
; java -cp ../bin/ Main PMScpu_spec.txt test08_loop.asm
;
; sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.txt | tr -d '\n' | sed -e 's+,,+,+g' -e 's+,$+\n+g' -e 's+^,+xo0,0,+g'
;
;   xo0,0,09,18,01,00,30,01,6B,04,FE,0B,38,00,40,91,38,01,30,00,20,F1,F1,29,71,00,01,00
