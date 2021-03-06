
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.11.0259' 
BEGIN

	CREATE TABLE CompensationLeaveEntitle
	(
		CompensationLeaveEntitleID int NOT NULL IDENTITY (1, 1),
		EmpID int NULL,
		CompensationLeaveEntitleEffectiveDate datetime NULL,
		CompensationLeaveEntitleClaimPeriodFrom datetime NULL,
		CompensationLeaveEntitleClaimPeriodTo datetime NULL,
		CompensationLeaveEntitleClaimHourFrom datetime NULL,
		CompensationLeaveEntitleClaimHourTo datetime NULL,
		CompensationLeaveEntitleHoursClaim FLOAT(53) NULL,
		CompensationLeaveEntitleApprovedBy NVARCHAR(255) NULL,
		CompensationLeaveEntitleRemark NTEXT NULL,
		CONSTRAINT PK_CompensationLeaveEntitle PRIMARY KEY CLUSTERED 
		(
			CompensationLeaveEntitleID
		) 
	)

	ALTER TABLE LeaveApplication 
		ADD LeaveAppHours FLOAT(53) NULL
		
	ALTER TABLE RequestLeaveApplication 
		ADD RequestLeaveAppHours FLOAT(53) NULL

	INSERT INTO LEAVETYPE
		(LeaveType,LeaveTypeDesc,LeaveDecimalPlace,LeaveSystemUse)
	Values
		('COMPENSATION','Compensation Leave',2,1)	
		
	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('PER018','Employee Compensation Leave Entitlement', 'Personnel', 0)

		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.12.0271'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





