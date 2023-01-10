CREATE DATABASE canski;
USE canski;
CREATE TABLE categorias (id INT NOT NULL AUTO_INCREMENT, nombre VARCHAR (50) NOT NULL, created_at TIMESTAMP, 
updated_at TIMESTAMP, deleted_at TIMESTAMP, PRIMARY KEY (id));
CREATE TABLE productos (id INT NOT NULL AUTO_INCREMENT, id_categoria INT, nombre VARCHAR (50), descripcion 
VARCHAR (50), precio INT, img TEXT, created_at TIMESTAMP, updated_at TIMESTAMP, deleted_at TIMESTAMP, PRIMARY KEY 
(id), FOREIGN KEY (id_categoria) REFERENCES categorias(id));
CREATE TABLE roles (id INT NOT NULL AUTO_INCREMENT , nombre VARCHAR (18), created_at TIMESTAMP, updated_at TIMESTAMP, 
deleted_at TIMESTAMP, PRIMARY KEY (id));
CREATE TABLE usuarios (id INT NOT NULL AUTO_INCREMENT, id_rol INT NOT NULL, nombre VARCHAR (9) NOT NULL, 
apellido VARCHAR (12) NOT NULL, email VARCHAR (29), contraseña VARCHAR (8), direccion VARCHAR (40), 
fecha_nacimiento DATE, created_at TIMESTAMP, updated_at TIMESTAMP, deleted_at TIMESTAMP, PRIMARY KEY (id), 
FOREIGN KEY (id_rol) REFERENCES roles(id));
CREATE TABLE facturas (id INT NOT NULL AUTO_INCREMENT, id_usuario INT NOT NULL, total INT NOT NULL, fecha_factura 
DATETIME NOT NULL, direccion_factura VARCHAR (40), created_at TIMESTAMP, updated_at TIMESTAMP, deleted_at 
TIMESTAMP, PRIMARY KEY (id), FOREIGN KEY (id_usuario) REFERENCES usuarios(id));
CREATE TABLE factura_producto (id INT NOT NULL AUTO_INCREMENT, id_producto INT NOT NULL, id_factura INT NOT NULL, 
precio INT NOT NULL, cantidad INT NOT NULL, created_at TIMESTAMP, updated_at TIMESTAMP, deleted_at TIMESTAMP, 
PRIMARY KEY (id), FOREIGN KEY (id_producto) REFERENCES productos(id), FOREIGN KEY (id_factura) REFERENCES 
facturas(id));

