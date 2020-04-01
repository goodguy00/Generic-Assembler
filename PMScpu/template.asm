; template ::
;       <pseudo code>
;

.text           ; -LABEL is relative, offset
            ISP.A STACK
            CRR
            CRO
            ;;;;
            <the code>
            ;;;;
            NOP
            HLT

.data           ; LABEL is absolute


STACK       1MAU

; CLASSPATH=$HOME/projects/eclipse-ws/support-jars/picocli-4.2.0.jar:../bin/
; java Main -s PMScpu_spec.txt $(ls -t1r *.asm|tail -1)
;
; sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.out | tr -d '\n' | sed -e 's+,,+,+g' -e 's+,$+\n+g' -e 's+^,+xo0,0,+g'
;
; testing: sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.out | sed -e 's+,,+,+g' -e 's+,$++g' -e 's+^,+xo0,0,+g'
