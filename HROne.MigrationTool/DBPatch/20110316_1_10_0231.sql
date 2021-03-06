
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.10.0230' 
BEGIN

	ALTER TABLE PayrollGroup ADD
		PayGroupUseCNDForDailyHourlyPayment int NULL
		
	INSERT INTO PayrollProrataFormula (PayFormCode, PayFormDesc, PayFormIsSys)
	VALUES ('SYS004', 'Payment within Payroll Cycle / (Working days within Payroll Cycle)', 'Y')
	

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.10.0231'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





