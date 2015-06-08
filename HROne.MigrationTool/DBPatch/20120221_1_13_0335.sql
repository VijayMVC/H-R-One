
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.13.0333' 
BEGIN

	ALTER TABlE TaxEmp ADD
		TaxEmpGeneratedDate DATETIME NULL,
		TaxEmpGeneratedByUserID INT NULL
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.13.0335'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





