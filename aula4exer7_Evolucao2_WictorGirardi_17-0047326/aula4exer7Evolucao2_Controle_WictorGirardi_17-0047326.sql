-- --------     << aula4exer7 >>     ------------
--
--                    SCRIPT DE CONTROLE (DDL)
--
-- Data Criacao ...........: 06/06/2019
-- Autor(es) ..............: Alexandre Miguel Rodrigues Nunes Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer7
--
--
-- -----------------------------------------------------------------

CREATE USER 'usufui' IDENTIFIED BY 'fui123';
GRANT SELECT, INSERT, UPDATE, DELETE on aula4exer7.* to 'usufui';
