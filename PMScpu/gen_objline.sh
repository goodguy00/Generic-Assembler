#!/bin/bash

sed -e 's+^[0-9a-z]*:++' -e 's+  *+,+g' object_code.txt | tr -d '\n' | sed -e 's+,,+,+g' -e 's+,$+\n+g' -e 's+^,+xo0,0,+g'

