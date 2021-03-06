USE [Cadastro_Notas]
GO
/****** Object:  StoredProcedure [dbo].[PROC_Consultas]    Script Date: 18/03/2022 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PROC_Consultas]
@Num_Consulta int, @Cod_Disc int, @Ano int, @Semestre int, @RA_Aluno int
AS
BEGIN
	DECLARE
		@Nota1 decimal(10,2),
		@Nota2 decimal(10,2),
		@Prova_Sub decimal(10,2),
		@Situacao varchar(40),
		@Falta int
	IF @Num_Consulta = 1
		begin
			SELECT Matricula.Nota1 , Matricula.Nota2, Matricula.Situacao, Matricula.Falta, Matricula.RA_Aluno from dbo.Matricula, dbo.Disciplina
			where @Cod_Disc = Disciplina.Codigo AND Matricula.Ano = @Ano AND Matricula.Cod_Disc = Disciplina.Codigo
		end
	ELSE IF @Num_Consulta = 2
		begin
			SELECT Aluno.Nome, Matricula.Nota1 , Matricula.Nota2, Matricula.Situacao, Matricula.Falta, Matricula.RA_Aluno, Matricula.Semestre from dbo.Matricula, dbo.Aluno
			where @Ano = Matricula.Ano AND @Semestre = Matricula.Semestre AND @RA_Aluno = Aluno.RA 
		end
	ELSE IF @Num_Consulta = 3
		begin
			SELECT Matricula.RA_Aluno, Matricula.Cod_Disc, Disciplina.Nome, Matricula.Nota1 , Matricula.Nota2, Matricula.Situacao, Matricula.RA_Aluno from dbo.Matricula, dbo.Disciplina
			where 'REPROVADO POR NOTA' = Matricula.Situacao AND @Ano = Matricula.Ano AND Disciplina.Codigo = Matricula.Cod_Disc
		end
	ELSE
		begin
			print('Opção inválida')
		end
END