#!/bin/bash

# Verificar si se proporcionó un puerto como argumento
if [ -z "$1" ]; then
  echo "Error: Debe proporcionar un puerto como argumento."
  exit 1
fi

puerto="$1"
archivo_conf="/etc/apache2/ports.conf"

# Verificar si el puerto ya existe en el archivo de configuración
if grep -q "Listen $puerto" "$archivo_conf"; then
  echo "Error: El puerto $puerto ya está en uso."
  exit 1
fi

# Añadir el puerto al archivo de configuración
echo "Listen $puerto" >> "$archivo_conf"

# Reiniciar Apache
systemctl restart apache2

echo "Puerto $puerto añadido correctamente."
