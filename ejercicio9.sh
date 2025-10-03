#!/bin/bash
read -p "Número 1: " num1
read -p "Número 2: " num2
echo "1) Sumar 2) Restar  3) Multiplicar  4) Dividir"
read -p "Elige opción (1-4): " operacion
case "$operacion" in
  1) echo "Resultado: $((num1 + num2))" ;;
  2) echo "Resultado: $((num1 - num2))" ;;
  3) echo "Resultado: $((num1 * num2))" ;;
  4) 
     if [ "$num2" -eq 0 ]; 
     then echo "No se puede dividir por 0"; exit 1; 
     fi
     echo "Resultado: $((num1 / num2))" ;;
  *) echo "Opción inválida" ;;
esac