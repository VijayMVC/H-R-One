
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.14.369' 
BEGIN


	UPDATE AttendanceRecord 
	SET AttendanceRecord.AttendanceRecordRosterCodeInTimeOverride= rt.RosterTableOverrideInTime
	FROM RosterTable rt
	WHERE AttendanceRecord.RosterTableID=rt.RosterTableID
	AND NOT rt.RosterTableOverrideInTime IS NULL
	AND AttendanceRecord.AttendanceRecordRosterCodeInTimeOverride IS NULL

	UPDATE AttendanceRecord 
	SET AttendanceRecord.AttendanceRecordRosterCodeOutTimeOverride= rt.RosterTableOverrideOutTime
	FROM RosterTable rt
	WHERE AttendanceRecord.RosterTableID=rt.RosterTableID
	AND not rt.RosterTableOverrideOutTime IS NULL
	AND AttendanceRecord.AttendanceRecordRosterCodeOutTimeOverride IS NULL


   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.14.370'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





