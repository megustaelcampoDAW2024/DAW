# Ejercicio 7: Instalar y Configurar AWStats
## 1. Instalar AWStats
### 1.1 Instala AWStats mediante el gestor de paquetes
```bash
sudo apt update
sudo apt install awstats -y
```
![Screenshot 2024-12-04 215014](https://github.com/user-attachments/assets/602c5c2e-473c-4e45-9683-69af6c966bd6)

## 2 Configurar AWStats para Apache
### 2.1 Copia el archivo de configuración predeterminado para tu dominio
```bash
sudo cp /etc/awstats/awstats.conf /etc/awstats/awstats.centro.intranet.conf
```
![Screenshot 2024-12-04 215107](https://github.com/user-attachments/assets/6f9752b5-78e4-4a41-99eb-4d9ab7c9e38b)

### 2.2 Edita el archivo de configuración
```bash
sudo nano /etc/awstats/awstats.centro.intranet.conf
```

### 2.3 Asegúrate de que las siguientes líneas reflejen tu dominio
```txt
LogFile="/var/log/apache2/access.log"
SiteDomain="centro.intranet"
HostAliases="www.centro.intranet localhost 127.0.0.1"
```
  -  LogFile: Apunta al archivo de logs de acceso de Apache.
  -  SiteDomain: Especifica el dominio principal.
![Screenshot 2024-12-04 215358](https://github.com/user-attachments/assets/09027e99-d9af-4223-b29c-4fa0cc0869d0)
![Screenshot 2024-12-04 215541](https://github.com/user-attachments/assets/2df3394b-a080-4b50-a940-a72453ba7e19)

## 3. Generar el Primer Reporte
### 3.1 Genera manualmente un reporte para probar la configuración
```bash
sudo /usr/lib/cgi-bin/awstats.pl -config=centro.intranet -update
```
![Screenshot 2024-12-04 215627](https://github.com/user-attachments/assets/2acfb582-d8d0-4cb4-be0f-c19cc4a6a838)

## 4. Configurar Apache para Servir AWStats
### 4.1 Habilita el módulo cgi en Apache:
```bash
sudo a2enmod cgi
sudo systemctl restart apache2
```
![Screenshot 2024-12-04 215809](https://github.com/user-attachments/assets/1dd19ba6-df21-4c68-a5f7-2afa752121e8)

### 4.2 Crea una configuración en Apache para servir AWStats
```bash
sudo nano /etc/apache2/sites-available/awstats.conf
```
Contenido del archivo:
```apache
Alias /awstats-icon "/usr/share/awstats/icon/"
Alias /awstatsclasses "/usr/share/awstats/lib/"
ScriptAlias /awstats/ "/usr/lib/cgi-bin/"

<Directory "/usr/lib/cgi-bin/">
    Options ExecCGI
    Require all granted
</Directory>
```
![Screenshot 2024-12-04 215848](https://github.com/user-attachments/assets/a77f35d6-06ea-4b93-a7d2-65a6577fbda4)

### 4.3 Habilita la configuración y reinicia Apache:
```bash
sudo a2ensite awstats
sudo systemctl reload apache2
```
![Screenshot 2024-12-04 215942](https://github.com/user-attachments/assets/f38d5075-dd51-44c0-8897-0ce87f6830de)

## 5. Acceder a AWStats
  -  Abre tu navegador y visita http://centro.intranet/awstats/awstats.pl?config=centro.intranet.
  -  Deberías ver la interfaz de AWStats con las estadísticas de tu servidor.
![Screenshot 2024-12-04 220023](https://github.com/user-attachments/assets/0df2c4bc-c8e6-4666-a6de-8648a158d980)
