-- --------     << aula4exer7 >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 06/06/2019
-- Autor(es) ..............: Alexandre Miguel Rodrigues Nunes Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer7
--
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
--
-- -----------------------------------------------------------------

CREATE database IF NOT EXISTS aula4exer7;

use aula4exer7;

CREATE TABLE PESSOA (
    idPessoa BIGINT(10) NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30),
    sexo ENUM('M','F') NOT NULL,
    dtNascimento DATE NOT NULL,
    constraint PESSOA_PK primary key (idPessoa)
)engine = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE DEPENDENTE (
    idDependente BIGINT(10) NOT NULL AUTO_INCREMENT,
    idPessoa BIGINT(10) NOT NULL,
    constraint DEPENDENTE_PK primary key (idDependente),
    constraint DEPENDENTE_PESSOA_FK foreign key (idPessoa) REFERENCES PESSOA(idPessoa)
)engine = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE EMPREGADO (
    matriculaEmpregado BIGINT(10) NOT NULL,
    idPessoa BIGINT(10) NOT NULL,
    rua VARCHAR(70) NOT NULL,
    numero INT(5) NOT NULL,
    bairro VARCHAR(70) NOT NULL,
    cidade VARCHAR(70) NOT NULL,
    salario INT(7) NOT NULL,
    matSupervisor BIGINT(10),
    constraint EMPREGADO_PK primary key(matriculaEmpregado),
    constraint EMPREGADO_UNIQUE UNIQUE (idPessoa),
    constraint EMPREGADO_PESSOA_FK foreign key (idPessoa) REFERENCES PESSOA(idPessoa),
    constraint EMPREGADO_SUPERVISOR_FK foreign key (matSupervisor) REFERENCES EMPREGADO(matriculaEmpregado)
)engine = InnoDB;

CREATE TABLE DEPARTAMENTO (
    numeroDepartamento BIGINT(10) NOT NULL,
    nomeDepartamento VARCHAR(70) NOT NULL,
    matriculaEmpregado BIGINT(10) NOT NULL,
    dataEntrada DATE NOT NULL,
    constraint DEPARTAMENTO_PK primary key (numeroDepartamento),
    constraint DEPARTAMENTO_EMPREGADO_FK foreign key (matriculaEmpregado) REFERENCES EMPREGADO(matriculaEmpregado)
)engine = InnoDB;

CREATE TABLE LOCALIZACAO (
    idLocalizacao BIGINT(10) NOT NULL AUTO_INCREMENT,
    descricaoLocalizacao VARCHAR(70) NOT NULL,
    constraint LOCAL_PK primary key (idLocalizacao)
)engine = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PROJETO (
    numeroProjeto BIGINT(10) NOT NULL,
    nomeProjeto VARCHAR(70) NOT NULL,
    idLocalizacao BIGINT(10) NOT NULL,
    numeroDepartamento BIGINT(10) NOT NULL,
    constraint PROJETO_PK primary key (numeroProjeto),
    constraint PROJETO_DEPARTAMENTO_FK foreign key (numeroDepartamento) REFERENCES DEPARTAMENTO(numeroDepartamento),
    constraint PROJETO_LOCAL_FK foreign key (idLocalizacao) REFERENCES LOCALIZACAO(idLocalizacao)
)engine = InnoDB;

CREATE TABLE tem (
    numeroDepartamento BIGINT(10) NOT NULL,
    idLocalizacao BIGINT(10) NOT NULL,
    constraint tem_PK primary key (numeroDepartamento, idLocalizacao),
    CONSTRAINT tem_DEPARTAMENTO_FK foreign key(numeroDepartamento) REFERENCES DEPARTAMENTO(numeroDepartamento),
    constraint tem_LOCAL_FK foreign key (idLocalizacao) REFERENCES LOCALIZACAO(idLocalizacao)
)engine = InnoDB;

CREATE TABLE possui (
    matriculaEmpregado BIGINT(10) NOT NULL,
    idDependente BIGINT(10) NOT NULL,
    constraint possui_PK primary key (matriculaEmpregado, idDependente),
    constraint possui_EMPREGADO_FK foreign key (matriculaEmpregado) REFERENCES EMPREGADO(matriculaEmpregado),
    constraint possui_DEPENDENTE_FK foreign key (idDependente) REFERENCES DEPENDENTE (idDependente)
)engine = InnoDB;

CREATE TABLE trabalha (
    matriculaEmpregado BIGINT(10) NOT NULL,
    numeroProjeto BIGINT(10) NOT NULL,
    horasTrabalhadas INT(5) NOT NULL,
    constraint trabalha_PK PRIMARY KEY (matriculaEmpregado, numeroProjeto),
    constraint trabalha_EMPREGADO_FK foreign key (matriculaEmpregado) REFERENCES EMPREGADO (matriculaEmpregado),
    constraint trabalha_PROJETO_FK foreign key (numeroProjeto) REFERENCES PROJETO(numeroProjeto)
)engine = InnoDB;

CREATE TABLE pertence (
    matriculaEmpregado BIGINT(10) NOT NULL,
    numeroDepartamento BIGINT(10) NOT NULL,
    constraint pertence_PK primary key (matriculaEmpregado, numeroDepartamento),
    constraint pertence_EMPREGADO_FK foreign key (matriculaEmpregado) REFERENCES EMPREGADO(matriculaEmpregado),
    constraint pertence_DEPARTAMENTO_FK foreign key (numeroDepartamento) REFERENCES DEPARTAMENTO(numeroDepartamento)
)engine = InnoDB;
