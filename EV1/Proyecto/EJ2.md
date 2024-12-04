# Ejercicio 2: Activar Módulos para PHP y MySQL en Apache
## 1. Instalar PHP y sus módulos necesarios
### 1.1 Instala PHP junto con los módulos para Apache y MySQL
```bash
sudo apt install php libapache2-mod-php php-mysql -y
```
![Screenshot 2024-12-04 180340](https://github.com/user-attachments/assets/b379b98e-a296-4573-b5a9-3880963c4658)

### 1.2 Verifica que PHP está correctamente instalado
```bash
php -v
```
![Screenshot 2024-12-04 180453](https://github.com/user-attachments/assets/547d1f61-4c18-481c-bd6f-aab3374fb25d)

## 2. Instalar y Configurar MySQL
### 2.1 Instala el servidor MySQL:
```bash
sudo apt install mysql-server -y
```
![Screenshot 2024-12-04 180550](https://github.com/user-attachments/assets/f5289b43-30ef-4352-a798-d119a52a4bc6)

### 2.2 Asegura la instalación de MySQL (opcional pero recomendado)
```bash
sudo mysql_secure_installation
```
## 3. Configurar Apache para PHP
### 3.1 Asegúrate de que el módulo PHP esté activado
```bash
sudo a2enmod php8.3
```
![Screenshot 2024-12-04 181337](https://github.com/user-attachments/assets/cd9b2865-93b5-410e-8ac1-43d9adfcc647)

### 3.2 Reinicia Apache para aplicar los cambios
```bash
sudo systemctl restart apache2
```
![Screenshot 2024-12-04 181454](https://github.com/user-attachments/assets/926205b3-67a7-4829-ae44-5ff9bdf560f5)
