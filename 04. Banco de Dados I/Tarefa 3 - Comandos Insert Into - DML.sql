insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
('1','Godofredo','1984-12-01','M','78.5','1.83','Brasil'); ##SEM AUTO INCREMENTO


insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Maria','1983-12-30','M','83.5','1.93','Portugal'); ##COM AUTO INCREMENTO


Select * from pessoas;

Insert into pessoas values
(DEFAULT,'Maria','1983-12-30','M','83.5','1.93','Portugal'),
(DEFAULT,'Maria','1983-12-30','M','83.5','1.93','Portugal'),
(DEFAULT,'Maria','1983-12-30','M','83.5','1.93','Portugal'); ##MAIS FACIL
