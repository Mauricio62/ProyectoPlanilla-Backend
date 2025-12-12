


-- Tabla TipoDocumentos
CREATE TABLE TipoDocumentos (
    IdTipoDocumento INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Activo BOOLEAN NOT NULL DEFAULT TRUE,
    FecCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FecUltimaModificacion DATETIME NULL
);

-- Tabla Generos
CREATE TABLE Generos (
    IdGenero INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Activo BOOLEAN NOT NULL DEFAULT TRUE,
    FecCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FecUltimaModificacion DATETIME NULL
);

-- Tabla EstadosCiviles
CREATE TABLE EstadosCiviles (
    IdEstadoCivil INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Activo BOOLEAN NOT NULL DEFAULT TRUE,
    FecCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FecUltimaModificacion DATETIME NULL
);

-- Tabla Cargos
CREATE TABLE Cargos (
    IdCargo INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Activo BOOLEAN NOT NULL DEFAULT TRUE,
    FecCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FecUltimaModificacion DATETIME NULL
);

-- Tabla SituacionTrabajador
CREATE TABLE SituacionTrabajador (
    IdSituacion INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Activo BOOLEAN NOT NULL DEFAULT TRUE,
    FecCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FecUltimaModificacion DATETIME NULL
);

-- Tabla SistemaPensiones
CREATE TABLE SistemaPensiones (
    IdSistemaPension INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Aporte DECIMAL(18,3) NULL,
    Comision DECIMAL(18,3) NULL,
    Prima DECIMAL(18,3) NULL,
    Activo BOOLEAN NOT NULL DEFAULT TRUE,
    FecCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FecUltimaModificacion DATETIME NULL
);

-- Tabla Trabajadores
CREATE TABLE Trabajadores (
    IdTrabajador INT AUTO_INCREMENT PRIMARY KEY,
    IdTipoDocumento INT NOT NULL,
    Documento VARCHAR(11) NOT NULL,
    Nombres VARCHAR(50) NOT NULL,
    ApellidoPaterno VARCHAR(50) NOT NULL,
    ApellidoMaterno VARCHAR(50) NOT NULL,
    IdGenero INT NOT NULL,
    IdEstadoCivil INT NOT NULL,
    Direccion VARCHAR(120) NOT NULL,
    Email VARCHAR(120) NULL,
    Hijos INT NOT NULL DEFAULT 0,
    IdCargo INT NOT NULL,
    FecNacimiento DATE NOT NULL,
    FecIngreso DATE NOT NULL,
    IdSituacion INT NOT NULL,
    IdSistemaPension INT NOT NULL,
    Foto LONGBLOB NULL,
    Activo BOOLEAN NOT NULL DEFAULT TRUE,
    FecCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FecUltimaModificacion DATETIME NULL,
    
    FOREIGN KEY (IdTipoDocumento) REFERENCES TipoDocumentos(IdTipoDocumento),
    FOREIGN KEY (IdGenero) REFERENCES Generos(IdGenero),
    FOREIGN KEY (IdEstadoCivil) REFERENCES EstadosCiviles(IdEstadoCivil),
    FOREIGN KEY (IdCargo) REFERENCES Cargos(IdCargo),
    FOREIGN KEY (IdSituacion) REFERENCES SituacionTrabajador(IdSituacion),
    FOREIGN KEY (IdSistemaPension) REFERENCES SistemaPensiones(IdSistemaPension)
);


-- Tabla AsistenciasTrabajadores
CREATE TABLE AsistenciasTrabajadores (
    IdAsistencia INT AUTO_INCREMENT PRIMARY KEY,
    IdTrabajador INT NULL,
    Año INT NULL,
    Mes INT NULL,
    DiasLaborales INT NULL,
    DiasDescanso INT NULL,
    DiasInasistencia INT NULL,
    DiasFeriados INT NULL,
    HorasExtra25 DECIMAL(18,3) NULL,
    HorasExtra35 DECIMAL(18,3) NULL,
    Activo BOOLEAN NOT NULL DEFAULT TRUE,
    FecCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FecUltimaModificacion DATETIME NULL,
    
    FOREIGN KEY (IdTrabajador) REFERENCES Trabajadores(IdTrabajador)
);