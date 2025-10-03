#!/bin/bash
read -p "Dame el primer número: " num1
read -p "Dame el segundo número: " num2
media=$(((num1+num2)/2))
echo "La media de $num1 y $num2 es $media"