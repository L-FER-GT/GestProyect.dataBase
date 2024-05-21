DROP DATABASE IF EXISTS DB_Gestion_Proyectos;
CREATE DATABASE DB_Gestion_Proyectos;
USE DB_Gestion_Proyectos;


CREATE TABLE T_Archivos(
	ID_File INT auto_increment,
    Nombre varchar(50),
    Archivo LONGBLOB,
    PRIMARY KEY(ID_File)
);
CREATE TABLE T_Usuario(
	ID_User INT AUTO_INCREMENT,
    Gmail VARCHAR(100),
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50),
    Informacion_Contacto VARCHAR(100),
    User_Name VARCHAR(50),
    User_Pass VARCHAR(200),
    Cod_Image_Perfil INT,
    PRIMARY KEY(ID_User),
	FOREIGN KEY(Cod_Image_Perfil) REFERENCES T_Archivos(ID_File)
);

CREATE TABLE T_Proyecto(
	ID_Proyecto INT AUTO_INCREMENT,
    ID_Administrador INT,
    Descripcion VARCHAR(200),
    Fecha_Inicial DATE,
    Fecha_Final DATE,
    PRIMARY KEY(ID_Proyecto),
	FOREIGN KEY(ID_Administrador) REFERENCES T_Usuario(ID_User)
);

CREATE TABLE T_Proyectos_Archivo(
	ID_proyecto INT,
	ID_archivo INT,
    PRIMARY KEY(ID_proyecto,ID_archivo),
	FOREIGN KEY(ID_proyecto) REFERENCES T_Proyecto(ID_Proyecto),
	FOREIGN KEY(ID_archivo) REFERENCES T_Archivos(ID_File)
);

CREATE TABLE T_Proyecto_User(
	ID_proyecto INT,
	ID_user INT,
    PRIMARY KEY(ID_proyecto,ID_user),
	FOREIGN KEY(ID_proyecto) REFERENCES T_Proyecto(ID_Proyecto),
	FOREIGN KEY(ID_user) REFERENCES T_Usuario(ID_User)
);

CREATE TABLE T_Tareas(
	ID_Tarea INT AUTO_INCREMENT,
	ID_proyecto INT,
    Descripcion VARCHAR(200),
    Duracion INT,
    estado ENUM('Pendiente','Desarrollo','Finalizado','Error','Expirado') NOT NULL,
    ID_Encargado INT,
    PRIMARY KEY(ID_Tarea),
	FOREIGN KEY(ID_proyecto) REFERENCES T_Proyecto(ID_Proyecto)
);


CREATE TABLE T_Tareas_Archivo(
	ID_tarea INT,
	ID_archivo INT,
    tipo ENUM('Tarea','Solucion') NOT NULL,
    PRIMARY KEY(ID_tarea,ID_archivo),
	FOREIGN KEY(ID_tarea) REFERENCES T_Tareas(ID_Tarea),
	FOREIGN KEY(ID_archivo) REFERENCES T_Archivos(ID_File)
);

CREATE TABLE T_Comentarios(
	ID_Comentario INT AUTO_INCREMENT,
    Descripcion VARCHAR(200),
    fecha DATETIME,
    ID_tarea INT,
    PRIMARY KEY(ID_Comentario),
	FOREIGN KEY(ID_tarea) REFERENCES T_Tareas(ID_Tarea)
);
