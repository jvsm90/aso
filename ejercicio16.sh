#!/bin/bash

# FOR
s=0
for i in {1..1000}; do s=$((s+i)); done
echo "Suma con for:   $s"

# WHILE
s=0; i=1
while (( i <= 1000 )); do s=$((s+i)); ((i++)); done
echo "Suma con while: $s"

# UNTIL
s=0; i=1
until (( i > 1000 )); do s=$((s+i)); ((i++)); done
echo "Suma con until: $s"