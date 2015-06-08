
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.11.0257' 
BEGIN

	INSERT INTO MPFParameter (MPFParamEffFr, MPFParamMinMonthly, MPFParamMaxMonthly, MPFParamMinDaily, MPFParamMaxDaily, MPFParamEEPercent, MPFParamERPercent)
	VALUES ('2011-11-01', 6500, 20000, 250, 650, 5, 5)
		
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.11.0259'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





