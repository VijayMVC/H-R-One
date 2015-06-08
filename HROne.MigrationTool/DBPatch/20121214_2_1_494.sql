
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.1.492' 
BEGIN

	ALTER TABLE SystemParameter ALTER COLUMN
           ParameterValue NTEXT NULL
           
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.1.494'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





