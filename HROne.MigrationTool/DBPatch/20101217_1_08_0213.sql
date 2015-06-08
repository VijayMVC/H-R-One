
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.08.0212' 
BEGIN

	Alter Table PayrollBatch ADD
		PayBatchRemark NTEXT NULL

	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.08.0213'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





