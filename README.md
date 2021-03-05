# Delilah Resto Backend :hamburger: :fries:

:star: Proyecto Bloque 3 - DWFS de Acámica. :star:

El proyecto consiste en la creación de un sistema de pedidos online para un restaurante, en este caso llamado Delilah Restó. Se debe poner en funcionamiento las partes necesarias para montar una REST API que permita realizar altas, bajas, modificaciones y obtención de información sobre una estructura de datos que podría consumir un cliente.

## Recursos y tecnologías utilizadas

- :pushpin:   Node.js: funcionalidades centrales del lado del servidor.
- :pushpin:   XAMPP: funcionalidad del lado del servidor MySQL.
- :pushpin:   MySQL: base de datos relacional.
- :pushpin:   JWT: autenticación via Token.
- :pushpin:   Postman: manejo de endpoints y testing.
- :pushpin:   Swagger: documentación de API.
- :pushpin:   Express
- :pushpin:   Sequelize
- :pushpin:   Nodemon

## Caracteristicas

- :pushpin: Inicio de sesión de usuario con JWT
- :pushpin: Validación de roles
- :pushpin: CRUD Usarios
- :pushpin: CRUD Productos
- :pushpin: CRUD Ordenes


## Documentación de la API

En el siguiente link de swagger, se podrá visualizar todos los endpoints y documentación necesaria para delilah resto.

[DOCUMENTACION SWAGGER](https://app.swaggerhub.com/apis-docs/egarzon/Delilah_Resto/1.0.0)


## Pasos de instalación e inicialización

### 1 - Instalar Node

Se va a necesitar nodejs. Puedes comprobar si ya lo tienes instalado en tu sistema mediante el comando

`node -v`

En el caso de no tenerlo instalado, descargar e instalar [NODE](https://nodejs.org/dist/v14.16.0/node-v14.16.0-x64.msi).

### 2 - Clonar proyecto e instalación de dependencias

`git clone https://github.com/egarzon85/Proyecto-Delilah.git`

`cd proyecto-delilah`

`npm install`

### 3 - Creación e inicializacion base de datos

- Descargar e Instalar [XAMPP](http://sourceforge.net/projects/xampp/files/).
- Ejecutar XAMPP e inicializar los servicios Apache y MySQL.
- Abrir el panel de control MySQL. `http://localhost/phpmyadmin/`
- Dentro del panel de control, importar el archivo `/db/delilahresto.sql`

Nota: en la base de datos se encuentran pre-cargados 2 usuarios y 2 productos.

- Usuario regular
`User: john, Password: regular`

- Usuario admin
`User: maria, Password: admin`


### 4 - Iniciando el servidor

Desde la terminal ejecute el siguiente comando:

`nodemon index`

Si todo fue realizado correctamente, debe poder visualizar la siguiente leyenda:

`El servidor express corre en el puerto 3000`
`Conectado`

De esta manera ya tenemos nuestro servidor en ejecución y listo para usar.

### 5 - Testear endpoints

- Descargar e instalar la aplicación [Postman](https://www.postman.com/downloads/).

- En la ruta `/documentation/DelilahResto.postman_collection.json` se provee una colección funcional de endpoints con ejemplos para poder hacer uso de la API, la cual solamente se debe proceder a importar en Postman.