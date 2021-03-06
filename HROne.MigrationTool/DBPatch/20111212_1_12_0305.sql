
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.12.0300' 
BEGIN

	ALTER TABLE EmpWorkExp ADD
		EmpWorkExpEmploymentTypeID int null,
		EmpWorkExpIsRelevantExperience int null
		
	ALTER TABLE EmpQualification ADD
		EmpQualificationLearningMethod NVARCHAR(255) null
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.12.0305'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





