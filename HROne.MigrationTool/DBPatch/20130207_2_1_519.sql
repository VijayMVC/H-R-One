
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.1.518' 
BEGIN
           
	ALTER TABLE EmailLog ALTER COLUMN 
		EmailLogToAddress NTEXT NULL
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.1.519'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





