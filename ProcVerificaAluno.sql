USE [Cadastro_Notas]
GO
/****** Object:  StoredProcedure [dbo].[PROC_Verifica_Alunos]    Script Date: 18/03/2022 15:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PROC_Verifica_Alunos]
@Falta int, @Nota1 decimal (10,2), @Nota2 decimal(10,2), @Prova_Sub decimal(10, 2), @RA_Aluno int, @Cod_Disc int
as
begin
	DECLARE
		@Carga_Horario int,
		@Calc_CargaHorario decimal(10,2),
		@Media decimal(10,2),
		@Situacao varchar(40),
		@MaxQtdFalta int
	select @Calc_CargaHorario = Carga_Horario from Disciplina where @Cod_Disc = Codigo
	set @MaxQtdFalta = cast(@Calc_CargaHorario * 0.25 as int)
	print(@MaxQtdFalta)
	set @Media = (@Nota1 + @Nota2) / 2.00
	IF @Falta > @MaxQtdFalta
		begin
			set @Situacao = 'REPROVADO POR FALTA'
		end
	ELSE 
		begin
			if @Media < 5
				begin
					set @Situacao = 'REPROVADO POR NOTA'
				end
			else
				begin
					set @Situacao = 'APROVADO'
				end
		end
	UPDATE dbo.Matricula set Media = @Media, Situacao = @Situacao where RA_Aluno = @RA_Aluno
end	