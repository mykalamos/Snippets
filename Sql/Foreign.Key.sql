ALTER TABLE [dbo].[MyTable] ADD CONSTRAINT FK_dbo_MyTable_AnotherId FOREIGN KEY (AnotherId) REFERENCES [dbo].[AnotherTable](id);
