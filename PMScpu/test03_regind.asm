; test5 ::
;       a=2; out[a]=#4a; ...
;

.text           ; -LABEL is relative, offset
            LDA.I %O2
            OMI.V #4a   ; → O2
            ICA
            OMI.V #5b   ; → O3
            ICA
            OMI.V #6c   ; → O4
            NOP

.data           ; LABEL is absolute

;
; java -cp ../bin/ Main PMScpu_spec.txt test03_regind.asm
;
; sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.txt | tr -d '\n' | sed -e 's+,,+,+g' -e 's+,$+\n+g' -e 's+^,+xo0,0,+g'
;
;   xo0,0,10,02,A8,4A,20,A8,5B,20,A8,6C,00
