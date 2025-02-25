# Creación de EFS y asociarla

## 6. Creacion de el EFS

- **Paso 1:** Clicamos en `Crear un sistema de archivos`
  - Le asignamos un nombre: `almacenWordPress`
  - Le asignamos la VPC en la que entrará el EFS
  - Clicamos en `Crear`

![image](https://github.com/user-attachments/assets/00133641-157c-46c3-8266-fbd7d742c81a)

![image](https://github.com/user-attachments/assets/9ca8723b-1fdd-4ea3-9533-36909ad61a49)

- **Paso 2:** Una vez creada, en el apartado Red, copiamos el nombre del grupo de seguridad asignado

![image](https://github.com/user-attachments/assets/51a2433a-ffc5-4fc2-910c-325060070305)

- **Paso 3:** Permitir el acceso por NFS
  - En el laboratorio, accedemos a `VPC` > `Grupos de Seguridad` > (clicamos en el grupo de nuestro EFS) > `Editar reglas de entrada`
  - Editamos las reglas de entrada y permitimos la entrada a la EFS via `NFS` y guardamos

![image](https://github.com/user-attachments/assets/977b651a-3ba3-44b3-aa5a-fcc6ae4a86ad)

## 7. Asociamos el EFS

- **Paso 1:** Accedemos a `EFS` > (Clicamos en nuestra EFS) > `Asociar`
  - Copiamos el segundo comando (Mediante el cliente de NFS)

![image](https://github.com/user-attachments/assets/0a273beb-d14f-4af9-b391-3c0b71240338)

- **Paso 2:** Preparamos el entorno para asociar
  - En el directorio Raíz de nuestra EC2 creamos un directorio llamado `efs` con el comando `sudo mkdir efs` y `ls` para comprobar qeu se ha creado
  - Instalamos el paquete nfs-common con el comando `sudo apt-get install nfs—common`

![image](https://github.com/user-attachments/assets/51bde945-caad-4d58-a1be-5fba92bdc8dc)

- **Paso 3:** Pegamos y ejecutamos el comando que copiamos previamente en el `Paso 1`

![image](https://github.com/user-attachments/assets/754c264a-2508-485a-b14f-bfa864c89064)

Si todo se ha ejecutado correctamente, podremos proseguir con la instalación de WordPress
