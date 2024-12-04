# Ejercicio 1
## 1. Instalación de Apache
### Actualizar los paquetes:
```bash
sudo apt update && sudo apt upgrade -y
```
![Link Foto](https://github.com/user-attachments/assets/a17a17ea-796f-4ad9-bd7c-a7852e4d910b)

### Instalar Apache:
```bash
sudo apt install apache2 -y
```
![Screenshot 2024-12-04 170956](https://github.com/user-attachments/assets/42fe139c-feed-4213-891a-c4811621cd37)

### Habilitar y verificar Apache:
```bash
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2
```
![Screenshot 2024-12-04 171802](https://github.com/user-attachments/assets/653784e9-115b-49f5-885f-1e57ba999faf)

## 2. Configurar los Dominios Internos
### 2.1 Edita el archivo hosts para agregar los dominios locales
```bash
sudo nano /etc/hosts
```
![Screenshot 2024-12-04 172152](https://github.com/user-attachments/assets/070c5062-2781-4fac-b054-e09ffb1d4010)

Agrega las siguientes líneas:
```bash
127.0.0.1    centro.intranet
127.0.0.1    departamentos.centro.intranet
```
![Screenshot 2024-12-04 172025](https://github.com/user-attachments/assets/c9de740f-d00d-4836-aa86-960e126ca60e)

### 2.2 Configura los archivos de VirtualHost para Apache
Para centro.intranet: Crea un archivo de configuración en /etc/apache2/sites-available/centro.intranet.conf
```bash
sudo nano /etc/apache2/sites-available/centro.intranet.conf
```
Contenido del archivo:
```less
<VirtualHost *:80>
    ServerName centro.intranet
    DocumentRoot /var/www/centro.intranet

    <Directory /var/www/centro.intranet>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```
![Screenshot 2024-12-04 174159](https://github.com/user-attachments/assets/b3070971-8383-471b-8ba3-2148f4250ea0)

Para departamentos.centro.intranet: Crea un archivo de configuración en /etc/apache2/sites-available/departamentos.centro.intranet.conf
```bash
sudo nano /etc/apache2/sites-available/departamentos.centro.intranet.conf
```
Contenido del archivo:
```less
<VirtualHost *:80>
    ServerName departamentos.centro.intranet
    DocumentRoot /var/www/departamentos.centro.intranet

    <Directory /var/www/departamentos.centro.intranet>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```
![Screenshot 2024-12-04 174316](https://github.com/user-attachments/assets/8ff2b459-47a6-49bf-95fd-6871bdbf6caa)

### 2.3 Crea los directorios necesarios
```bash
sudo mkdir -p /var/www/centro.intranet /var/www/departamentos.centro.intranet
sudo chown -R www-data:www-data /var/www/
sudo chmod -R 755 /var/www/
```
![Screenshot 2024-12-04 174427](https://github.com/user-attachments/assets/c2c8af6f-3c4e-407d-831c-4c9d12b5cdf5)

### 2.4 Activa los sitios y reinicia Apache
```bash
sudo a2ensite centro.intranet.conf
sudo a2ensite departamentos.centro.intranet.conf
sudo systemctl reload apache2
```
![Screenshot 2024-12-04 174639](https://github.com/user-attachments/assets/a5a2da31-0f96-4115-878a-e29b942f7581)
