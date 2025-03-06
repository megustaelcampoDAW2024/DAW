# Ejecicio 2

## Lleva a cabo la práctica descrita en el primer artículo

Ejecutamos la imagen hello-world
```shell
$ sudo docker run hello-world
```
![image](https://github.com/user-attachments/assets/9309eb2b-182d-4e7b-8dce-5f1e48660f6b)

Mostramos las imagenes instaladas
```shell
sudo docker images
```
![image](https://github.com/user-attachments/assets/f4aac647-9aa3-4226-ace3-def14951f2e6)

Mostramos los contenedores
```shell
sudo docker ps -a
```
![image](https://github.com/user-attachments/assets/30cd7c45-c0fb-4496-90c0-4a6be9f13d3a)


## Lleva a cabo la práctica descrita en el segundo artículo

Editamos el fichero DockerFile, pero antes clonamos el repositorio de GitHub con el que trabajaremos con el comando
```shell
sudo git clone https://github.com/docker/getting-started-app.git
```
![image](https://github.com/user-attachments/assets/9549b81c-f227-4daa-b8f5-ab859a671c97)

Abrimos el repositorio:
```shell
cd getting-started-app
sudo nano Dockerfile
```
![image](https://github.com/user-attachments/assets/73d8ed79-737c-4e22-a1bc-7409c5029286)

Modificamos el archivo añadiendo lo siguiente
```shell
FROM node:lts-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000
```
![image](https://github.com/user-attachments/assets/897ceb32-37bc-4644-8725-42341bf7f59e)

Construyo el contenedor con:
```shell
$ sudo docker build -t getting-started .
```
![image](https://github.com/user-attachments/assets/129c57ba-359e-4e60-90f8-2b7f427708da)

Lo ejecutamos con:
```shell
sudo docker run -d -p 127.0.0.1:3000:3000 getting-started
```
![image](https://github.com/user-attachments/assets/fda6515d-0a28-47b7-b15d-15f61bc8a25b)

Crear una cuenta de Docker. Yo ya cree una cuenta para otr asignatura, por lo que solo tengo que entrar
![image](https://github.com/user-attachments/assets/3b837c05-1e48-4418-9cb6-88f14c64774e)

Comenzamos el proceso de logIn con el comando
```shell
$ sudo docker login
```
![image](https://github.com/user-attachments/assets/2699920d-6f17-46f3-b758-fd99c2567c59)

Ahora copiamos la clave y accedemos a el link mediante el cual nos podremos logear introduciendo el Codigo copiado
![image](https://github.com/user-attachments/assets/70bb135e-0988-4340-8200-c9f6158eaf58)
![image](https://github.com/user-attachments/assets/f5886d40-3860-4c87-92f1-1b00a2d1704f)

Una vez hayamos iniciado sesion en la web, la consola se actualizará y nos mostrará que nos hemos loegado
![image](https://github.com/user-attachments/assets/b83ba7c0-a3e2-43c9-9688-0bf1178a9bd8)

Ahora publicamos el contenedor con el comando:
```shell
sudo docker tag getting-started megustaelcampo/getting-started:v1
sudo docker push megustaelcampo/getting-started:v1
```
![image](https://github.com/user-attachments/assets/69a72036-a5ef-4b1f-86d6-1c5bde02803e)
![image](https://github.com/user-attachments/assets/14e12ceb-a863-4547-9d0e-eb01d31a5802)

Con esto ya habremos subido nuestro contenedor a nuestra cuenta de Docker
