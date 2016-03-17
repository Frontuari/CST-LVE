-- 17/07/2014 12:09:52 PM VET
-- LVE EFT
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,183,54431,TO_DATE('2014-07-17 12:09:46','YYYY-MM-DD HH24:MI:SS'),100,'ECA02','Y','Payment Request',TO_DATE('2014-07-17 12:09:46','YYYY-MM-DD HH24:MI:SS'),100,'PRQ')
;

-- 17/07/2014 12:09:52 PM VET
-- LVE EFT
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=54431 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 17/07/2014 12:10:15 PM VET
-- LVE EFT
UPDATE AD_Ref_List_Trl SET Name='Orden de Pago',Updated=TO_DATE('2014-07-17 12:10:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=54431 AND AD_Language='es_MX'
;

-- 17/07/2014 12:17:03 PM VET
-- LVE EFT
INSERT INTO AD_Val_Rule (AD_Client_ID,AD_Org_ID,AD_Val_Rule_ID,Code,Created,CreatedBy,EntityType,IsActive,Name,Type,Updated,UpdatedBy) VALUES (0,0,52376,'C_DocType.DocBaseType = ''''',TO_DATE('2014-07-17 12:16:59','YYYY-MM-DD HH24:MI:SS'),100,'ECA02','Y','Validation Document Type','S',TO_DATE('2014-07-17 12:16:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/07/2014 12:17:14 PM VET
-- LVE EFT
UPDATE AD_Val_Rule SET Code='C_DocType.DocBaseType = ''PRQ''',Updated=TO_DATE('2014-07-17 12:17:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=52376
;

-- 17/07/2014 12:17:24 PM VET
-- LVE EFT
UPDATE AD_Column SET AD_Val_Rule_ID=52376,Updated=TO_DATE('2014-07-17 12:17:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=73325
;

-- 17/07/2014 12:18:43 PM VET
-- LVE EFT
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2014-07-17 12:18:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73976
;

-- 17/07/2014 12:19:34 PM VET
-- LVE EFT
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2014-07-17 12:19:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73970
;

-- 17/07/2014 12:19:42 PM VET
-- LVE EFT
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2014-07-17 12:19:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73970
;

-- 17/07/2014 12:19:48 PM VET
-- LVE EFT
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2014-07-17 12:19:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73967
;

-- 17/07/2014 12:19:58 PM VET
-- LVE EFT
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2014-07-17 12:19:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73962
;

-- 17/07/2014 12:20:05 PM VET
-- LVE EFT
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2014-07-17 12:20:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73962
;

-- 17/07/2014 12:20:11 PM VET
-- LVE EFT
UPDATE AD_Field SET IsDisplayed='Y', SeqNo=150,Updated=TO_DATE('2014-07-17 12:20:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73974
;

-- 17/07/2014 12:20:11 PM VET
-- LVE EFT
UPDATE AD_Field SET IsDisplayed='Y', SeqNo=160,Updated=TO_DATE('2014-07-17 12:20:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73962
;

-- 17/07/2014 12:20:33 PM VET
-- LVE EFT
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2014-07-17 12:20:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73973
;

-- 17/07/2014 12:20:43 PM VET
-- LVE EFT
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2014-07-17 12:20:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73974
;

-- 17/07/2014 12:20:49 PM VET
-- LVE EFT
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2014-07-17 12:20:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73962
;

-- 17/07/2014 12:21:46 PM VET
-- LVE EFT
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2014-07-17 12:21:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73979
;

-- 17/07/2014 12:21:53 PM VET
-- LVE EFT
UPDATE AD_Field SET IsReadOnly='N',Updated=TO_DATE('2014-07-17 12:21:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=73979
;

-- 17/07/2014 12:22:14 PM VET
-- LVE EFT
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2014-07-17 12:22:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=73325
;

-- 17/07/2014 12:24:00 PM VET
-- LVE EFT
UPDATE AD_Field SET EntityType='ECA02',Updated=TO_DATE('2014-07-17 12:24:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=74022
;

-- 17/07/2014 12:24:06 PM VET
-- LVE EFT
UPDATE AD_Field SET EntityType='ECA02',Updated=TO_DATE('2014-07-17 12:24:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=74028
;

-- 17/07/2014 12:24:18 PM VET
-- LVE EFT
UPDATE AD_Field SET EntityType='ECA02',Updated=TO_DATE('2014-07-17 12:24:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=74025
;

-- 17/07/2014 12:24:23 PM VET
-- LVE EFT
UPDATE AD_Field SET EntityType='ECA02',Updated=TO_DATE('2014-07-17 12:24:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=74030
;

-- 17/07/2014 12:24:27 PM VET
-- LVE EFT
UPDATE AD_Field SET EntityType='ECA02',Updated=TO_DATE('2014-07-17 12:24:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=74021
;

-- 17/07/2014 12:24:32 PM VET
-- LVE EFT
UPDATE AD_Field SET EntityType='ECA02',Updated=TO_DATE('2014-07-17 12:24:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=74031
;

-- 17/07/2014 12:24:35 PM VET
-- LVE EFT
UPDATE AD_Field SET EntityType='ECA02',Updated=TO_DATE('2014-07-17 12:24:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=74029
;

-- 17/07/2014 12:24:37 PM VET
-- LVE EFT
UPDATE AD_Field SET EntityType='ECA02',Updated=TO_DATE('2014-07-17 12:24:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=74024
;

-- 17/07/2014 12:24:39 PM VET
-- LVE EFT
UPDATE AD_Field SET EntityType='ECA02',Updated=TO_DATE('2014-07-17 12:24:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=74027
;

-- 17/07/2014 12:24:41 PM VET
-- LVE EFT
UPDATE AD_Field SET EntityType='ECA02',Updated=TO_DATE('2014-07-17 12:24:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=74023
;

-- 17/07/2014 12:24:46 PM VET
-- LVE EFT
UPDATE AD_Field SET EntityType='ECA02',Updated=TO_DATE('2014-07-17 12:24:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=74032
;

