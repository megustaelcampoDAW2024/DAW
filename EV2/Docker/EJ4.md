# Ejercicio 4

## Ejemplo 1: Montaje de volumen (bind mount)

Creamos un directorio local con:
```shell
mkdir mi_volumen_local
echo "Hola desde el anfitrión" > mi_volumen_local/archivo.txt
```
Esto crea un directorio llamado `mi_volumen_local` y un archivo `archivo.txt` dentro de él.
![image](https://github.com/user-attachments/assets/bceff458-9408-4938-9756-f5c994287579)

Ejecutamos el  coontenedor del volumen montado con:
```shell
docker run -d -v $(pwd)/mi_volumen_local:/app/datos --name mi_contenedor_volumen ubuntu bash -c "while true; do cat /app/datos/archivo.txt; sleep 1; done"
```
`-v $(pwd)/mi_volumen_local:/app/datos` monta el directorio local `mi_volumen_local` en el directorio `/app/datos` dentro del contenedor.

![image](https://github.com/user-attachments/assets/be9e924b-7f95-4114-9874-ec6354d08f68)

Verificamos el montaje con:
```shell
docker exec mi_contenedor_volumen cat /app/datos/archivo.txt
```
![image](https://github.com/user-attachments/assets/7e412183-73ab-4cbd-a1b2-5c2d05937214)

Modificamos el archivo dentro del contenedor, y comprobamos que se modifica fuera del contenedor con:
```shell
docker exec mi_contenedor_volumen bash -c "echo 'Hola desde el contenedor' > /app/datos/archivo.txt"
cat mi_volumen_local/archivo.txt
```
![image](https://github.com/user-attachments/assets/2920860c-7a78-435a-ba6f-661dbd075081)

<hr>

## Ejemplo 2: Redes bridge

Creamos una red bridge con:
```shell
docker network create mi_red_bridge
```
![image](https://github.com/user-attachments/assets/3c6b69fa-c09e-40b6-9186-f1e8cd67b5f5)
![image](https://github.com/user-attachments/assets/24c9617f-1107-42a6-bc6c-1ec7035b0f56)

Ejecutamos contenedores y los conectamos a la red con:
```shell
docker run -d --name contenedor1 --network mi_red_bridge alpine ping -c 4 contenedor2
docker run -d --name contenedor2 --network mi_red_bridge alpine sleep infinity
```
![image](https://github.com/user-attachments/assets/ab043219-7416-4ac9-a76e-e3b0ab01815b)

Verificamos la comunicación entre los contenedores con:
```shell
docker network inspect mi_red_bridge
docker logs contenedor1
```
![image](https://github.com/user-attachments/assets/8f4d7af9-7f65-4e7c-83e5-bb09daf893ea)
Buscamos la sección Containers y verificamos la IPv4Address de contenedor2. Debe coincidir con la IP que vemos en los logs de contenedor1

<hr>

## Ejemplo 3: Cómo crear y utilizar volúmenes con nombre para la persistencia de datos

Creamos un volumen con nombre con:
```shell
docker volume create mi_volumen_datos
```
![image](https://github.com/user-attachments/assets/099a3dac-e7d0-4ffc-97c9-7d9bc3851ec4)
![image](https://github.com/user-attachments/assets/bba31bba-12cb-45b7-907a-f4ec17a07536)

Ejecutamos un contenedor usando el volumen con:
```shell
docker run -d -v mi_volumen_datos:/datos --name contenedor_datos alpine sh -c "echo 'Datos persistentes' > /datos/archivo.txt; sleep infinity"
```
![image](https://github.com/user-attachments/assets/584efb52-9015-4c8d-90df-ff8e1e9fb99e)

Verificamos que el archivo se ha creado con:
```shell
docker exec contenedor_datos cat /datos/archivo.txt
```
![image](https://github.com/user-attachments/assets/51b67a63-086d-4949-830b-1bcf711bbe09)

Creamos otro contenedor que use el mismo volumen con:
```shell
docker run --rm -v mi_volumen_datos:/datos alpine cat /datos/archivo.txt
```
![image](https://github.com/user-attachments/assets/e9d2437a-4a56-483c-99ff-6cc3af9260ed)
Con esto podemos comprobar la persistencia de los datos
