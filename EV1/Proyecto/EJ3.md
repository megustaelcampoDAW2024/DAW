# Ejercicio 3: Instalación y Configuración de WordPress
## 1. Descargar WordPress
### 1.1 Descarga la última versión de WordPress
```bash
wget https://wordpress.org/latest.tar.gz
```
![Screenshot 2024-12-04 201437](https://github.com/user-attachments/assets/e23fedf4-b09b-46e2-aaca-c3177938f96a)

### 1.2 Extrae los archivos
```bash
tar -xzvf latest.tar.gz
```
![Screenshot 2024-12-04 201556](https://github.com/user-attachments/assets/2319d339-ba6d-4ac5-973a-7585e6ed14b1)

### 1.3 Mueve los archivos de WordPress al directorio de centro.intranet
```bash
sudo mv wordpress/* /var/www/centro.intranet/
```
![Screenshot 2024-12-04 201629](https://github.com/user-attachments/assets/1f26da2d-2f6a-4510-92b9-6983396e57af)

### 1.4 Cambia los permisos para que Apache tenga acceso
```bash
sudo chown -R www-data:www-data /var/www/centro.intranet
sudo chmod -R 755 /var/www/centro.intranet
```
![Screenshot 2024-12-04 201807](https://github.com/user-attachments/assets/1b811bff-88c6-4c5b-9e1a-d533307ed14d)

## 2. Crear una Base de Datos para WordPress
### 2.1 Accede a MySQL
```bash
sudo mysql -u root -p
```
### 2.2 Ejecuta los siguientes comandos para crear la base de datos y el usuario
```sql
CREATE DATABASE wordpress;
CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```
![Screenshot 2024-12-04 202022](https://github.com/user-attachments/assets/59e9a17a-bcca-46fa-9e7f-bd70f86a963a)

## 3 Configurar WordPress
### 3.1 Renombra el archivo de configuración de WordPress
```bash
sudo mv /var/www/centro.intranet/wp-config-sample.php /var/www/centro.intranet/wp-config.php
```
![Screenshot 2024-12-04 202121](https://github.com/user-attachments/assets/200f3792-5c85-4527-afef-75eb15fb43da)

### 3.2 Edita el archivo de configuración
```bash
sudo nano /var/www/centro.intranet/wp-config.php
```
Encuentra las siguientes líneas y actualízalas con los datos de tu base de datos
```php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wordpressuser' );
define( 'DB_PASSWORD', 'password' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
```
![Screenshot 2024-12-04 202450](https://github.com/user-attachments/assets/34cda6b4-5dc7-4657-a248-2e76c9cf07f8)

## 4. Completar la Instalación de WordPress
### 4.1 Abre tu navegador y accede a http://centro.intranet
### 4.2 Sigue las instrucciones para:
#### - Seleccionar el idioma.
#### - Configurar el título del sitio, el usuario administrador, y la contraseña.
#### - Completar la instalación.
