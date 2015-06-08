
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.3.570' 
BEGIN

	DELETE FROM AuditTrailDetail
		WHERE TableName='LeaveBalance'
	
	ALTER TABLE LeaveApplication DROP COLUMN
		LeaveAppBalanceAsOfDate 
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.3.571'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





