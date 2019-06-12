-- --------     << aula4exer7 >>     ------------
--
--                    SCRIPT DE POPULA (DML)
--
-- Data Criacao ...........: 04/06/2019
-- Autor(es) ..............: Gabriel Batista Albino Silva
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer7
--
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
--
-- -----------------------------------------------------------------

use aula4exer7;

insert into PESSOA(nome, sexo, dtNascimento) values
    ('gabriel batista', 'm', '1998-03-05'),
    ('bart vandor', 'm', '1995-11-11'),
    ('rafael do vale', 'f', '1995-12-11'),
    ('amanda rose', 'f', '1995-11-11'),
    ('bojack horseman', 'm', '1995-11-11'),
    ('ricka morte', 'f', '1987-03-04');

insert into DEPENDENTE(idPessoa) values
    (1),
    (2),
    (3);

insert into EMPREGADO(matriculaEmpregado, idPessoa, rua, numero, bairro, cidade, salario, matSupervisor) values
    (444, 4, 'Rua do bosque', 3, 'bosque', 'sao paulo', 3000, NULL),
    (424, 5, 'Avenida Paulista', 1, 'sao paulo', 'sao paulo', 3900, 444),
    (400, 6, 'segunda av.', 1520, 'nucleo bandeir.', 'brasilia', 7990, 424);

insert into DEPARTAMENTO(numeroDepartamento, nomeDepartamento, matriculaEmpregado, dataEntrada) values
    (1212, 'Informática', 444, '2019-03-03'),
    (1432, 'Administrativo', 424, '2018-06-07'),
    (3213, 'Recursos Humanos', 400, '2018-11-12');

insert into LOCALIZACAO(descricaoLocalizacao) values
    ('Loja 3'),
    ('Subsolo do patio'),
    ('Loja do Shopping');

insert into PROJETO(numeroProjeto, nomeProjeto, idLocalizacao, numeroDepartamento) values
    (33, 'Novo portal', 1, 1432),
    (34, 'Refatoração do cod.', 2, 1212),
    (75, 'Prototipação inicial', 3, 3213);

insert into tem(numeroDepartamento, idLocalizacao) values
    (1212, 1),
    (1432, 2),
    (3213, 3);

insert into possui(matriculaEmpregado, idDependente) values
    (444, 1),
    (424, 2),
    (400, 3);

insert into trabalha(matriculaEmpregado, numeroProjeto, horasTrabalhadas) values
    (444, 33, 40),
    (444, 34, 88),
    (424, 75, 8),
    (400, 34, 120);

insert into pertence(matriculaEmpregado, numeroDepartamento) values
    (444, 1212),
    (424, 1432),
    (400, 3213);
