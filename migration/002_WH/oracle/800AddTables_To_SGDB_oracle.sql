-- Apr 2, 2014 11:06:03 AM VET
-- LVE Withholding
CREATE TABLE LVE_PersonType (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, Description NVARCHAR2(255) DEFAULT NULL , IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, LVE_PersonType_ID NUMBER(10) NOT NULL, Name NVARCHAR2(60) NOT NULL, Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, Value NVARCHAR2(60) DEFAULT NULL , CONSTRAINT LVE_PersonType_Key PRIMARY KEY (LVE_PersonType_ID))
;

-- Apr 2, 2014 11:06:17 AM VET
-- LVE Withholding
CREATE TABLE LVE_TaxUnit (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, Description NVARCHAR2(255) DEFAULT NULL , IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, LVE_TaxUnit_ID NUMBER(10) NOT NULL, Name NVARCHAR2(60) NOT NULL, Processing CHAR(1) DEFAULT NULL , TaxAmt NUMBER NOT NULL, Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, ValidFrom DATE NOT NULL, CONSTRAINT LVE_TaxUnit_Key PRIMARY KEY (LVE_TaxUnit_ID))
;

-- Apr 2, 2014 11:06:23 AM VET
-- LVE Withholding
CREATE TABLE LVE_WC_ProductCharge (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, C_Charge_ID NUMBER(10) DEFAULT NULL , Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, LVE_WC_ProductCharge_ID NUMBER(10) NOT NULL, LVE_WH_Concept_ID NUMBER(10) NOT NULL, M_Product_ID NUMBER(10) DEFAULT NULL , Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, CONSTRAINT LVE_WC_ProductCharge_Key PRIMARY KEY (LVE_WC_ProductCharge_ID))
;

-- Apr 2, 2014 11:06:29 AM VET
-- LVE Withholding
CREATE TABLE LVE_WH_Combination (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, Aliquot NUMBER NOT NULL, Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, IsManual CHAR(1) DEFAULT NULL  CHECK (IsManual IN ('Y','N')), LVE_PersonType_ID NUMBER(10) DEFAULT NULL , LVE_WH_Combination_ID NUMBER(10) NOT NULL, LVE_WH_Concept_ID NUMBER(10) NOT NULL, Processing CHAR(1) DEFAULT NULL , TaxBaseRate NUMBER DEFAULT 100, Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, Value NVARCHAR2(60) DEFAULT NULL , CONSTRAINT LVE_WH_Combination_Key PRIMARY KEY (LVE_WH_Combination_ID))
;

-- Apr 2, 2014 11:06:34 AM VET
-- LVE Withholding
CREATE TABLE LVE_WH_Concept (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, Description NVARCHAR2(255) DEFAULT NULL , IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, LVE_WH_ConceptGroup_ID NUMBER(10) DEFAULT NULL , LVE_WH_Concept_ID NUMBER(10) NOT NULL, Name NVARCHAR2(255) NOT NULL, Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, CONSTRAINT LVE_WH_Concept_Key PRIMARY KEY (LVE_WH_Concept_ID))
;

-- Apr 2, 2014 11:06:40 AM VET
-- LVE Withholding
CREATE TABLE LVE_WH_ConceptGroup (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, CopyFrom CHAR(1) DEFAULT NULL , Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, Description NVARCHAR2(255) DEFAULT NULL , IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, LVE_WH_ConceptGroup_ID NUMBER(10) NOT NULL, Name NVARCHAR2(60) NOT NULL, Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, Value NVARCHAR2(60) NOT NULL, CONSTRAINT LVE_WH_ConceptGroup_Key PRIMARY KEY (LVE_WH_ConceptGroup_ID))
;

