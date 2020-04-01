#!/bin/bash

nsplit=$(egrep -n '^; OPCODES' PMScpu_spec.txt | cut -f1 -d:)

tail -n +$nsplit PMScpu_spec.txt |
    sed -n -e 's/^\([A-Z][A-Z\.]*\).*$/mnem: "\1"/p' | sort -u -k2


echo "################## op-code check"


tail -n +$nsplit PMScpu_spec.txt |
awk '/^[A-Z][A-Z\.]*/ {opc=$1;}
/^\topc=[0-9a-f]*H/  {print substr($1, 5, 2) " " opc;}' |sort -u -k2

