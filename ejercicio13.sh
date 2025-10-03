#!/bin/bash

archivo="lista.txt"
touch "$archivo"

while true; do
 echo "AGENDA"
  echo "1) Añadir"
  echo "2) Buscar"
  echo "3) Listar"
  echo "4) Ordenar"
  echo "5) Borrar archivo"
  echo "0) Salir"
  read -rp "Opción: " menu
  case "$menu" in
    1)
      read -rp "Nombre: " nom
      read -rp "Dirección: " dir
      read -rp "Teléfono: " telf
      echo "$nom;$dir;$telf" >> "$archivo"
      echo "Añadido."
      ;;
    2)
      read -rp "Cadena a buscar (nombre/dirección/teléfono): " busca
      grep -i -- "$busca" "$archivo" || echo "Sin coincidencias."
      ;;
    3)
      nl -ba "$archivo"
      ;;
    4)
      sort -f -t';' -k1,1 "$archivo" -o "$archivo"
      echo "Ordenado por nombre."
      ;;
    5)
      read -rp "¿Seguro? (sí/no): " borra
      if [[ "$borra" == "sí" || "$borra" == "si" || "$borra" == "s" || "$borra" == "S" ]]; then
        rm -f "$archivo"
        echo "Archivo borrado."
        echo "Para crear un nuevo archivo, reinica el programa"
      else
        echo "Cancelado."
      fi
      ;;
    0) exit 0 ;;
    *) echo "Opción inválida" ;;
  esac
done