		SELECT
			a.value('(Field1)[1]', 'varchar(50)') AS Field1
		FROM [dbo].[MyData](nolock) 
		CROSS APPLY	[XmlBody].nodes('/Root/Item') r(a)
