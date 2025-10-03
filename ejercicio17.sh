#!/bin/bash

total=0
while true; do
  read -rp "Introduce número (0 para terminar): " n
  if [[ "$n" == 0 ]]; then
    echo "Suma final: $total"
    exit 0
  fi
  total=$((total + n))
  echo "Acumulado: $total"
done