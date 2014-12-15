USE [Hotel_Schedule]
GO

/****** Object:  StoredProcedure [dbo].[initTask]    Script Date: 12/12/2014 16:52:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[initTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[initTask]
GO

USE [Hotel_Schedule]
GO

/****** Object:  StoredProcedure [dbo].[initTask]    Script Date: 12/12/2014 16:52:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[initTask] 
	@TaskIDList varchar(1024)
AS
BEGIN
	declare @sql varchar(2048)
	if @TaskIDList = ''
	begin
		set @TaskIDList = '40,41,42,43,44,45,46,47,48'
	end
	set @TaskIDList = '(' + @TaskIDList + ')'
	-- 将task enable 全部置为0
	update Task set [enable]=0 where 1=1
	-- 将指定的task enable 置为1
	set @sql = 'update Task set [enable]=1 where TaskID in ' + @TaskIDList
	exec (@sql)
END


GO


