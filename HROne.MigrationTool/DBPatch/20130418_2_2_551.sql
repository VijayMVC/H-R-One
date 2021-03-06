
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.2.545' 
BEGIN

	ALTER TABLE EmpPersonalInfo ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL
		
	ALTER TABLE EmpPositionInfo ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL
				
	ALTER TABLE EmpRecurringPayment ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL
		
	ALTER TABLE EmpTermination ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.2.551'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





