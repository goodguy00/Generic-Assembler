; template ::
;       testing shifts
;

.text           ; -LABEL is relative, offset
            ;;;;
            LDA.V #56
            SHL
            ;;;;
            NOP
            HLT

.data           ; LABEL is absolute


STACK       1MAU

;
; java -cp ../bin/ Main PMScpu_spec.txt test01_shifter.asm
;
; sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.txt | tr -d '\n' | sed -e 's+,,+,+g' -e 's+,$+\n+g' -e 's+^,+xo0,0,+g'
;
; xo0,0,10,56,50,00,01,00
;
; SHL: xo0,0,10,56,50 (#ac)
; SHR: xo0,0,10,56,51 (#2b)
; RLL: xo0,0,10,e5,52 (#cb)
; RLR: xo0,0,10,e5,53 (#f2)

