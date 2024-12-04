# Ejercicio 3: Instalación y Configuración de WordPress
## 1. Descargar WordPress
### 1.1 Descarga la última versión de WordPress
```bash
wget https://wordpress.org/latest.tar.gz
```

### 1.2 Extrae los archivos
```bash
tar -xzvf latest.tar.gz
```

### 1.3 Mueve los archivos de WordPress al directorio de centro.intranet
```bash
sudo mv wordpress/* /var/www/centro.intranet/
```

### 1.4 Cambia los permisos para que Apache tenga acceso
```bash
sudo chown -R www-data:www-data /var/www/centro.intranet
sudo chmod -R 755 /var/www/centro.intranet
```

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

## 3 Configurar WordPress
### 3.1 Renombra el archivo de configuración de WordPress
```bash
sudo mv /var/www/centro.intranet/wp-config-sample.php /var/www/centro.intranet/wp-config.php
```

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

## 4. Completar la Instalación de WordPress
### Sigue las instrucciones para:
#### Seleccionar el idioma.
#### Configurar el título del sitio, el usuario administrador, y la contraseña.
#### Completar la instalación.
