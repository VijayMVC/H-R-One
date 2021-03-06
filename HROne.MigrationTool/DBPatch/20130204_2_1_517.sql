
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.1.516' 
BEGIN

	CREATE TABLE RosterCodeAdditionalPayment
	(
		RosterCodeAdditionalPaymentID INT NOT NULL IDENTITY (1, 1),
		RosterCodeID INT NULL,
		PaymentCodeID INT NULL,
		RosterCodeAdditionalPaymentAmount FLOAT(53) NULL,
		CONSTRAINT PK_RosterCodeAdditionalPayment PRIMARY KEY CLUSTERED 
		(
			RosterCodeAdditionalPaymentID
		) 
	)
           
	CREATE TABLE AttendancePlanAdditionalPayment
	(
		AttendancePlanAdditionalPaymentID INT NOT NULL IDENTITY (1, 1),
		AttendancePlanID INT NULL,
		PaymentCodeID INT NULL,
		AttendancePlanAdditionalPaymentAmount FLOAT(53) NULL,
		CONSTRAINT PK_AttendancePlanAdditionalPayment PRIMARY KEY CLUSTERED 
		(
			AttendancePlanAdditionalPaymentID
		) 
	)
	
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.1.517'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





