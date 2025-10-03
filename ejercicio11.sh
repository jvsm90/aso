#!/bin/bash

if [[ $# -ne 2 ]]; then
echo "Error: debes indicar 2 parámetros."
exit 1
fi
origen="$1"
destino="$2"
if [[ ! -f "$origen" ]]; then
echo "Error: el primer parámetro deber ser un fichero válido"
exit 1
fi
if [[ -e "$destino" ]]; then
echo "Error: ya existe un fichero llamado $destino"
exit 1
fi
cp "$origen" "$destino"
