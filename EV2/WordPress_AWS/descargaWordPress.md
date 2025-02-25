# Descarga Final WordPress y puesta en marcha

## 8. Descarga WordPress

- **Paso 1:** Preparar el entorno para descargar WordPress
  - En la EC2 accedemos al directorio var/www/html
  - Descargamos los archivos de WordPress con `get http://wordpress.org/latest.tar.gz`
  - Extraemos los archivos con `sudo tar -xf latest.tar.z`

![image](https://github.com/user-attachments/assets/34db23e1-b49d-4380-ab80-568816d51d9a)
![image](https://github.com/user-attachments/assets/eab6d9a5-839d-4a0e-84c0-5908ec52b064)

- **Paso 2:** Instalamos las dependencias de MySQL en la EC2 con `sudo apt install default—mysql—client`

![image](https://github.com/user-attachments/assets/0b1a2421-e3ef-423c-8cae-e8b81167629c)

- **Paso 3:** Enlazamos la MySQL con la RDS previamente creada con el comando `mysql —u admin —h [Punto de enlace de RDS que copiamos anteriormente] —p`

![image](https://github.com/user-attachments/assets/ff72a47d-958f-4135-9e3a-2ca685a26cf2)

- **Paso 4:** Creamos el entorno de la BDD con el que trabajará WordPress con los siguinetes comandos:
  - CREATE DATABASE wordpress;
  - CREATE USER 'wordpress user'@'%' IDENTIFIED BY 'password123';
  - GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_user'@'%';
  - FLUSH PRIVILEGES;

![image](https://github.com/user-attachments/assets/8a2658d0-a4b5-43e0-81f3-6627f09efd55)

## 9. Puesta en marcha de WordPress

- **Paso 1:** Accedemos a WordPress a traves de la Ip Pública automática que nos proporciona nuestra EC2. Clicamos en `Let's go!`

![image](https://github.com/user-attachments/assets/4fed69e6-1329-4878-912a-1cac36403557)

- **Paso 2:** Introducimos los datos que declaramos con los comandos anteriores en el `Paso 4`
(En Database Host instroduciremos el punto de enlace de la RDS)

![image](https://github.com/user-attachments/assets/89542109-8141-4e6b-914f-167bc9f018b0)

- **Paso 3:** Creamos el fichero `wp-config.php` necesario para la instalación de WordPress
  - En nuestra EC2, dentro de var/www/html/wordpress creamos el archivo con el comando `sudo nano wp-config.php`
  - En su interior pegamos el contenido que proporciona WordPress y guardamos
  - Finalmente podemos clicar en el botón `Run the installation`

![image](https://github.com/user-attachments/assets/b4fa8e78-4939-4133-b7fa-817084c4b067)

![image](https://github.com/user-attachments/assets/4b0577e1-87bd-49e1-9d07-d3eff73d0ead)

- **Paso 4:** Crear nuestro Sitio Web
  - Le asignamos un nombre, en mi caso `wp-installation-DAW`
  - Creamos un uusario seguro
  - Clicamos en `Install WordPress`

![image](https://github.com/user-attachments/assets/4784cac0-2432-4590-a90a-7ba1af7c047d)

!Ya podemos acceder a WordPress¡

![image](https://github.com/user-attachments/assets/b25d7fe8-eca3-4ffa-94af-0d39934b60ee)
