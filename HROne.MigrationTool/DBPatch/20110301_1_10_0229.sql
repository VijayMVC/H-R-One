
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.10.0228' 
BEGIN
	ALTER TABLE EmpPayroll DROP Column
		EmpPayrollTotalWorkingHour

	ALTER TABLE EmpPayroll ADD
		EmpPayTotalWorkingHours REAL NULL

	DROP TABLE 	MinimumWage
	
	CREATE TABLE MinimumWage
	(
		MinimumWageID int NOT NULL IDENTITY (1, 1),
		MinimumWageEffectiveDate datetime NULL,
		MinimumWageHourlyRate real NULL,
		CONSTRAINT PK_MinimumWage PRIMARY KEY CLUSTERED 
		(
			MinimumWageID
		)
	)
	
		
	UPDATE PaymentRecord
	SET PayRecIsRestDayPayment=0

	UPDATE PayrollGroup
	SET PayGroupRestDayHasWage=1

	UPDATE PayrollGroup
	SET PayGroupRestDayProrataFormula=(Select PayFormID from PayrollProrataFormula where PayFormCode='<DEFAULT>')

           
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.10.0229'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





