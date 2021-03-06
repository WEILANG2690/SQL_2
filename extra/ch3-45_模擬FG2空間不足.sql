
--create db sample11
CREATE DATABASE sample11

--add FILEGROUP2 and set maxsize 10MB
ALTER DATABASE [sample11] ADD FILEGROUP [FG2]
GO
ALTER DATABASE [sample11]
  ADD FILE ( NAME = N'sample11_2', 
  FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sample11_2.ndf' , 
  SIZE = 5120KB , 
  MAXSIZE = 10240KB , 
  FILEGROWTH = 1024KB ) TO FILEGROUP [FG2]
GO


--create table on FG2
use sample11
go
create table emp3 (id int identity, name1 varchar(10), name2 char(200))
on fg2

--insert first record
insert into emp3(name1, name2) values ('a1','abc')

--repeat insert until error , then modify size
insert into emp3(name1, name2) select 'a'+cast( @@IDENTITY as varchar(9)), name2 from emp3
select count(*) from  emp3
select * from  emp3

/* Error message
 訊息 1105，層級 17，狀態 2，行 1
'FG2' 檔案群組已滿，無法在資料庫 'sample11' 中為物件 'dbo.emp3' 配置空間。
 請刪除不必要的檔案、卸除檔案群組中的物件、將其他檔案加入檔案群組，或者將檔案群組中現有的檔案設定為自動成長，以產生磁碟空間。
*/

--Modify FG2 size
--set maxsize 
ALTER DATABASE [sample11] MODIFY FILE ( NAME = N'sample11_2', MAXSIZE = 20480KB )
GO
-- or set size at one time
ALTER DATABASE [sample11] MODIFY FILE ( NAME = N'sample11_2', SIZE = 20480KB )
GO

--repeat insert again
insert into emp3(name1, name2) select 'a'+cast( @@IDENTITY as varchar(9)), name2 from emp3

--delete all rows
truncate table emp3
 
--shrink database
DBCC SHRINKFILE (Sample11_2, 10) 
DBCC SHRINKDATABASE (Sample11, 25)

/* shrink message
DbId   FileId      CurrentSize MinimumSize UsedPages   EstimatedPages
------ ----------- ----------- ----------- ----------- --------------
15     3           1280        640         0           0
*/
--query database status
sp_helpdb sample1


--drop database
ALTER DATABASE [sample11] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [sample11]
GO







