
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.3.576' 
BEGIN
	
	DELETE FROM LeaveBalance
	WHERE LeaveTypeID=(select leavetypeid from leavetype where leavetype='COMPENSATION')

	DELETE FROM LeaveBalanceEntitle
	WHERE LeaveTypeID=(select leavetypeid from leavetype where leavetype='COMPENSATION')

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.3.577'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





