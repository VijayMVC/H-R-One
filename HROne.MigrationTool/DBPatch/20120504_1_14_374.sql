
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.14.373' 
BEGIN

	CREATE INDEX IDX_ClaimsAndDeductions_EmpID ON ClaimsAndDeductions 
	(
		EmpID
	)

	CREATE INDEX IDX_ClaimsAndDeductions_CNDImportBatchID ON ClaimsAndDeductions 
	(
		CNDImportBatchID
	)

	CREATE INDEX IDX_ClaimsAndDeductions_EmpPayrollID ON ClaimsAndDeductions 
	(
		EmpPayrollID
	)

	CREATE INDEX IDX_ClaimsAndDeductions_PayRecID ON ClaimsAndDeductions 
	(
		PayRecID
	)

	CREATE INDEX IDX_LeaveApplication_EmpID ON LeaveApplication 
	(
		EmpID
	)

	CREATE INDEX IDX_LeaveApplication_LeaveCodeID ON LeaveApplication 
	(
		LeaveCodeID
	)

	CREATE INDEX IDX_LeaveApplication_EmpPayrollID ON LeaveApplication 
	(
		EmpPayrollID
	)

	CREATE INDEX IDX_LeaveApplication_EmpPaymentID ON LeaveApplication 
	(
		EmpPaymentID
	)

	ALTER TABLE AttendanceRecord ADD
		AttendanceRecordWorkStartTimeCardRecordID INT NULL,
		AttendanceRecordWorkEndTimeCardRecordID INT NULL,
		AttendanceRecordLunchOutTimeCardRecordID INT NULL,
		AttendanceRecordLunchInTimeCardRecordID INT NULL
	
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.14.374'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





