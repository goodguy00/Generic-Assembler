; template ::
;       testing input switches
;

.text           ; -LABEL is relative, offset
            CRO
            ;;;;
            LDN
            OAA %O0
            ;;;;
            NOP
            HLT

.data           ; LABEL is absolute


STACK       1MAU

;
; java -cp ../bin/ Main PMScpu_spec.txt test01_input.asm
;
; sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.txt | tr -d '\n' | sed -e 's+,,+,+g' -e 's+,$+\n+g' -e 's+^,+xo0,0,+g'
;
; xo0,0,09,1E,AF,00,00,01,00
;
