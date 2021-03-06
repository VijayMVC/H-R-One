
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.08.0219' 
BEGIN

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT101','Employee List', 'Personnel Reports', 0)
	
	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT102','Employee Contact Report', 'Personnel Reports', 0)
		
	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT103','Employee Salary List', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT104','Employee Year of Service List', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT105','Employee Bank Account List', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT106','Employee Details Report', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT107','Employee Head Count Report', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT108','Employee Gender Report', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT109','Employee Residency Report', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT110','Employee Birthday List', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT111','Employee Termination List', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT131','Employee Leave Application List', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT132','Leave Summary Report', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT133','Leave Balance List', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT151','ESS Pending Request Report', 'Personnel Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT201','Payroll Detail Report', 'Payroll & MPF Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT202','Payroll Summary Report', 'Payroll & MPF Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT203','Employee Daily Average Wages Report', 'Payroll & MPF Reports', 0)
           
	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT204','Employee Overall Payment Summary', 'Payroll & MPF Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT205','Pay Slip Report', 'Payroll & MPF Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT206','Payroll Discrepancy List', 'Payroll & MPF Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT207','Net Payment Report by Payment Method', 'Payroll & MPF Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT208','Payment Summary List', 'Payroll & MPF Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT209','Payment Allocation Report', 'Payroll & MPF Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT251','MPF Details List', 'Payroll & MPF Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT252','MPF Remittance Statement', 'Payroll & MPF Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT253','P-Fund Report', 'Payroll & MPF Reports', 0)

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('RPT300','Taxation Report', 'Taxation Reports', 0)
           
	UPDATE SystemFunction
	SET FunctionIsHidden=1
	WHERE FunctionCode='RPT001'
	OR FunctionCode='RPT002'
	OR FunctionCode='RPT003'
	
	INSERT INTO UserGroupFunction
	(UserGroupID, FunctionID, FunctionAllowRead, FunctionAllowWrite)
	SELECT a.UserGroupID, b.FunctionID, a.FunctionAllowRead, a.FunctionAllowWrite
	FROM UserGroupFunction a, SystemFunction aa, SystemFunction b
	WHERE a.FunctionID=aa.FunctionID AND aa.FunctionCode='RPT001'
	AND b.FunctionCode like 'RPT1__'
	
	INSERT INTO UserGroupFunction
	(UserGroupID, FunctionID, FunctionAllowRead, FunctionAllowWrite)
	SELECT a.UserGroupID, b.FunctionID, a.FunctionAllowRead, a.FunctionAllowWrite
	FROM UserGroupFunction a, SystemFunction aa, SystemFunction b
	WHERE a.FunctionID=aa.FunctionID AND aa.FunctionCode='RPT002'
	AND b.FunctionCode like 'RPT2__'

	INSERT INTO UserGroupFunction
	(UserGroupID, FunctionID, FunctionAllowRead, FunctionAllowWrite)
	SELECT a.UserGroupID, b.FunctionID, a.FunctionAllowRead, a.FunctionAllowWrite
	FROM UserGroupFunction a, SystemFunction aa, SystemFunction b
	WHERE a.FunctionID=aa.FunctionID AND aa.FunctionCode='RPT003'
	AND b.FunctionCode like 'RPT3__'

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.09.0220'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