-- Apr 2, 2014 11:09:56 AM VET
-- LVE Withholding
CREATE TABLE LVE_WH_Config (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, AD_Rule_ID NUMBER(10) DEFAULT NULL , Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, LVE_TaxUnit_ID NUMBER(10) NOT NULL, LVE_WH_Combination_ID NUMBER(10) NOT NULL, LVE_WH_Config_ID NUMBER(10) NOT NULL, LVE_Withholding_ID NUMBER(10) NOT NULL, MaxValue NUMBER NOT NULL, MinValue NUMBER NOT NULL, Subtrahend NUMBER NOT NULL, Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, CONSTRAINT LVE_WH_Config_Key PRIMARY KEY (LVE_WH_Config_ID))
;

-- Apr 2, 2014 11:10:03 AM VET
-- LVE Withholding
CREATE TABLE LVE_WH_Relation (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, C_BPartner_ID NUMBER(10) DEFAULT NULL , C_BP_Group_ID NUMBER(10) DEFAULT NULL , C_DocType_ID NUMBER(10) DEFAULT NULL , Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, LVE_WH_Relation_ID NUMBER(10) NOT NULL, LVE_Withholding_ID NUMBER(10) NOT NULL, ReferenceNo NVARCHAR2(60) DEFAULT NULL , Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, ValidFrom DATE DEFAULT NULL , CONSTRAINT LVE_WH_Relation_Key PRIMARY KEY (LVE_WH_Relation_ID))
;

-- Apr 2, 2014 11:10:09 AM VET
-- LVE Withholding
CREATE TABLE LVE_WH_Type (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, AuthorizedOfficer_ID NUMBER(10) DEFAULT NULL , Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, Description NVARCHAR2(255) DEFAULT NULL , IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, LVE_WH_Type_ID NUMBER(10) NOT NULL, Name NVARCHAR2(60) NOT NULL, Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, Value NVARCHAR2(60) DEFAULT NULL , CONSTRAINT LVE_WH_Type_Key PRIMARY KEY (LVE_WH_Type_ID))
;

-- Apr 2, 2014 11:10:21 AM VET
-- LVE Withholding
CREATE TABLE LVE_WH_UserDocSequence (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, AD_Sequence_ID NUMBER(10) DEFAULT NULL , AD_User_ID NUMBER(10) NOT NULL, C_DocType_ID NUMBER(10) NOT NULL, ControlNoSequence_ID NUMBER(10) DEFAULT NULL , Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, CONSTRAINT LVE_WH_UserDocSequence_Key PRIMARY KEY (AD_User_ID, C_DocType_ID))
;

-- Apr 2, 2014 11:10:27 AM VET
-- LVE Withholding
CREATE TABLE LVE_Withholding (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, AD_ReportView_ID NUMBER(10) DEFAULT NULL , AD_Rule_ID NUMBER(10) DEFAULT NULL , AD_Table_ID NUMBER(10) NOT NULL, Beneficiary_ID NUMBER(10) NOT NULL, C_Charge_ID NUMBER(10) NOT NULL, Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, DeclarationDocType_ID NUMBER(10) NOT NULL, Description NVARCHAR2(255) DEFAULT NULL , IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, IsSOTrx CHAR(1) DEFAULT 'N' CHECK (IsSOTrx IN ('Y','N')), LVE_WH_ConceptGroup_ID NUMBER(10) NOT NULL, LVE_WH_Type_ID NUMBER(10) NOT NULL, LVE_Withholding_ID NUMBER(10) NOT NULL, Name NVARCHAR2(60) NOT NULL, Processing CHAR(1) DEFAULT NULL , SeqNo NUMBER(10) NOT NULL, TaxUnitRate NUMBER NOT NULL, Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, WithholdingDocType_ID NUMBER(10) NOT NULL, CONSTRAINT LVE_Withholding_Key PRIMARY KEY (LVE_Withholding_ID))
;

-- Apr 3, 2014 4:35:34 PM VET
-- LVE Withholding
ALTER TABLE LVE_WH_UserDocSequence ADD IsPrintSetControlNo CHAR(1) DEFAULT 'N' CHECK (IsPrintSetControlNo IN ('Y','N'))
;
