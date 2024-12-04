# Ejercicio 7: Instalar y Configurar AWStats
## 1. Instalar AWStats
### 1.1 Instala AWStats mediante el gestor de paquetes
```bash
sudo apt update
sudo apt install awstats -y
```

## 2 Configurar AWStats para Apache
### 2.1 Copia el archivo de configuración predeterminado para tu dominio
```bash
sudo cp /etc/awstats/awstats.conf /etc/awstats/awstats.centro.intranet.conf
```

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

## 3. Generar el Primer Reporte
### 3.1 Genera manualmente un reporte para probar la configuración
```bash
sudo /usr/lib/cgi-bin/awstats.pl -config=centro.intranet -update
```

## 4. Configurar Apache para Servir AWStats
### 4.1 Habilita el módulo cgi en Apache:
```bash
sudo a2enmod cgi
sudo systemctl restart apache2
```

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

### 4.3 Habilita la configuración y reinicia Apache:
```bash
sudo a2ensite awstats
sudo systemctl reload apache2
```

## 5. Acceder a AWStats
  -  Abre tu navegador y visita http://centro.intranet/awstats/awstats.pl?config=centro.intranet.
  -  Deberías ver la interfaz de AWStats con las estadísticas de tu servidor.
