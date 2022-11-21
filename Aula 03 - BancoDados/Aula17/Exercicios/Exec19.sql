Use EXERCICIO_12
--01
ALTER TABLE tb_empregado
ADD premiacao VARCHAR(50);

--02
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 

GO

    GO
    CREATE OR ALTER PROCEDURE dbo.addAsteriscos @EmployeeID INT
    AS
    BEGIN
    DECLARE @astericos DATETIME,@DepartamentID INT
        IF(Mod(salario,1000)=0)
        UPDATE tb_empregado
        SET premiacao = premiacao + @astericos 
        FROM tb_empregado
    END
GO


SELECT * FROM tb_empregado

--03
-- Function deve retornar um valor, mas em stored o retorno é opcional.
-- As functions podem ter apenas parâmetros de entrada. As storeds podem ter parâmetros de entrada / saída.
-- Functions podem ser chamadas de dentro de storeds, já as storeds não podem ser chamados a partir de functions.

--04
-- È um conjunto de parametros 

--05
--Pode se utilizar de paramentros opcionais para chamar a função sem um valor , paramentros com valor padrão que caso não seja informado
--terá um valor setado

--06
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 

GO

    GO
    CREATE OR ALTER PROCEDURE dbo.ExcluirEmpregado @EmployeeID INT
    AS
    BEGIN
        DECLARE @tb_empregadoDeleted TABLE(
            id_empregado INT,
            Id_funcao int,
            id_gerente int,
            id_departamento int,
            nome varchar(max),
            sobrenome varchar(max),
            email varchar(max),
            telefone varchar(max),
            percentual_comissao numeric(10,2),
            salario numeric(10,2),
            premiacao varchar(max)
        );
        INSERT INTO @tb_empregadoDeleted 
            select* from tb_empregado where id_empregado = @EmployeeID     
        Delete tb_empregado
        FROM tb_empregado
        WHERE id_empregado = @EmployeeID
    END
GO

