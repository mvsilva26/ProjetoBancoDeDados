create table Aluno(
	RA		int not null,
	Cpf		varchar(14),
	Nome	varchar(40),

	constraint PK_RA_Aluno primary key(RA)
);


insert into Aluno values(123, '111-222-333-14', 'A');
insert into Aluno values(124, '222-222-333-33', 'B');
insert into Aluno values(125, '222-222-333-33', 'C');
insert into Aluno values(126, '444-555-333-33', 'D');

select * from Aluno;

create table Disciplina(
	Codigo			int			not null,
	Nome			varchar(40),
	Carga_Horario	int,

	constraint PK_Codigo_Disciplina primary key(Codigo)
);

insert into Disciplina values(1, 'Matematica', 25),
							 (2, 'Fisica', 40);
	
update Disciplina
set Carga_Horario = 60
where Codigo = 1;

select * from Disciplina;

create table Matricula(
	Falta		int,
	Nota1		decimal(10,2),
	Nota2		decimal(10,2),
	Media		decimal(10,2),
	Semestre	int,
	Ano			int,
	Prova_Sub	decimal(10,2),
	Situacao	varchar(40),
	RA_Aluno	int not null,
	Cod_Disc	int not null,

	constraint PK_RA_Aluno_Cod_Disc_Matricula primary key(RA_Aluno, Cod_Disc),
	constraint FK_RA_Aluno foreign key(RA_Aluno) references Aluno(RA),
	constraint FK_Cod_Disc foreign key(Cod_Disc) references Disciplina (Codigo)
);

insert into Matricula values (1, 5.0, 5.0, 0, 1, 2022, 0, '', 123, 1);

insert into Matricula values (1, 7.0, 8.0, 0, 1, 2021, 0, '', 124, 1);

insert into Matricula values (1, 7.0, 8.0, 0, 1, 2021, 0, '', 124, 1);

insert into Matricula values (20, 7.0, 8.0, 0, 1, 2021, 0, '', 126, 1);

insert into Matricula values (1, 2.0, 3.0, 0, 1, 2021, 0, '', 125, 1);


insert into Matricula values (1, 7.0, 8.0, 0, 2, 2021, 0, '', 124, 1);


delete from Matricula;


select * from Matricula
ORDER BY RA_Aluno;

EXECUTE PROC_Consultas 3, 1, 2021, 2, 124





