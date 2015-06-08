
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.13.0335' 
BEGIN

	INSERT INTO MPFParameter (MPFParamEffFr, MPFParamMinMonthly, MPFParamMaxMonthly, MPFParamMinDaily, MPFParamMaxDaily, MPFParamEEPercent, MPFParamERPercent)
	VALUES ('2012-06-01', 6500, 25000, 250, 830, 5, 5)
		
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.13.0336'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





