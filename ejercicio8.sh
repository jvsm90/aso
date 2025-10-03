#!/bin/bash
read -p "Dame el primer número: " num1
read -p "Dame el segundo número: " num2
if [ "$num1" -gt "$num2" ]; then
    echo "$num1 es mayor"
elif
    [ "$num1" -lt "$num2" ]; then
    echo "$num2 es mayor"
else
  echo "Son iguales"
fi