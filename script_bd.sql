CREATE SCHEMA IF NOT EXISTS bd_analyx DEFAULT CHARACTER SET utf8 ;
USE bd_analyx;

-- drop database bd_analyx;

CREATE TABLE IF NOT EXISTS empresa (
  id INT NOT NULL AUTO_INCREMENT,
  cnpj CHAR(17) NULL,
  razaoSocial VARCHAR(128) NULL,
  responsavel VARCHAR(45) NULL,
  telefone CHAR(13) NULL,
  email VARCHAR(256) NULL,
  PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS cpu (
  id INT NOT NULL AUTO_INCREMENT,
  modeloCPU VARCHAR(45) NULL,
  PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS disco (
  id INT NOT NULL AUTO_INCREMENT,
  volume VARCHAR(45) NULL,
  PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS ram (
  id INT NOT NULL AUTO_INCREMENT,
  total VARCHAR(45) NULL,
  PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS especificacaoMaquina (
  id INT NOT NULL AUTO_INCREMENT,
  numeroSerial VARCHAR(45) NULL,
  fkCpu INT NOT NULL,
  fkDisco INT NOT NULL,
  fkRam INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_especificacaoMaquina_cpu1
    FOREIGN KEY (fkcpu)
    REFERENCES cpu (id),
  CONSTRAINT fk_especificacaoMaquina_Disco1
    FOREIGN KEY (fkDisco)
    REFERENCES disco (id),
  CONSTRAINT fk_especificacaoMaquina_ram1
    FOREIGN KEY (fkRam)
    REFERENCES ram (id));

CREATE TABLE IF NOT EXISTS setor (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS funcionario (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  matricula VARCHAR(45) NULL UNIQUE,
  fkEmpresa INT NULL,
  fkGestor INT NULL,
  fkMaquina INT NULL,
  fkSetor INT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_Funcionario_Empresa1
    FOREIGN KEY (fkEmpresa)
    REFERENCES empresa (id),
  CONSTRAINT fk_Funcionario_Funcionario1
    FOREIGN KEY (fkGestor)
    REFERENCES funcionario (id),
  CONSTRAINT fk_Funcionario_EspecificacaoMaquina1
    FOREIGN KEY (fkMaquina)
    REFERENCES especificacaoMaquina (id),
  CONSTRAINT fk_Funcionario_setor1
    FOREIGN KEY (fkSetor)
    REFERENCES setor (id));

CREATE TABLE IF NOT EXISTS tipoUsuario (
  id INT NOT NULL AUTO_INCREMENT,
  tipoUsuario VARCHAR(45) NULL,
  PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS usuario (
  id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(256) NULL UNIQUE,
  senha VARCHAR(256) NULL,
  fkTipoUsuario INT NOT NULL,
  fkFuncionario INT NOT NULL,
  PRIMARY KEY (id, fkFuncionario),
  CONSTRAINT fk_Usuario_Funcionario1
    FOREIGN KEY (fkFuncionario)
    REFERENCES funcionario (id),
  CONSTRAINT fk_Usuario_tipoUsuario1
    FOREIGN KEY (fkTipoUsuario)
    REFERENCES tipoUsuario (id));

CREATE TABLE IF NOT EXISTS monitoramento (
  id INT NOT NULL AUTO_INCREMENT,
  data DATE NULL,
  fkMaquina INT NOT NULL,
  PRIMARY KEY (id,fkMaquina),
  CONSTRAINT fk_Monitoramento_EspecificacaoMaquina1
    FOREIGN KEY (fkMaquina)
    REFERENCES especificacaoMaquina (id));

CREATE TABLE IF NOT EXISTS rede (
  id INT NOT NULL AUTO_INCREMENT,
  latencia INT NULL,
  upload INT NULL,
  download INT NULL,
  fkMonitoramento INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_rede_Monitoramento1
    FOREIGN KEY (fkMonitoramento)
    REFERENCES monitoramento (id));

CREATE TABLE IF NOT EXISTS tipoComponente (
  id INT NOT NULL AUTO_INCREMENT,
  tipoComponente VARCHAR(45) NULL,
  PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS componente (
  id INT NOT NULL AUTO_INCREMENT,
  uso FLOAT NULL,
  fkMonitoramento INT NOT NULL,
  fkTipoComponente INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_componente_Monitoramento1
    FOREIGN KEY (fkMonitoramento)
    REFERENCES monitoramento (id),
  CONSTRAINT fk_componente_table11
    FOREIGN KEY (fkTipoComponente)
    REFERENCES tipoComponente (id));

CREATE TABLE IF NOT EXISTS tipoCategoria (
  id INT NOT NULL AUTO_INCREMENT,
  tipoCategoria VARCHAR(45) NULL,
  descricao VARCHAR(45) NULL,
  PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS alerta (
  id INT NOT NULL AUTO_INCREMENT,
  nivelGravidade VARCHAR(45) NULL,
  fkMonitoramento INT NOT NULL,
  fkTipoComponente INT NOT NULL,
  fkTipoCategoria INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_Alertas_Monitoramento1
    FOREIGN KEY (fkMonitoramento)
    REFERENCES monitoramento (id),
  CONSTRAINT fk_Alertas_table11
    FOREIGN KEY (fkTipoComponente)
    REFERENCES tipoComponente (id),
  CONSTRAINT fk_Alertas_tipoCategoria1
    FOREIGN KEY (fkTipoCategoria)
    REFERENCES tipoCategoria (id));
    