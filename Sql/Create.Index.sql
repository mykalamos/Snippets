IF INDEXPROPERTY ( OBJECT_ID('[dbo].[MyTable]') , 'IX_MyTable_MyValue' , 'IndexID' )  IS NULL
BEGIN
	CREATE NONCLUSTERED INDEX [IX_MyTable_MyValue] ON [dbo].[MyTable](MyValue);
END

-- SELECT * FROM sys.sysindexes s WHERE s.name = 'IX_MyTable_MyValue';
