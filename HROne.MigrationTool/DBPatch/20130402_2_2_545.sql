
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.2.544' 
BEGIN

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
    VALUES
		('PER019','Employee Roster Table Group', 'Personnel', 0)
           
	INSERT INTO UserGroupFunction
	(
		UserGroupID,
		FunctionID,
		FunctionAllowRead,
		FunctionAllowWrite
	)
	SELECT ugf.UserGroupID, nf.FunctionID, ugf.FunctionAllowRead, ugf.FunctionAllowWrite
	FROM UserGroupFunction ugf, SystemFunction nf
	WHERE nf.FunctionCode='PER019'
	AND ugf.FunctionID=(SELECT FunctionID FROM SystemFunction where FunctionCode='PER008')
           

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.2.545'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





