USE master;  
GO  
ALTER DATABASE OldDbName SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
ALTER DATABASE  OldDbName MODIFY NAME =  NewDbName ;
GO  
ALTER DATABASE NewDbName SET MULTI_USER
GO