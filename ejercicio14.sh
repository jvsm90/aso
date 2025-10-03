#!/bin/bash

set -e

if [[ $EUID -ne 0 ]]; then
  echo "Ejecuta como root (usa sudo)."
  exit 1
fi

if [[ $# -lt 4 ]]; then
  echo "Error. Sintaxis: $0 alta/baja nombre apellido1 apellido2 [grupo]"
  exit 1
fi

accion="$1"; nombre="$2"; ap1="$3"; ap2="$4"; grupo_cli="$5"

# Construir identificador aluXXYYZ
toid() {
  local n="$1" a1="$2" a2="$3"
  id="alu$(echo "$a1" | cut -c1-2 | tr '[:upper:]' '[:lower:]')$(echo "$a2" | cut -c1-2 | tr '[:upper:]' '[:lower:]')$(echo "$n" | cut -c1 | tr '[:upper:]' '[:lower:]')"
  echo "$id"
}

uid=$(toid "$nombre" "$ap1" "$ap2")

case "$accion" in
  alta)
    grupo="${grupo_cli:-$uid}"
    if ! getent group "$grupo" >/dev/null; then
      groupadd "$grupo"
    fi
    if id "$uid" &>/dev/null; then
      echo "El usuario $uid ya existe."
    else
      useradd -m -g "$grupo" -c "$nombre $ap1 $ap2" "$uid"
      echo "Usuario creado: $uid (grupo: $grupo). Establece la contraseña con: passwd $uid"
    fi
    ;;
  baja)
    if id "$uid" &>/dev/null; then
      userdel -r "$uid"
      echo "Usuario eliminado: $uid"
    else
      echo "El usuario $uid no existe."
    fi
    ;;
  *)
    echo "Error. La sintaxis correcta es $0 alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
    ;;
esac