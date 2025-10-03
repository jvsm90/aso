#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Uso: $0 n"
  exit 1
fi
n="$1"
for i in {1..10}; do
  echo "$i x $n = $((i * n))"
done