DECLARE @myInts TABLE(IntValue INT, PartitionId INT);
INSERT INTO @myInts VALUES (27,2),(3,1),(4,1),(NULL,2);

SELECT
	 [t].[IntValue]
	,ROW_NUMBER()
		OVER (
			PARTITION BY [t].[PartitionId] -- Optional
			ORDER BY [t].[IntValue] -- Mandatory - does not support constants
			) AS [Id]
FROM
	@myInts t;
