CREATE DATABASE sistema;
USE sistema; 
CREATE TABLE usuarios (id INT NOT NULL AUTO_INCREMENT, rol VARCHAR (45), usuario VARCHAR (45), nombre VARCHAR (9) NOT NULL, 
apellido VARCHAR (12) NOT NULL, email VARCHAR (29), password VARCHAR (255) NULL, direccion VARCHAR (40), 
fecha_nacimiento DATE, img VARCHAR(255), created_at DATETIME, updated_at DATETIME, deleted_at DATETIME, PRIMARY KEY (id));
