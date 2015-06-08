
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.11.0253' 
BEGIN

		
	ALTER TABLE LeaveCode ADD
		LeaveCodeIsSkipPayrollProcess int NULL
		
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.11.0256'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





