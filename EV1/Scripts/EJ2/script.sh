#!/bin/bash

# Verificar si se proporcionaron el dominio y la IP como parámetros
if [ $# -ne 2 ]; then
  echo "Error: Sintaxis incorrecta."
  echo "Uso: $0 <dominio> <ip>"
  exit 1
fi

dominio=$1
ip=$2
archivo_hosts="/etc/hosts"

# Verificar si el dominio ya existe en el archivo hosts
if grep -q "$dominio" "$archivo_hosts"; then
  echo "Error: El dominio $dominio ya existe en el archivo hosts."
  exit 1
fi

# Añadir el dominio y la IP al archivo hosts
echo "$ip $dominio" >> "$archivo_hosts"

echo "Dominio $dominio añadido correctamente al archivo hosts."
