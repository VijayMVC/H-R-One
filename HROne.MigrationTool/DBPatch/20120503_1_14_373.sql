
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.14.370' 
BEGIN

	ALTER TABLE AttendancePlan ADD
		AttendancePlanBonusMaxTotalLateCountIncludeLunch INT NULL,
		AttendancePlanBonusMaxTotalLateMinsIncludeLunch INT NULL,
		AttendancePlanBonusMaxTotalEarlyLeaveCountIncludeLunch INT NULL,
		AttendancePlanBonusMaxTotalEarlyLeaveMinsIncludeLunch INT NULL,
		AttendancePlanBonusPartialPaidMaxTotalLateCountIncludeLunch INT NULL,
		AttendancePlanBonusPartialPaidMaxTotalLateMinsIncludeLunch INT NULL,
		AttendancePlanBonusPartialPaidMaxTotalEarlyLeaveCountIncludeLunch INT NULL,
		AttendancePlanBonusPartialPaidMaxTotalEarlyLeaveMinsIncludeLunch INT NULL


   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.14.373'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





