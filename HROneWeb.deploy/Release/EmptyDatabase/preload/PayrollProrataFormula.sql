SET IDENTITY_INSERT PayrollProrataFormula On

INSERT INTO [PayrollProrataFormula] ([PayFormID],[PayFormCode],[PayFormDesc],[PayFormPaymentType],[PayFormMultiplier],[PayFormDivider],[PayFormIsSys],[ReferencePayFormID],[PayFormDecimalPlace],[PayFormRoundingRule])VALUES(1,'SYS001','Payment within Payroll Cycle / (Calendar day within Payroll Cycle)',NULL,NULL,NULL,'Y',NULL,NULL,'NOROUND')
INSERT INTO [PayrollProrataFormula] ([PayFormID],[PayFormCode],[PayFormDesc],[PayFormPaymentType],[PayFormMultiplier],[PayFormDivider],[PayFormIsSys],[ReferencePayFormID],[PayFormDecimalPlace],[PayFormRoundingRule])VALUES(2,'SYS002','Yearly / 365',NULL,NULL,NULL,'Y',NULL,NULL,'NOROUND')
INSERT INTO [PayrollProrataFormula] ([PayFormID],[PayFormCode],[PayFormDesc],[PayFormPaymentType],[PayFormMultiplier],[PayFormDivider],[PayFormIsSys],[ReferencePayFormID],[PayFormDecimalPlace],[PayFormRoundingRule])VALUES(3,'SYS003','Monthly / Calendar day per month',NULL,NULL,NULL,'Y',NULL,NULL,'NOROUND')
INSERT INTO [PayrollProrataFormula] ([PayFormID],[PayFormCode],[PayFormDesc],[PayFormPaymentType],[PayFormMultiplier],[PayFormDivider],[PayFormIsSys],[ReferencePayFormID],[PayFormDecimalPlace],[PayFormRoundingRule])VALUES(4,'DAW','Daily Average Wage',NULL,NULL,NULL,'Y',NULL,NULL,'NOROUND')
INSERT INTO [PayrollProrataFormula] ([PayFormID],[PayFormCode],[PayFormDesc],[PayFormPaymentType],[PayFormMultiplier],[PayFormDivider],[PayFormIsSys],[ReferencePayFormID],[PayFormDecimalPlace],[PayFormRoundingRule])VALUES(5,'<DEFAULT>','<Use Default Formula>',NULL,NULL,NULL,'Y',NULL,NULL,NULL)
INSERT INTO [PayrollProrataFormula] ([PayFormID],[PayFormCode],[PayFormDesc],[PayFormPaymentType],[PayFormMultiplier],[PayFormDivider],[PayFormIsSys],[ReferencePayFormID],[PayFormDecimalPlace],[PayFormRoundingRule])VALUES(6,'SYS004','Payment within Payroll Cycle / ([Calendar Days - Rest Days] within Payroll Cycle)',NULL,NULL,NULL,'Y',NULL,NULL,NULL)

SET IDENTITY_INSERT PayrollProrataFormula OFF