# Creación de Instancias (EC2) e Instalación de PHP y Apache

### 2. Crear una instancia EC2

- **Paso 1**: Accedemos al panel de creacion de instancias
  - Completamos el nombre como: `serverWordPress`
  - Marcamos `Ubuntu` como SO
  - Y seleccionamos las especificaciiones que requiramos

![image](https://github.com/user-attachments/assets/3f490683-8c26-40ac-8132-6e485e7e10f1)

- **Paso 2:** Configuracion de Red
  - Seleccionamos la `VPC` previamente creada
  - COmo subred seleccionamos `pject-wordpress-subnet-publicl-us-east-1a`
  - **IMPORTANTE**: Habilitamos la selección automática de IP Pública
  - Asignamos el grupo de seguridad `seguridadWordPress`
  - Como reglas de entrada al grupo de seguridad, abrimos por ssh y http en el `puerto 80` por cualquier IP
 
![image](https://github.com/user-attachments/assets/258820f4-6b57-4504-932b-fc9b1ca37363)

- **Paso 3:** Lanzamos la instancia. Si se inició correctamente, podemos pasar a ver la lista de todas las instancias y comprobar que nos podemos conectar a ella.

![image](https://github.com/user-attachments/assets/30c3cfbc-6640-421d-bae7-2591f0152702)

![image](https://github.com/user-attachments/assets/1d9e7b62-8f2d-4d71-91b1-036a25db5e58)

Comprobamos que podemos acceder (en mi caso accedo por IP)

![image](https://github.com/user-attachments/assets/5678ea1b-1314-4653-8fa0-d7ef75b457b6)

### 3. Instalación de PHP y Apache

- **Paso 1:** Instalamos apache con `sudo apt install apache2`

![image](https://github.com/user-attachments/assets/30ebff6c-9065-48ec-8c1c-16b2f7c34fe0)

- **Paso 2:** Lo iniciamos con `sudo systemctl start apache2` y `sudo systemctl enable apache2`

![image](https://github.com/user-attachments/assets/5847b441-c4fc-4267-bb49-c8a46e05d58b)

- **Paso 3:** Comprobamos el estado de apache con `sudo systemctl status apache2` o prodíamos comprobarlo accediendo a traves del navegador accediendo por la IP

![image](https://github.com/user-attachments/assets/b6c00af7-625f-40be-b17a-31710f8b6483)

- **Paso 4:** Actualizamos con `sudo apt -y update` e instalamos php8.3 con `sudo apt install php8.3 libapache2-mod-php8.3 php8.3-c1i`

![image](https://github.com/user-attachments/assets/621dd701-92b9-4fbc-b9bc-9440792cf407)

![image](https://github.com/user-attachments/assets/b564ee3e-192d-4d0c-ba04-ea6d6f49f615)

- **Paso 5:** Reiniciamos apache con `sudo systemctl restart apache2`

![image](https://github.com/user-attachments/assets/e59e42d3-f8e8-49be-81ec-68330b3b12db)
