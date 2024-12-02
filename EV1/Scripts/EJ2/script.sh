#!/bin/bash

# Verificar si se proporcionaron el dominio y la IP como argumentos
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Debe proporcionar un dominio y una IP como argumentos."
  exit 1
fi

dominio="$1"
ip="$2"
archivo_hosts="/etc/hosts"

# Verificar si el dominio ya existe en el archivo hosts
if grep -q "$dominio" "$archivo_hosts"; then
  echo "Error: El dominio $dominio ya existe en el archivo hosts."
  exit 1
fi

# Añadir el dominio y la IP al archivo hosts
echo "$ip $dominio" >> "$archivo_hosts"

echo "Dominio $dominio añadido correctamente con la IP $ip."
