#!/bin/bash

# Verificar si se proporcionaron el título, la cabecera y el mensaje como parámetros
if [ $# -ne 3 ]; then
  echo "Error: Sintaxis incorrecta."
  echo "Uso: $0 <titulo> <cabecera> <mensaje>"
  exit 1
fi

titulo=$1
cabecera=$2
mensaje=$3

# Crear el contenido de la página web
cat << EOF > index.html
<!DOCTYPE html>
<html>
<head>
  <title>$titulo</title>
</head>
<body>
  <h1>$cabecera</h1>
  <p>$mensaje</p>
</body>
</html>
EOF

echo "Página web creada correctamente: index.html"
