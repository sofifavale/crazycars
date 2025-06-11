CREATE DATABASE IF NOT EXISTS crazycars_concesionaria
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE crazycars_concesionaria;
CREATE TABLE rol (
    id_rol INT NOT NULL AUTO_INCREMENT,
    nombre_rol VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_rol)
) ENGINE=InnoDB;
CREATE TABLE usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    id_rol INT NOT NULL,
    PRIMARY KEY (id_usuario),
    INDEX idx_usuario_rol (id_rol),
    CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES rol(id_rol) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
CREATE TABLE vehiculo (
    id_vehiculo INT NOT NULL AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    precio DOUBLE NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (id_vehiculo)
) ENGINE=InnoDB;
CREATE TABLE orden (
    id_orden INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_vehiculo INT NOT NULL,
    fecha DATE NOT NULL,
    total DECIMAL(12, 2) NOT NULL,
    PRIMARY KEY (id_orden),
    INDEX idx_orden_usuario (id_usuario),
    INDEX idx_orden_vehiculo (id_vehiculo),
    CONSTRAINT fk_orden_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_orden_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
