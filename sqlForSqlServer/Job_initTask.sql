USE [msdb]
GO
/****** Object:  Job [����Զ�������]    Script Date: 12/12/2014 17:29:45 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 12/12/2014 17:29:45 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'����Զ�������', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'AutoTester', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [����Զ�������]    Script Date: 12/12/2014 17:29:46 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'����Զ�������', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=4, 
		@on_success_step_id=2, 
		@on_fail_action=4, 
		@on_fail_step_id=2, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'use bdg
delete FROM reserve where contacter IS NULL 
--ɾ��3��ǰ�ɵ����ԾƵ꣨001-006���µ������󡢱�������⡢��Ԥ��δ�鵽״̬�Ķ������漰��reserve
delete from reserve where reser_status IN (''N'',''V'',''H'',''B1'',''S'') 
AND op_date<convert(varchar(10),DATEADD(d,-3,GETDATE()),102) 
AND hotel_id IN (SELECT hotel_id from hotel where hotel_name LIKE ''�ɵ����ԾƵ�00_'')

--ɾ��3��ǰ�ɵ����ԾƵ꣨001-006���µ������󡢱�������⡢��Ԥ��δ�鵽״̬�Ķ������漰��reserve_his
delete from reserve_his where reser_no IN
(select reser_no from reserve where reser_status IN (''N'',''V'',''H'',''B1'',''S'') 
AND op_date<convert(varchar(10),DATEADD(d,-3,GETDATE()),102) 
AND hotel_id IN (SELECT hotel_id from hotel where hotel_name LIKE ''�ɵ����ԾƵ�00_''))

--ɾ��7��ǰ�ɵ����ԾƵ꣨001-006����ȷ�ϡ�����ס״̬�Ķ������漰��reserve
delete from reserve where reser_status in(''F'',''A'')
AND op_date<convert(varchar(10),DATEADD(d,-7,GETDATE()),102) 
AND hotel_id IN (SELECT hotel_id from hotel where hotel_name LIKE ''�ɵ����ԾƵ�00_'')

--ɾ��7��ǰ�ɵ����ԾƵ꣨001-006����ȷ�ϡ�����ס״̬�Ķ������漰��reserve_his
delete from reserve_his where reser_no IN
(select reser_no from reserve where reser_status IN (''A'',''F'') 
AND op_date<convert(varchar(10),DATEADD(d,-7,GETDATE()),102) 
AND hotel_id IN (SELECT hotel_id from hotel where hotel_name LIKE ''�ɵ����ԾƵ�00_''))

--ɾ��2��ǰ"�Զ���_��%"��ȷ�ϡ�����ס״̬�Ķ������漰��reserve
delete from reserve where reser_status in(''F'',''A'')
AND op_date<convert(varchar(10),DATEADD(d,-2,GETDATE()),102) 
AND hotel_id IN (SELECT hotel_id from hotel where hotel_name LIKE ''�Զ���_��%'')

--ɾ��2��ǰ"�Զ���_��%"��ȷ�ϡ�����ס״̬�Ķ������漰��reserve_his
delete from reserve_his where reser_no IN
(select reser_no from reserve where reser_status IN (''A'',''F'') 
AND op_date<convert(varchar(10),DATEADD(d,-2,GETDATE()),102) 
AND hotel_id IN (SELECT hotel_id from hotel where hotel_name LIKE ''�Զ���_��%''))


--���������ر�����
delete from reser_proxy where reser_no  not in (select p.reser_no from reser_proxy  p inner join  reserve r on p.reser_no=r.reser_no)

delete from reserve_guests where reser_no  not in (select p.reser_no from reserve_guests  p inner join  reserve r on p.reser_no=r.reser_no)

delete from orderitem where reserno  not in (select o.reserno from orderitem  o inner join  reserve r on o.reserno=r.reser_no)

delete from OrderExtendInfo where bookingid  not in (select bookingid from OrderExtendInfo  o inner join  reserve r on bookingid=r.reser_no)

delete from OrderItemAddValue where reserno  not in (select p.reserno from OrderItemAddValue  p inner join  reserve r on p.reserno=r.reser_no)

delete from reserve_status_chg_reason where reser_no  not in (select p.reser_no from reserve_status_chg_reason  p inner join  reserve r on p.reser_no=r.reser_no)

delete from OrderItemRatePlan where reserno  not in (select p.reserno from OrderItemRatePlan  p inner join  reserve r on p.reserno=r.reser_no)

delete from Reserve_Status_Rec where reser_no  not in (select p.reser_no from Reserve_Status_Rec  p inner join  reserve r on p.reser_no=r.reser_no)

delete from OrderKeyValue where reserveno  not in (select p.reserveno from OrderKeyValue  p inner join  reserve r on p.reserveno=r.reser_no)

delete from OrderProductInfo where orderid  not in (select p.orderid from OrderProductInfo  p inner join  reserve r on p.orderid=r.reser_no)

delete from OrderUseProductDetail where reserno  not in (select p.reserno from OrderUseProductDetail  p inner join  reserve r on p.reserno=r.reser_no)

delete from OrderTag where orderid  not in (select p.orderid from OrderTag  p inner join  reserve r on p.orderid=r.reser_no)

DELETE FROM Hotel_VerifyWork.dbo.ReserveVerify WHERE reser_no NOT IN (SELECT reser_no from bdg.dbo.reserve)
DELETE FROM Hotel_VerifyWork.dbo.ReserveQueue_Verify WHERE ReserNo NOT IN (SELECT reser_no from bdg.dbo.reserve)
DELETE FROM reserve WHERE reser_status=''D'' AND  op_date<convert(varchar(10),DATEADD(d,-3,GETDATE()),102)
delete from bdg.dbo.reserve_his where reser_no not in (select reser_no from reserve )', 
		@database_name=N'bdg', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [��ʼ��Task]    Script Date: 12/12/2014 17:29:46 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'��ʼ��Task', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- ��ʼ��Task ״̬��TaskIDlist���״̬����Ϊ1������task״̬����Ϊ0
-- ���TaskIDList�ð�Ƕ��Ÿ�����Ĭ�Ͻ�40,41,42,43,44,45,46,47,48����
EXEC [dbo].[initTask] @TaskIDList = ''''', 
		@database_name=N'Hotel_Schedule', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'һ��һ�Σ�ÿ���賿5��', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=2, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140807, 
		@active_end_date=99991231, 
		@active_start_time=50000, 
		@active_end_time=235959
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
