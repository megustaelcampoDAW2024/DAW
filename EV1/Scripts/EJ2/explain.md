# Script 2 - Explain
## Similar al script anterior, pero verifica dos parámetros

```Ubuntu
grep -q "$dominio" "$archivo_hosts"
```
### Busca el dominio en el archivo hosts

```Ubuntu
echo "$ip $dominio" >> "$archivo_hosts"
```
### Añade el dominio y la IP al final del archivo
