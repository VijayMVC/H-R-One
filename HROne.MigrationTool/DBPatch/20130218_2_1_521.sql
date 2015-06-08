
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.1.520' 
BEGIN
           
	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('ECH003','e-channel Signature Setup', 'e-channel', 0)
           			
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.1.521'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





