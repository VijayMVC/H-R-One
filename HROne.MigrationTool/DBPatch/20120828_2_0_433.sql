
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.0.430' 
BEGIN

	INSERT INTO BankList
           (BankCode
           ,BankName)
     VALUES
           ('033','BANK OF CHINA (HONG KONG) LIMITED')
           
	INSERT INTO BankList
           (BankCode
           ,BankName)
     VALUES
           ('070','BANK OF CHINA (HONG KONG) LIMITED')
           
	INSERT INTO BankList
           (BankCode
           ,BankName)
     VALUES
           ('064','BANK OF CHINA (HONG KONG) LIMITED')           
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.0.433'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





