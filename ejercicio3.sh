#!/bin/bash

lista="etc.txt"
ls > "$lista"
cat $lista
echo "Líneas:  $(wc -l < "$lista")"
echo "Palabras: $(wc -w < "$lista")"