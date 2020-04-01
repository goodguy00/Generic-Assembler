.text           ; -LABEL is relative, offset
            CRO
            JMP.O -skip
            OMM.V %O4, #a1
            NOP
skip        OMM.V %O4, #9c
            HLT
            NOP

.data           ; LABEL is absolute

;
; java -cp ../bin/ Main PMScpu_spec.txt test02_jump.asm
;
; sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.txt | tr -d '\n' | sed -e 's+,,+,+g' -e 's+,$+\n+g' -e 's+^,+xo0,0,+g'
;
;    xo0,0,09,F1,04,A0,04,A1,00,A0,04,9C,01,00
