
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.1.533' 
BEGIN

	ALTER TABLE Authorizer ADD
		AuthorizerIsReadOnly INT NULL
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.1.535'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





