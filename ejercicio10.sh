#!/bin/bash
read -p "Dame un número: " num

if (( num % 2 == 0)); then
echo "El número $num es par"
else
echo "El número $num es impar"
fi