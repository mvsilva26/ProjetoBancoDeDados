USE [Cadastro_Notas]
GO
/****** Object:  Trigger [dbo].[TGR_Verifica_Alunos_AI]    Script Date: 18/03/2022 15:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TGR_Verifica_Alunos_AI]
on [dbo].[Matricula]
after insert
AS
BEGIN
    DECLARE
		@Nota1 decimal(10, 2),
        @Nota2 decimal(10, 2),
		@Prova_Sub decimal(10,2),
		@Media decimal(10,2),
		@RA_Aluno int,
		@Situacao varchar(40),
		@Falta int,
		@Cod_Disc int,
		@MaxQtdFalta int,
		@Calc_CargaHorario int
    SELECT @Nota1 = Nota1, @Nota2 = Nota2, @Prova_Sub = Prova_Sub, @RA_Aluno = RA_Aluno, @Falta = Falta, @Cod_Disc = Cod_Disc from inserted

	 EXECUTE PROC_Verifica_Alunos @Falta, @Nota1, @Nota2, @Prova_Sub, @RA_Aluno, @Cod_Disc
	
end