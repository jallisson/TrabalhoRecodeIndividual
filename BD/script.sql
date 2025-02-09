CREATE TABLE Clientes (
  idClientes INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefeone VARCHAR(20) NULL,
  cpf VARCHAR(11) NOT NULL,
  data_nascimento DATE NULL,
  data_cadastro TIMESTAMP NULL,
  PRIMARY KEY(idClientes),
  UNIQUE INDEX Clientes_index1007(email),
  UNIQUE INDEX Clientes_index1013(cpf)
);

CREATE TABLE Destino (
  idDestino INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  pais VARCHAR(100) NOT NULL,
  cidade VARCHAR NOT NULL,
  descricao TEXT NULL,
  preco_base DECIMAL(0,2) NOT NULL,
  PRIMARY KEY(idDestino)
)
TYPE=InnoDB;

CREATE TABLE Pacotes (
  idPacotes INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  id_destino INTEGER UNSIGNED NOT NULL,
  preco DECIMAL(0,2) NOT NULL,
  duracao_dias INTEGER NOT NULL,
  incui_voo BOOL NULL DEFAULT TRUE,
  inclui_hospedagem BOOL NULL DEFAULT TRUE,
  PRIMARY KEY(idPacotes),
  INDEX Pacotes_FKIndex1(id_destino)
);

CREATE TABLE Reservas (
  idReservas INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  data_reserva TIMESTAMP NULL,
  data_viagem DATE NULL,
  status_reserva ENUM(1,2,3) NULL DEFAULT 1,
  valor_total DOUBLE NULL,
  forma_pagamento ENUM(1,2,3,4) NULL,
  idPacotes INTEGER UNSIGNED NOT NULL,
  idClientes INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idReservas),
  INDEX Reservas_FKIndex1(idClientes),
  INDEX Reservas_FKIndex2(idPacotes)
);

