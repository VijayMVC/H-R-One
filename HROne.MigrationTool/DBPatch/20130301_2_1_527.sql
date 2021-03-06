
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.1.526' 
BEGIN

	UPDATE LeaveCode
	SET LeaveCodeIsShowMedicalCertOption=1
	WHERE LeaveCodeIsShowMedicalCertOption IS NULL
	
	UPDATE LeaveCode
	SET LeaveCodeIsShowMedicalCertOption=0
	WHERE LeaveTypeID in 
	(
		SELECT LeaveTypeID 
		FROM LeaveType
		whERE LeaveType in ('ANNUAL', 'COMPENSATION', 'REST', 'STATUTORYHOLIDAY')
	)

	INSERT INTO LEAVETYPE
		(LeaveType,LeaveTypeDesc,LeaveDecimalPlace,LeaveSystemUse)
	Values
		('BIRTHDAY','Birthday Leave',2,1)	
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.1.527'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





