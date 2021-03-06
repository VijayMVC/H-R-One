
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.1.521' 
BEGIN

	DELETE FROM MinimumWage 
	WHERE MinimumWageEffectiveDate='2013-05-01'
	AND MinimumWageHourlyRate=30
           
	INSERT INTO MinimumWage (MinimumWageEffectiveDate,MinimumWageHourlyRate)
	Values ('2013-05-01', 30)
           			
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.1.523'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





