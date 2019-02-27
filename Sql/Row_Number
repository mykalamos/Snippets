DECLARE @myInts IntTableType;
INSERT INTO @myInts VALUES (27),(3),(4),(NULL);

SELECT
		[t].[IntValue]
		,ROW_NUMBER()
			OVER (
				ORDER BY NULL
				) AS Id
FROM
	@myInts t;
