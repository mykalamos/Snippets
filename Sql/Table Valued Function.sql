CREATE FUNCTION [schema].[ufn_FuncName]
(
	@Variablename DataType
)

RETURNS table

AS

RETURN

(

	SELECT 
			*
  FROM 
	   MyTable

)
