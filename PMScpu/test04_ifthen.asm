; test6 ::
;       a=9
;       if (a==9) { o[2]=#71}
;       else { o[2]=#ac}
;

.text           ; -LABEL is relative, offset
            CRO
            LDA.V #9
            CEQ.V #9
            BRA.O -iftrue
iffalse     OMM.V %O2, #ac
            JMP.O -ifend
iftrue      OMM.V %O2, #71
ifend       NOP
            HLT


.data           ; LABEL is absolute

STACK       1MAU


;
; java -cp ../bin/ Main PMScpu_spec.txt test04_ifthen.asm
;
; sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.txt | tr -d '\n' | sed -e 's+,,+,+g' -e 's+,$+\n+g' -e 's+^,+xo0,0,+g'
;
;   xo0,0,09,10,09,68,09,FE,05,A0,02,AC,F1,03,A0,02,71,00,01,00
