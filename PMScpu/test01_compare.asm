; template ::
;       testing compares
;

.text           ; -LABEL is relative, offset
            ;;;;
            LDA.V #4
            CGT.V #4
            ;;;;
            LDA.V #4
            CGT.A VAR_2
            ;;;;
            NOP
            HLT

.data           ; LABEL is absolute

VAR_1       1MAU 41H
VAR_2       8MAU 6e1baf95H

STACK       1MAU


; CLASSPATH=$HOME/projects/eclipse-ws/support-jars/picocli-4.2.0.jar:../bin/
; java Main -s PMScpu_spec.txt test01_compare.asm
;
; sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.out | tr -d '\n' | sed -e 's+,,+,+g' -e 's+,$+\n+g' -e 's+^,+xo0,0,+g'
;
; xo0,0,10,04,6B,04,00,01,00
;
; CEQ: xo0,0,10,04,68,04 (T)
; CNE: xo0,0,10,04,69,04 (F)  xo0,0,10,04,69,05 (T)
; CGT: xo0,0,10,04,6b,05 (F)  xo0,0,10,04,6b,03 (T)
; CAZ: xo0,0,10,04,67    (T)  xo0,0,10,00,67    (F)
