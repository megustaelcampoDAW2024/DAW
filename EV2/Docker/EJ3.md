# Ejercicio 3

Descargamos las imagenes con:
```shell
docker pull ubuntu
docker pull hello-world
docker pull nginx
```
![image](https://github.com/user-attachments/assets/e28a73c4-0f0b-470d-b78c-0612fa78d1a7)

Mostramos las imagenes con:
```shell
docker images
```
![image](https://github.com/user-attachments/assets/26975169-7960-4099-99dd-81fede9a598d)

Ejecutamos loos contenedores "hello-world" y les asignamos los nombres: `myhello1`, `myhello2`, `myhello3` con:
```shell
docker run --name myhello1 hello-world
docker run --name myhello2 hello-world
docker run --name myhello3 hello-world
```
![image](https://github.com/user-attachments/assets/9f62154b-1ae4-4a12-bfc3-81d91e859ede)

Mostramos los contenedores con:
```shell
docker ps -a
```
![image](https://github.com/user-attachments/assets/7100ed7e-9447-412a-aa24-a0fe6f98cf91)

Paramos los contenedores `myhello1` y `myhello2`, pero no es necesario, ya que ya se han parado, lo podemos comprobar con:
```shell
docker ps
```
![image](https://github.com/user-attachments/assets/d895c3f6-ee41-4ee6-a766-9747b783f4b5)
Aunque si fuese preciso podriamos pararlos con:
```shell
docker stop <nombre_contenedor>
```

Borramos el contenedor `myhello1` con y comprobamos con:
```shell
docker rm myhello1
docker ps -a
```
![image](https://github.com/user-attachments/assets/1b8bbd0a-852a-43a7-8917-bdd48962cf45)

Eliminamos los contenedores con:
```shell
sudo docker rm $(sudo docker ps -aq)
```
![image](https://github.com/user-attachments/assets/4bc20571-d234-4143-8055-0891f5b3c300)
