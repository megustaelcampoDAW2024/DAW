# Creación de RDS para la BDD y Conexión a EC2

## 4. Creación de RDS

- **Paso 1:** Accedemos al panel de creación de RDS
  - Seleccionamos MySQL como BDD
  - Como Plantilla selecionamos la `Capa Gratuita`

![image](https://github.com/user-attachments/assets/1805e414-70b4-4827-ac45-6aad5a963dc0)

![image](https://github.com/user-attachments/assets/caa0edd0-9ee2-42f5-bc51-c157727d7fcd)

![image](https://github.com/user-attachments/assets/d39c59ab-2f39-41fd-b297-b7669d48ef52)

- **Paso 2:** Configuración
  - Completamos el Identofocador de BDD como `bdWordPress`
  - Marcamos el nombre de usuario maestro para la BDD como `admin`
  - Completamos la contraseña de la BDD y la guardamos para más adelante

![image](https://github.com/user-attachments/assets/4e0557f9-0102-4712-a7cb-b4497a1a48bf)

- **Paso 3:** Almacenamiento
  - Marcamos el tipo de almacenamiento como `SSD`
  - Asignamos la cantidad adecuada de almacenamiento

![image](https://github.com/user-attachments/assets/becf1a18-2ab3-4e64-b23f-a09372fa51f5)

- **Paso 4:** Conectividad
  - Asignamos a la RDS la `subred publica 1a` que creamos en nuestra VPC
  - Creamos un nuevo grupo de seguridad llamado `seguridadWordPress`

![image](https://github.com/user-attachments/assets/f61aaf8d-c9d6-4a3f-82ba-72f6dd1e5847)

- **Paso 5:** Configuración adiccional
  - **IMPORTANTE**: Debemos asignar un nombre de la BDD inicial, de lo contrario la RDS no creará la BDD
  - En mi caso el nombre es `bdWordPress`

![image](https://github.com/user-attachments/assets/cc4ea604-8054-4bf7-aad8-e37c62e01e34)

![image](https://github.com/user-attachments/assets/e9cd2c2f-953c-484b-a141-a42cf87e2b79)

## 5. Conexión a EC2

Copiamos el `Punto de Enlace` para más adelante

![image](https://github.com/user-attachments/assets/fd57d7a0-3e5f-42c1-8e68-a0f129bf09ed)

- **Paso 1:** Accedemos a la sección `Configurar la conexión de EC2`

![image](https://github.com/user-attachments/assets/54ce2b89-4275-4042-bc08-67f9975fa667)

- **Paso 2:** Seleccionamos la instancia (EC2) que previamente creamos y clicamos en `COntinuar`

![image](https://github.com/user-attachments/assets/d99b524a-9d84-42df-b31f-f87e7e1b8eb1)

Finalmente podemos obsevar que la BDD se ha creado y podemos administrarla

![image](https://github.com/user-attachments/assets/dee5314f-8f09-48a3-beef-cd39fa082bb4)
