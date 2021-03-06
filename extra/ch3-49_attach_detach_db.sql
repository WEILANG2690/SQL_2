--若搬到其它非預設的目錄,須設權限(Everyone 完全控制)
--右鍵 目錄名/ 內容 /安全性 / 編輯 / 新增 / 進階 / 立即搜尋/ 選 Everyone /確定
  /確定 / 點 Everyone / 點 完全控制 / 確定 
   
--create db 
create database DB01
go

--detach
USE [master]
GO
ALTER DATABASE [DB01] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
EXEC master.dbo.sp_detach_db @dbname = N'DB01'
GO


--attach
USE [master]
GO
sp_attach_db 'db01',
             'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DB01.mdf',
             'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DB01_log.ldf' 


--or 
USE [master]
GO
CREATE DATABASE [DB01] ON 
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DB01.mdf' ),
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DB01_log.ldf' )
 FOR ATTACH
GO
 