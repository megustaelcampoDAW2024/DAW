# Ejercicio 2: Activar Módulos para PHP y MySQL en Apache
## 1. Instalar PHP y sus módulos necesarios
### 1.1 Instala PHP junto con los módulos para Apache y MySQL
```bash
sudo apt install php libapache2-mod-php php-mysql -y
```

### 1.2 Verifica que PHP está correctamente instalado
```bash
php -v
```
## 2. Instalar y Configurar MySQL
### 2.1 Instala el servidor MySQL:
```bash
sudo apt install mysql-server -y
```

### 2.2 Asegura la instalación de MySQL (opcional pero recomendado)
```bash
sudo mysql_secure_installation
```
## 3. Configurar Apache para PHP
### 3.1 Asegúrate de que el módulo PHP esté activado
```bash
sudo a2enmod php
```

### 3.2 Reinicia Apache para aplicar los cambios
```bash
sudo systemctl restart apache2
```
