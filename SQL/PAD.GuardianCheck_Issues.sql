USE [CAGPAD]
GO
/****** Object:  StoredProcedure [PAD].[GuardianCheck_Issues]    Script Date: 18/06/2018 21:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [PAD].[GuardianCheck_Issues] (@PadId int, @Date datetime)
as

begin

    create table #issues (IssueName varchar(50))

    declare @sql nvarchar(max) = ''
    select @sql = @sql + ' insert into #Issues (IssueName) select ''' + c.name + ''' from PAD.GuardianChecks g where g.padid = ' + cast(@PadId as varchar(5)) + ' and g.date = ''' + cast(@Date as varchar(20)) + ''' and ' + c.name + ' = 0;'
	from 
		sys.columns c
		join sys.tables t on c.object_id = t.object_id
	where
		t.name = 'GuardianChecks'
		and c.system_type_id = 104

	exec (@sql)

	select
		IssueName,
		IssueQuestion = case IssueName
			when 'CabinetOpenLock' then 'Does the cabinet open and lock correctly?'
			when 'CabinetBatteriesOk' then 'Are the lock batteries ok?'
			when 'CabinetLightWork' then 'Are the cabinet lights working?'
			when 'nothingTouchingHeater' then 'Have you ensured that nothing is touching the cabinet heater?'
			when 'AEDOk' then 'Is the AED in operating mode?'
			when 'AEDSilent' then 'Is the AED silent?'
		end
	from 
		#issues

end

go

exec [PAD].[GuardianCheck_Issues] 1, '2018-06-14'