$ONCE
WITH SourceCte 
(
$EACH+
        ,[$0]
$ONCE
) AS 
(
	SELECT 'TODO' UNION ALL

) 
MERGE $h0 AS T
USING SourceCte AS S
ON 
$EACH+
        T.[$0] = S.[$0] AND
$ONCE
WHEN NOT MATCHED BY TARGET THEN 
INSERT (
$EACH+
        ,[$0]
$ONCE
)
VALUES (
$EACH+
        ,s.[$0]
$ONCE
	)
WHEN MATCHED THEN 
UPDATE SET	
$EACH+
        ,[$0] = s.[$0]
$ONCE
OUTPUT Inserted.*;
