-- Aug 7, 2014 2:56:15 PM UTC
-- LVE HR
UPDATE AD_Column SET DefaultValue='0',Updated=TO_DATE('2014-08-07 14:56:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=71488
;

-- Aug 7, 2014 2:57:25 PM UTC
-- LVE HR
UPDATE AD_Tab SET WhereClause=NULL,Updated=TO_DATE('2014-08-07 14:57:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=226
;

-- Aug 7, 2014 3:32:03 PM UTC
-- LVE HR
INSERT INTO AD_TreeBar (AD_Tree_ID,AD_User_ID,Node_ID, AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy)VALUES (10,100,201,0,0,'Y',SysDate,100,SysDate,100)
;

-- Aug 7, 2014 3:37:22 PM UTC
-- LVE HR
INSERT INTO AD_ReportView (AD_Client_ID,AD_Org_ID,AD_ReportView_ID,AD_Table_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,WhereClause) VALUES (0,0,53138,53596,TO_DATE('2014-08-07 15:36:40','YYYY-MM-DD HH24:MI:SS'),100,'ECA02','Y','LVE_RV_HR_Employee In Concept Value ''F_SD'',''F_AE''',TO_DATE('2014-08-07 15:36:40','YYYY-MM-DD HH24:MI:SS'),100,'LVE_RV_HR_Employee.Value IN(''F_SD'',''F_AE'')')
;

-- Aug 7, 2014 3:50:26 PM UTC
-- LVE HR
UPDATE AD_Process SET AD_ReportView_ID=53138,Updated=TO_DATE('2014-08-07 15:50:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=53471
;
