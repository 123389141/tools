USE [msdb]
GO
/****** Object:  StoredProcedure [dbo].[initTask]    Script Date: 12/15/2014 13:52:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[initJob]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[initJob]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[initJob] 
	@JobListEnabledOn varchar(1024),
	@JobListEnabledOff varchar(1024)
AS
BEGIN
	declare @sql varchar(2048)
	if @JobListEnabledOn = ''
	begin
		set @JobListEnabledOn = '''DBD2@HotelBlockOrders'',''DBD3@����EBookingMIS�û�����״̬'',''DBD3@���¾Ƶ�����״̬'''
	end
	if @JobListEnabledOff = ''
	begin
		set @JobListEnabledOff = '''DBD3@����AttackBlacklist�����IP'''
	end

	set @JobListEnabledOn = '(' + @JobListEnabledOn + ')'
	set @JobListEnabledOff = '(' + @JobListEnabledOff + ')'
	-- ��EnabledOn
	set @sql = 'update sysjobs set enabled = 1 where [name] in ' + @JobListEnabledOn
	print @sql
	exec (@sql)

	-- ��EnabledOff
	set @sql = 'update sysjobs set enabled = 0 where [name] in ' + @JobListEnabledOff
	print @sql
	exec (@sql)
END


