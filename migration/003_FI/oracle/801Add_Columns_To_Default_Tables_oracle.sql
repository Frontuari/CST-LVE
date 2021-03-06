-- 30/08/2013 11:46:26 AM VET
-- Order Prepay
ALTER TABLE C_Order ADD IsPayScheduleValid CHAR(1) DEFAULT 'N'  CHECK (IsPayScheduleValid IN ('Y','N'))
;

-- Oct 2, 2014 3:07:18 PM VET
-- LVE-OrderPrepaySchedule
ALTER TABLE C_PaymentTerm ADD IsLineAmtBased CHAR(1) DEFAULT 'N' CHECK (IsLineAmtBased IN ('Y','N'))
;


-- 21/07/2014 11:56:00 AM VET
-- LVE-EFT
ALTER TABLE GL_JournalLine MODIFY C_BPartner_ID NUMBER(10) DEFAULT NULL 
;


-- 21/07/2014 11:33:09 AM VET
-- LVE-EFT
ALTER TABLE C_DocType ADD RequestType NVARCHAR2(4) DEFAULT NULL 
;

-- Jul 22, 2014 9:14:33 AM VET
-- LVE EFT
ALTER TABLE C_PaySelectionLine ADD C_Order_ID NUMBER(10) DEFAULT NULL 
;

-- Jul 22, 2014 9:14:43 AM VET
-- LVE EFT
ALTER TABLE C_PaySelectionLine ADD LVE_PaymentRequest_ID NUMBER(10) DEFAULT NULL 
;

-- Jul 22, 2014 11:49:22 AM VET
-- LVE EFT
ALTER TABLE C_PaySelectionLine ADD GL_JournalLine_ID NUMBER(10) DEFAULT NULL 
;

-- Jul 23, 2014 2:13:33 PM VET
-- LVE EFT
ALTER TABLE C_PaySelectionLine MODIFY C_Invoice_ID NUMBER(10) DEFAULT NULL 
;

-- Jul 23, 2014 2:13:33 PM VET
-- LVE EFT
ALTER TABLE C_PaySelectionLine MODIFY C_Invoice_ID NULL
;

-- Oct 14, 2014 3:29:42 PM VET
-- LVE-EFT
ALTER TABLE C_BP_BankAccount ADD IsDefault CHAR(1) DEFAULT 'N' CHECK (IsDefault IN ('Y','N'))
;

-- Oct 14, 2014 3:29:55 PM VET
-- LVE-EFT
ALTER TABLE C_BP_BankAccount ADD PaymentRule CHAR(1) DEFAULT NULL 
;

-- Oct 14, 2014 11:11:18 PM VET
-- LVE-EFT
ALTER TABLE C_PaySelectionLine ADD C_BPartner_ID NUMBER(10) DEFAULT NULL 
;

-- Oct 14, 2014 11:11:48 PM VET
-- LVE-EFT
ALTER TABLE C_PaySelectionLine ADD LVE_PaymentRequestLine_ID NUMBER(10) DEFAULT NULL 
;

-- Oct 14, 2014 11:11:55 PM VET
-- LVE-EFT
ALTER TABLE C_PaySelectionLine ADD RequestType NVARCHAR2(4) DEFAULT NULL 
;

-- Dec 17, 2014 4:12:51 PM VET
-- LVE EFT
ALTER TABLE LVE_PaymentRequestLine ADD IsExceededAmt CHAR(1) DEFAULT 'N' CHECK (IsExceededAmt IN ('Y','N'))
;


