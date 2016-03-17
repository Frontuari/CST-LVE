-- 24/09/2013 04:34:10 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Contribute C.A.P.T.A.', PrintName='Contribute C.A.P.T.A.',Updated=TO_TIMESTAMP('2013-09-24 16:34:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=56356
;

-- 24/09/2013 04:34:10 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=56356
;

-- 24/09/2013 04:34:10 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='IsCAPTA', Name='Contribute C.A.P.T.A.', Description=NULL, Help=NULL WHERE AD_Element_ID=56356
;

-- 24/09/2013 04:34:10 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='IsCAPTA', Name='Contribute C.A.P.T.A.', Description=NULL, Help=NULL, AD_Element_ID=56356 WHERE UPPER(ColumnName)='ISCAPTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 24/09/2013 04:34:10 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='IsCAPTA', Name='Contribute C.A.P.T.A.', Description=NULL, Help=NULL WHERE AD_Element_ID=56356 AND IsCentrallyMaintained='Y'
;

-- 24/09/2013 04:34:10 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Contribute C.A.P.T.A.', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=56356) AND IsCentrallyMaintained='Y'
;

-- 24/09/2013 04:34:10 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Contribute C.A.P.T.A.', Name='Contribute C.A.P.T.A.' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=56356)
;

-- 24/09/2013 04:34:25 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET Name='Aporta a C.A.P.T.A.',PrintName='Aporta a C.A.P.T.A.',Updated=TO_TIMESTAMP('2013-09-24 16:34:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=56356 AND AD_Language='es_MX'
;

-- 24/09/2013 04:34:57 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET Name='Plan Crecer',PrintName='Plan Crecer',Updated=TO_TIMESTAMP('2013-09-24 16:34:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=56357 AND AD_Language='es_MX'
;

-- 24/09/2013 04:35:36 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET Name='Sindicalizado',PrintName='Sindicalizado',Updated=TO_TIMESTAMP('2013-09-24 16:35:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=56358 AND AD_Language='es_MX'
;

-- 24/09/2013 04:35:44 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_ELEMENT_TRL (AD_Element_ID, AD_LANGUAGE, AD_Client_ID, AD_Org_ID, IsActive, Created, CreatedBy, Updated, UpdatedBy, Name, PrintName, Description, Help, IsTranslated) SELECT m.AD_Element_ID, l.AD_LANGUAGE, m.AD_Client_ID, m.AD_Org_ID, m.IsActive, m.Created, m.CreatedBy, m.Updated, m.UpdatedBy, m.Name, m.PrintName, m.Description, m.Help, 'N' FROM AD_ELEMENT m, AD_LANGUAGE l WHERE l.IsActive = 'Y' AND l.IsSystemLanguage = 'Y' AND AD_Element_ID || AD_LANGUAGE NOT IN (SELECT AD_Element_ID || AD_LANGUAGE FROM AD_ELEMENT_TRL)
;

-- 24/09/2013 04:35:44 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_COLUMN SET AD_Element_id = (SELECT AD_Element_ID FROM AD_ELEMENT e WHERE UPPER(AD_COLUMN.ColumnName)=UPPER(e.ColumnName)) WHERE AD_Element_ID IS NULL
;

-- 24/09/2013 04:35:44 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
DELETE FROM AD_ELEMENT_TRL WHERE AD_Element_ID IN (SELECT AD_Element_ID FROM AD_ELEMENT e WHERE NOT EXISTS (SELECT 1 FROM AD_COLUMN c WHERE UPPER(e.ColumnName)=UPPER(c.ColumnName)) AND NOT EXISTS (SELECT 1 FROM AD_PROCESS_PARA p WHERE UPPER(e.ColumnName)=UPPER(p.ColumnName)))
;

-- 24/09/2013 04:35:45 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
DELETE FROM AD_ELEMENT WHERE AD_Element_ID >= 1000000 AND NOT EXISTS (SELECT 1 FROM AD_COLUMN c WHERE UPPER(AD_ELEMENT.ColumnName)=UPPER(c.ColumnName)) AND NOT EXISTS (SELECT 1 FROM AD_PROCESS_PARA p WHERE UPPER(AD_ELEMENT.ColumnName)=UPPER(p.ColumnName))
;

-- 24/09/2013 04:35:45 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_COLUMN SET ColumnName=e.ColumnName,Name=e.Name,Description=e.Description,Help=e.Help, Updated = CURRENT_TIMESTAMP FROM AD_ELEMENT e WHERE AD_COLUMN.AD_Element_ID=e.AD_Element_ID AND EXISTS (SELECT 1 FROM AD_ELEMENT e WHERE AD_COLUMN.AD_Element_ID=e.AD_Element_ID AND (AD_COLUMN.ColumnName <> e.ColumnName OR AD_COLUMN.Name <> e.Name OR COALESCE(AD_COLUMN.Description,' ') <> COALESCE(e.Description,' ') OR COALESCE(AD_COLUMN.Help,' ') <> COALESCE(e.Help,' ')))
;

-- 24/09/2013 04:35:45 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_FIELD SET Name=e.Name,Description=e.Description,Help=e.Help, Updated = CURRENT_TIMESTAMP FROM AD_ELEMENT e, AD_COLUMN c WHERE e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=AD_FIELD.AD_Column_ID AND AD_FIELD.IsCentrallyMaintained='Y' AND AD_FIELD.IsActive='Y' AND EXISTS (SELECT 1 FROM AD_ELEMENT e, AD_COLUMN c WHERE AD_FIELD.AD_Column_ID=c.AD_Column_ID AND c.AD_Element_ID=e.AD_Element_ID AND c.AD_Process_ID IS NULL AND (AD_FIELD.Name <> e.Name OR COALESCE(AD_FIELD.Description,' ') <> COALESCE(e.Description,' ') OR COALESCE(AD_FIELD.Help,' ') <> COALESCE(e.Help,' ')))
;

-- 24/09/2013 04:35:45 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_FIELD_TRL SET Name = (SELECT e.Name FROM AD_ELEMENT_TRL e, AD_COLUMN c, AD_FIELD f WHERE e.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID), Description = (SELECT e.Description FROM AD_ELEMENT_TRL e, AD_COLUMN c, AD_FIELD f WHERE e.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID), Help = (SELECT e.Help FROM AD_ELEMENT_TRL e, AD_COLUMN c, AD_FIELD f WHERE e.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID), IsTranslated = (SELECT e.IsTranslated FROM AD_ELEMENT_TRL e, AD_COLUMN c, AD_FIELD f WHERE e.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID), Updated = CURRENT_TIMESTAMP WHERE EXISTS (SELECT 1 FROM AD_FIELD f, AD_ELEMENT_TRL e, AD_COLUMN c WHERE AD_FIELD_TRL.AD_Field_ID=f.AD_Field_ID AND f.AD_Column_ID=c.AD_Column_ID AND c.AD_Element_ID=e.AD_Element_ID AND c.AD_Process_ID IS NULL AND AD_FIELD_TRL.AD_LANGUAGE=e.AD_LANGUAGE AND f.IsCentrallyMaintained='Y' AND f.IsActive='Y' AND (AD_FIELD_TRL.Name <> e.Name OR COALESCE(AD_FIELD_TRL.Description,' ') <> COALESCE(e.Description,' ') OR COALESCE(AD_FIELD_TRL.Help,' ') <> COALESCE(e.Help,' ')))
;

-- 24/09/2013 04:35:45 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_FIELD SET Name = (SELECT e.PO_Name FROM AD_ELEMENT e, AD_COLUMN c WHERE e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=AD_FIELD.AD_Column_ID), Description = (SELECT e.PO_Description FROM AD_ELEMENT e, AD_COLUMN c WHERE e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=AD_FIELD.AD_Column_ID), Help = (SELECT e.PO_Help FROM AD_ELEMENT e, AD_COLUMN c WHERE e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=AD_FIELD.AD_Column_ID), Updated = CURRENT_TIMESTAMP WHERE AD_FIELD.IsCentrallyMaintained='Y' AND AD_FIELD.IsActive='Y' AND EXISTS (SELECT 1 FROM AD_ELEMENT e, AD_COLUMN c WHERE AD_FIELD.AD_Column_ID=c.AD_Column_ID AND c.AD_Element_ID=e.AD_Element_ID AND c.AD_Process_ID IS NULL AND (AD_FIELD.Name <> e.PO_Name OR COALESCE(AD_FIELD.Description,' ') <> COALESCE(e.PO_Description,' ') OR COALESCE(AD_FIELD.Help,' ') <> COALESCE(e.PO_Help,' ')) AND e.PO_Name IS NOT NULL) AND EXISTS (SELECT 1 FROM AD_TAB t, AD_WINDOW w WHERE AD_FIELD.AD_Tab_ID=t.AD_Tab_ID AND t.AD_Window_ID=w.AD_Window_ID AND w.IsSOTrx='N')
;

-- 24/09/2013 04:35:45 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_FIELD_TRL SET Name = (SELECT e.PO_Name FROM AD_ELEMENT_TRL e, AD_COLUMN c, AD_FIELD f WHERE e.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID), Description = (SELECT e.PO_Description FROM AD_ELEMENT_TRL e, AD_COLUMN c, AD_FIELD f WHERE e.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID), Help = (SELECT e.PO_Help FROM AD_ELEMENT_TRL e, AD_COLUMN c, AD_FIELD f WHERE e.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID), IsTranslated = (SELECT e.IsTranslated FROM AD_ELEMENT_TRL e, AD_COLUMN c, AD_FIELD f WHERE e.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID), Updated = CURRENT_TIMESTAMP WHERE EXISTS (SELECT 1 FROM AD_FIELD f, AD_ELEMENT_TRL e, AD_COLUMN c WHERE AD_FIELD_TRL.AD_Field_ID=f.AD_Field_ID AND f.AD_Column_ID=c.AD_Column_ID AND c.AD_Element_ID=e.AD_Element_ID AND c.AD_Process_ID IS NULL AND AD_FIELD_TRL.AD_LANGUAGE=e.AD_LANGUAGE AND f.IsCentrallyMaintained='Y' AND f.IsActive='Y' AND (AD_FIELD_TRL.Name <> e.PO_Name OR COALESCE(AD_FIELD_TRL.Description,' ') <> COALESCE(e.PO_Description,' ') OR COALESCE(AD_FIELD_TRL.Help,' ') <> COALESCE(e.PO_Help,' ')) AND e.PO_Name IS NOT NULL) AND EXISTS (SELECT 1 FROM AD_FIELD f, AD_TAB t, AD_WINDOW w WHERE AD_FIELD_TRL.AD_Field_ID=f.AD_Field_ID AND f.AD_Tab_ID=t.AD_Tab_ID AND t.AD_Window_ID=w.AD_Window_ID AND w.IsSOTrx='N')
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_FIELD SET Name = (SELECT p.Name FROM AD_PROCESS p, AD_COLUMN c WHERE p.AD_Process_ID=c.AD_Process_ID AND c.AD_Column_ID=AD_FIELD.AD_Column_ID), Description = (SELECT p.Description FROM AD_PROCESS p, AD_COLUMN c WHERE p.AD_Process_ID=c.AD_Process_ID AND c.AD_Column_ID=AD_FIELD.AD_Column_ID), Help = (SELECT p.Help FROM AD_PROCESS p, AD_COLUMN c WHERE p.AD_Process_ID=c.AD_Process_ID AND c.AD_Column_ID=AD_FIELD.AD_Column_ID), Updated = CURRENT_TIMESTAMP WHERE AD_FIELD.IsCentrallyMaintained='Y' AND AD_FIELD.IsActive='Y' AND EXISTS (SELECT 1 FROM AD_PROCESS p, AD_COLUMN c WHERE c.AD_Process_ID=p.AD_Process_ID AND AD_FIELD.AD_Column_ID=c.AD_Column_ID AND (AD_FIELD.Name<>p.Name OR COALESCE(AD_FIELD.Description,' ')<>COALESCE(p.Description,' ') OR COALESCE(AD_FIELD.Help,' ')<>COALESCE(p.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_FIELD_TRL SET Name = (SELECT p.Name FROM AD_PROCESS_TRL p, AD_COLUMN c, AD_FIELD f WHERE p.AD_Process_ID=c.AD_Process_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID AND p.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE), Description = (SELECT p.Description FROM AD_PROCESS_TRL p, AD_COLUMN c, AD_FIELD f WHERE p.AD_Process_ID=c.AD_Process_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID AND p.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE), Help = (SELECT p.Help FROM AD_PROCESS_TRL p, AD_COLUMN c, AD_FIELD f WHERE p.AD_Process_ID=c.AD_Process_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID AND p.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE), IsTranslated = (SELECT p.IsTranslated FROM AD_PROCESS_TRL p, AD_COLUMN c, AD_FIELD f WHERE p.AD_Process_ID=c.AD_Process_ID AND c.AD_Column_ID=f.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID AND p.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE), Updated = CURRENT_TIMESTAMP WHERE EXISTS (SELECT 1 FROM AD_PROCESS_TRL p, AD_COLUMN c, AD_FIELD f WHERE c.AD_Process_ID=p.AD_Process_ID AND f.AD_Column_ID=c.AD_Column_ID AND f.AD_Field_ID=AD_FIELD_TRL.AD_Field_ID AND p.AD_LANGUAGE=AD_FIELD_TRL.AD_LANGUAGE AND f.IsCentrallyMaintained='Y' AND f.IsActive='Y' AND (AD_FIELD_TRL.Name<>p.Name OR COALESCE(AD_FIELD_TRL.Description,' ')<>COALESCE(p.Description,' ') OR COALESCE(AD_FIELD_TRL.Help,' ')<>COALESCE(p.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_BROWSE_FIELD SET Name=e.Name,Description=e.Description,Help=e.Help, Updated = CURRENT_TIMESTAMP FROM AD_ELEMENT e WHERE e.AD_Element_ID=AD_BROWSE_FIELD.AD_Element_ID AND AD_BROWSE_FIELD.IsCentrallyMaintained='Y' AND AD_BROWSE_FIELD.IsActive='Y' AND EXISTS (SELECT 1 FROM AD_ELEMENT e WHERE AD_BROWSE_FIELD.AD_Element_ID=e.AD_Element_ID AND (AD_BROWSE_FIELD.Name <> e.Name OR COALESCE(AD_BROWSE_FIELD.Description,' ') <> COALESCE(e.Description,' ') OR COALESCE(AD_BROWSE_FIELD.Help,' ') <> COALESCE(e.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_BROWSE_FIELD_TRL SET Name = (SELECT e.Name FROM AD_ELEMENT_TRL e , AD_BROWSE_FIELD f WHERE e.AD_LANGUAGE=AD_BROWSE_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=f.AD_Element_ID AND f.AD_Browse_Field_ID=AD_BROWSE_FIELD_TRL.AD_Browse_Field_ID), Description = (SELECT e.Description FROM AD_ELEMENT_TRL e, AD_BROWSE_FIELD f WHERE e.AD_LANGUAGE=AD_BROWSE_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=f.AD_Element_ID AND f.AD_Browse_Field_ID=AD_BROWSE_FIELD_TRL.AD_Browse_Field_ID), Help = (SELECT e.Help FROM AD_ELEMENT_TRL e, AD_BROWSE_FIELD f WHERE e.AD_LANGUAGE=AD_BROWSE_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=f.AD_Element_ID AND f.AD_Browse_Field_ID=AD_BROWSE_FIELD_TRL.AD_Browse_Field_ID), IsTranslated = (SELECT e.IsTranslated FROM AD_ELEMENT_TRL e, AD_BROWSE_FIELD f WHERE e.AD_LANGUAGE=AD_BROWSE_FIELD_TRL.AD_LANGUAGE AND e.AD_Element_ID=f.AD_Element_ID AND f.AD_Browse_Field_ID=AD_BROWSE_FIELD_TRL.AD_Browse_Field_ID), Updated = CURRENT_TIMESTAMP WHERE EXISTS (SELECT 1 FROM AD_BROWSE_FIELD f, AD_ELEMENT_TRL e WHERE AD_BROWSE_FIELD_TRL.AD_Browse_Field_ID=f.AD_Browse_Field_ID AND f.AD_Element_ID=e.AD_Element_ID AND AD_BROWSE_FIELD_TRL.AD_LANGUAGE=e.AD_LANGUAGE AND f.IsCentrallyMaintained='Y' AND f.IsActive='Y' AND (AD_BROWSE_FIELD_TRL.Name <> e.Name OR COALESCE(AD_BROWSE_FIELD_TRL.Description,' ') <> COALESCE(e.Description,' ') OR COALESCE(AD_BROWSE_FIELD_TRL.Help,' ') <> COALESCE(e.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PROCESS_PARA SET ColumnName = (SELECT e.ColumnName FROM AD_ELEMENT e WHERE UPPER(e.ColumnName)=UPPER(AD_PROCESS_PARA.ColumnName)) WHERE AD_PROCESS_PARA.IsCentrallyMaintained='Y' AND AD_PROCESS_PARA.IsActive='Y' AND EXISTS (SELECT 1 FROM AD_ELEMENT e WHERE UPPER(e.ColumnName)=UPPER(AD_PROCESS_PARA.ColumnName) AND e.ColumnName<>AD_PROCESS_PARA.ColumnName)
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PROCESS_PARA SET IsCentrallyMaintained = 'N' WHERE IsCentrallyMaintained <> 'N' AND NOT EXISTS (SELECT 1 FROM AD_ELEMENT e WHERE AD_PROCESS_PARA.ColumnName=e.ColumnName)
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PROCESS_PARA SET Name = (SELECT e.Name FROM AD_ELEMENT e WHERE e.ColumnName=AD_PROCESS_PARA.ColumnName), Description = (SELECT e.Description FROM AD_ELEMENT e WHERE e.ColumnName=AD_PROCESS_PARA.ColumnName), Help = (SELECT e.Help FROM AD_ELEMENT e WHERE e.ColumnName=AD_PROCESS_PARA.ColumnName), Updated = CURRENT_TIMESTAMP WHERE AD_PROCESS_PARA.IsCentrallyMaintained='Y' AND AD_PROCESS_PARA.IsActive='Y' AND EXISTS (SELECT 1 FROM AD_ELEMENT e WHERE e.ColumnName=AD_PROCESS_PARA.ColumnName AND (AD_PROCESS_PARA.Name <> e.Name OR COALESCE(AD_PROCESS_PARA.Description,' ') <> COALESCE(e.Description,' ') OR COALESCE(AD_PROCESS_PARA.Help,' ') <> COALESCE(e.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PROCESS_PARA_TRL SET Name = (SELECT et.Name FROM AD_ELEMENT_TRL et, AD_ELEMENT e, AD_PROCESS_PARA f WHERE et.AD_LANGUAGE=AD_PROCESS_PARA_TRL.AD_LANGUAGE AND et.AD_Element_ID=e.AD_Element_ID AND e.ColumnName=f.ColumnName AND f.AD_Process_Para_ID=AD_PROCESS_PARA_TRL.AD_Process_Para_ID), Description = (SELECT et.Description FROM AD_ELEMENT_TRL et, AD_ELEMENT e, AD_PROCESS_PARA f WHERE et.AD_LANGUAGE=AD_PROCESS_PARA_TRL.AD_LANGUAGE AND et.AD_Element_ID=e.AD_Element_ID AND e.ColumnName=f.ColumnName AND f.AD_Process_Para_ID=AD_PROCESS_PARA_TRL.AD_Process_Para_ID), Help = (SELECT et.Help FROM AD_ELEMENT_TRL et, AD_ELEMENT e, AD_PROCESS_PARA f WHERE et.AD_LANGUAGE=AD_PROCESS_PARA_TRL.AD_LANGUAGE AND et.AD_Element_ID=e.AD_Element_ID AND e.ColumnName=f.ColumnName AND f.AD_Process_Para_ID=AD_PROCESS_PARA_TRL.AD_Process_Para_ID), IsTranslated = (SELECT et.IsTranslated FROM AD_ELEMENT_TRL et, AD_ELEMENT e, AD_PROCESS_PARA f WHERE et.AD_LANGUAGE=AD_PROCESS_PARA_TRL.AD_LANGUAGE AND et.AD_Element_ID=e.AD_Element_ID AND e.ColumnName=f.ColumnName AND f.AD_Process_Para_ID=AD_PROCESS_PARA_TRL.AD_Process_Para_ID), Updated = CURRENT_TIMESTAMP WHERE EXISTS (SELECT 1 FROM AD_ELEMENT_TRL et, AD_ELEMENT e, AD_PROCESS_PARA f WHERE et.AD_LANGUAGE=AD_PROCESS_PARA_TRL.AD_LANGUAGE AND et.AD_Element_ID=e.AD_Element_ID AND e.ColumnName=f.ColumnName AND f.AD_Process_Para_ID=AD_PROCESS_PARA_TRL.AD_Process_Para_ID AND f.IsCentrallyMaintained='Y' AND f.IsActive='Y' AND (AD_PROCESS_PARA_TRL.Name <> et.Name OR COALESCE(AD_PROCESS_PARA_TRL.Description,' ') <> COALESCE(et.Description,' ') OR COALESCE(AD_PROCESS_PARA_TRL.Help,' ') <> COALESCE(et.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_WF_NODE SET Name = (SELECT w.Name FROM AD_WINDOW w WHERE w.AD_Window_ID=AD_WF_NODE.AD_Window_ID), Description = (SELECT w.Description FROM AD_WINDOW w WHERE w.AD_Window_ID=AD_WF_NODE.AD_Window_ID), Help = (SELECT w.Help FROM AD_WINDOW w WHERE w.AD_Window_ID=AD_WF_NODE.AD_Window_ID) WHERE AD_WF_NODE.IsCentrallyMaintained = 'Y' AND EXISTS (SELECT 1 FROM AD_WINDOW w WHERE w.AD_Window_ID=AD_WF_NODE.AD_Window_ID AND (w.Name <> AD_WF_NODE.Name OR COALESCE(w.Description,' ') <> COALESCE(AD_WF_NODE.Description,' ') OR COALESCE(w.Help,' ') <> COALESCE(AD_WF_NODE.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_WF_NODE_TRL SET Name = (SELECT t.Name FROM AD_WINDOW_TRL t, AD_WF_NODE n WHERE AD_WF_NODE_TRL.AD_WF_Node_ID=n.AD_WF_Node_ID AND n.AD_Window_ID=t.AD_Window_ID AND AD_WF_NODE_TRL.AD_LANGUAGE=t.AD_LANGUAGE), Description = (SELECT t.Description FROM AD_WINDOW_TRL t, AD_WF_NODE n WHERE AD_WF_NODE_TRL.AD_WF_Node_ID=n.AD_WF_Node_ID AND n.AD_Window_ID=t.AD_Window_ID AND AD_WF_NODE_TRL.AD_LANGUAGE=t.AD_LANGUAGE), Help = (SELECT t.Help FROM AD_WINDOW_TRL t, AD_WF_NODE n WHERE AD_WF_NODE_TRL.AD_WF_Node_ID=n.AD_WF_Node_ID AND n.AD_Window_ID=t.AD_Window_ID AND AD_WF_NODE_TRL.AD_LANGUAGE=t.AD_LANGUAGE) WHERE EXISTS (SELECT 1 FROM AD_WINDOW_TRL t, AD_WF_NODE n WHERE AD_WF_NODE_TRL.AD_WF_Node_ID=n.AD_WF_Node_ID AND n.AD_Window_ID=t.AD_Window_ID AND AD_WF_NODE_TRL.AD_LANGUAGE=t.AD_LANGUAGE AND n.IsCentrallyMaintained='Y' AND n.IsActive='Y' AND (AD_WF_NODE_TRL.Name <> t.Name OR COALESCE(AD_WF_NODE_TRL.Description,' ') <> COALESCE(t.Description,' ') OR COALESCE(AD_WF_NODE_TRL.Help,' ') <> COALESCE(t.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_WF_NODE SET Name=f.Name,Description=f.Description,Help=f.Help FROM AD_FORM f WHERE f.AD_Form_ID=AD_WF_NODE.AD_Form_ID AND AD_WF_NODE.IsCentrallyMaintained = 'Y' AND EXISTS (SELECT 1 FROM AD_FORM f WHERE f.AD_Form_ID=AD_WF_NODE.AD_Form_ID AND (f.Name <> AD_WF_NODE.Name OR COALESCE(f.Description,' ') <> COALESCE(AD_WF_NODE.Description,' ') OR COALESCE(f.Help,' ') <> COALESCE(AD_WF_NODE.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_WF_NODE_TRL SET Name=t.Name,Description=t.Description,Help=t.Help FROM AD_FORM_TRL t, AD_WF_NODE n WHERE AD_WF_NODE_TRL.AD_WF_Node_ID=n.AD_WF_Node_ID AND n.AD_Form_ID=t.AD_Form_ID AND AD_WF_NODE_TRL.AD_LANGUAGE=t.AD_LANGUAGE AND EXISTS (SELECT 1 FROM AD_FORM_TRL t, AD_WF_NODE n WHERE AD_WF_NODE_TRL.AD_WF_Node_ID=n.AD_WF_Node_ID AND n.AD_Form_ID=t.AD_Form_ID AND AD_WF_NODE_TRL.AD_LANGUAGE=t.AD_LANGUAGE AND n.IsCentrallyMaintained='Y' AND n.IsActive='Y' AND (AD_WF_NODE_TRL.Name <> t.Name OR COALESCE(AD_WF_NODE_TRL.Description,' ') <> COALESCE(t.Description,' ') OR COALESCE(AD_WF_NODE_TRL.Help,' ') <> COALESCE(t.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_WF_NODE SET Name=f.Name,Description=f.Description,Help=f.Help FROM AD_PROCESS f WHERE f.AD_Process_ID=AD_WF_NODE.AD_Process_ID AND AD_WF_NODE.IsCentrallyMaintained = 'Y' AND EXISTS (SELECT 1 FROM AD_PROCESS f WHERE f.AD_Process_ID=AD_WF_NODE.AD_Process_ID AND (f.Name <> AD_WF_NODE.Name OR COALESCE(f.Description,' ') <> COALESCE(AD_WF_NODE.Description,' ') OR COALESCE(f.Help,' ') <> COALESCE(AD_WF_NODE.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_WF_NODE_TRL SET Name=t.Name,Description=t.Description,Help=t.Help FROM AD_PROCESS_TRL t, AD_WF_NODE n WHERE AD_WF_NODE_TRL.AD_WF_Node_ID=n.AD_WF_Node_ID AND n.AD_Process_ID=t.AD_Process_ID AND AD_WF_NODE_TRL.AD_LANGUAGE=t.AD_LANGUAGE AND EXISTS (SELECT 1 FROM AD_PROCESS_TRL t, AD_WF_NODE n WHERE AD_WF_NODE_TRL.AD_WF_Node_ID=n.AD_WF_Node_ID AND n.AD_Process_ID=t.AD_Process_ID AND AD_WF_NODE_TRL.AD_LANGUAGE=t.AD_LANGUAGE AND n.IsCentrallyMaintained='Y' AND n.IsActive='Y' AND (AD_WF_NODE_TRL.Name <> t.Name OR COALESCE(AD_WF_NODE_TRL.Description,' ') <> COALESCE(t.Description,' ') OR COALESCE(AD_WF_NODE_TRL.Help,' ') <> COALESCE(t.Help,' ')))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PRINTFORMATITEM SET Name = (SELECT e.Name FROM AD_ELEMENT e, AD_COLUMN c WHERE e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=AD_PRINTFORMATITEM.AD_Column_ID) WHERE AD_PRINTFORMATITEM.IsCentrallyMaintained='Y' AND EXISTS (SELECT 1 FROM AD_ELEMENT e, AD_COLUMN c WHERE e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=AD_PRINTFORMATITEM.AD_Column_ID AND e.Name<>AD_PRINTFORMATITEM.Name) AND EXISTS (SELECT 1 FROM AD_CLIENT WHERE AD_Client_ID=AD_PRINTFORMATITEM.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PRINTFORMATITEM SET PrintName = (SELECT e.PrintName FROM AD_ELEMENT e, AD_COLUMN c WHERE e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=AD_PRINTFORMATITEM.AD_Column_ID) WHERE AD_PRINTFORMATITEM.IsCentrallyMaintained='Y' AND EXISTS (SELECT 1 FROM AD_ELEMENT e, AD_COLUMN c, AD_PRINTFORMAT pf WHERE e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=AD_PRINTFORMATITEM.AD_Column_ID AND LENGTH(AD_PRINTFORMATITEM.PrintName) > 0 AND e.PrintName<>AD_PRINTFORMATITEM.PrintName AND pf.AD_PrintFormat_ID=AD_PRINTFORMATITEM.AD_PrintFormat_ID AND pf.IsForm='N' AND IsTableBased='Y') AND EXISTS (SELECT 1 FROM AD_CLIENT WHERE AD_Client_ID=AD_PRINTFORMATITEM.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PRINTFORMATITEM_TRL SET PrintName = (SELECT e.PrintName FROM AD_ELEMENT_TRL e, AD_COLUMN c, AD_PRINTFORMATITEM pfi WHERE e.AD_LANGUAGE=AD_PRINTFORMATITEM_TRL.AD_LANGUAGE AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=pfi.AD_Column_ID AND pfi.AD_PrintFormatItem_ID=AD_PRINTFORMATITEM_TRL.AD_PrintFormatItem_ID) WHERE EXISTS (SELECT 1 FROM AD_ELEMENT_TRL e, AD_COLUMN c, AD_PRINTFORMATITEM pfi, AD_PRINTFORMAT pf WHERE e.AD_LANGUAGE=AD_PRINTFORMATITEM_TRL.AD_LANGUAGE AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=pfi.AD_Column_ID AND pfi.AD_PrintFormatItem_ID=AD_PRINTFORMATITEM_TRL.AD_PrintFormatItem_ID AND pfi.IsCentrallyMaintained='Y' AND LENGTH(pfi.PrintName) > 0 AND (e.PrintName<>AD_PRINTFORMATITEM_TRL.PrintName OR AD_PRINTFORMATITEM_TRL.PrintName IS NULL) AND pf.AD_PrintFormat_ID=pfi.AD_PrintFormat_ID AND pf.IsForm='N' AND IsTableBased='Y') AND EXISTS (SELECT 1 FROM AD_CLIENT WHERE AD_Client_ID=AD_PRINTFORMATITEM_TRL.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PRINTFORMATITEM_TRL SET PrintName = (SELECT pfi.PrintName FROM AD_PRINTFORMATITEM pfi WHERE pfi.AD_PrintFormatItem_ID=AD_PRINTFORMATITEM_TRL.AD_PrintFormatItem_ID) WHERE EXISTS (SELECT 1 FROM AD_PRINTFORMATITEM pfi, AD_PRINTFORMAT pf WHERE pfi.AD_PrintFormatItem_ID=AD_PRINTFORMATITEM_TRL.AD_PrintFormatItem_ID AND pfi.IsCentrallyMaintained='Y' AND LENGTH(pfi.PrintName) > 0 AND pfi.PrintName<>AD_PRINTFORMATITEM_TRL.PrintName AND pf.AD_PrintFormat_ID=pfi.AD_PrintFormat_ID AND pf.IsForm='N' AND pf.IsTableBased='Y') AND EXISTS (SELECT 1 FROM AD_CLIENT WHERE AD_Client_ID=AD_PRINTFORMATITEM_TRL.AD_Client_ID AND IsMultiLingualDocument='N')
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PRINTFORMATITEM_TRL SET PrintName = NULL WHERE PrintName IS NOT NULL AND EXISTS (SELECT 1 FROM AD_PRINTFORMATITEM pfi WHERE pfi.AD_PrintFormatItem_ID=AD_PRINTFORMATITEM_TRL.AD_PrintFormatItem_ID AND pfi.IsCentrallyMaintained='Y' AND (LENGTH (pfi.PrintName) = 0 OR pfi.PrintName IS NULL))
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_MENU SET Name = (SELECT Name FROM AD_WINDOW w WHERE AD_MENU.AD_Window_ID=w.AD_Window_ID), Description = (SELECT Description FROM AD_WINDOW w WHERE AD_MENU.AD_Window_ID=w.AD_Window_ID) WHERE AD_MENU.AD_Window_ID IS NOT NULL AND AD_MENU."action" = 'W' AND AD_MENU.IsCentrallyMaintained='Y' AND AD_MENU.IsActive='Y'
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_MENU_TRL SET Name = (SELECT wt.Name FROM AD_WINDOW_TRL wt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Window_ID=wt.AD_Window_ID AND AD_MENU_TRL.AD_LANGUAGE=wt.AD_LANGUAGE), Description = (SELECT wt.Description FROM AD_WINDOW_TRL wt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Window_ID=wt.AD_Window_ID AND AD_MENU_TRL.AD_LANGUAGE=wt.AD_LANGUAGE), IsTranslated = (SELECT wt.IsTranslated FROM AD_WINDOW_TRL wt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Window_ID=wt.AD_Window_ID AND AD_MENU_TRL.AD_LANGUAGE=wt.AD_LANGUAGE) WHERE EXISTS (SELECT 1 FROM AD_WINDOW_TRL wt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Window_ID=wt.AD_Window_ID AND AD_MENU_TRL.AD_LANGUAGE=wt.AD_LANGUAGE AND m.AD_Window_ID IS NOT NULL AND m."action" = 'W' AND m.IsCentrallyMaintained='Y' AND m.IsActive='Y')
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_MENU SET Name = (SELECT p.Name FROM AD_PROCESS p WHERE AD_MENU.AD_Process_ID=p.AD_Process_ID), Description = (SELECT p.Description FROM AD_PROCESS p WHERE AD_MENU.AD_Process_ID=p.AD_Process_ID) WHERE AD_MENU.AD_Process_ID IS NOT NULL AND AD_MENU."action" IN ('R', 'P') AND AD_MENU.IsCentrallyMaintained='Y' AND AD_MENU.IsActive='Y'
;

-- 24/09/2013 04:35:46 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_MENU_TRL SET Name = (SELECT pt.Name FROM AD_PROCESS_TRL pt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Process_ID=pt.AD_Process_ID AND AD_MENU_TRL.AD_LANGUAGE=pt.AD_LANGUAGE), Description = (SELECT pt.Description FROM AD_PROCESS_TRL pt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Process_ID=pt.AD_Process_ID AND AD_MENU_TRL.AD_LANGUAGE=pt.AD_LANGUAGE), IsTranslated = (SELECT pt.IsTranslated FROM AD_PROCESS_TRL pt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Process_ID=pt.AD_Process_ID AND AD_MENU_TRL.AD_LANGUAGE=pt.AD_LANGUAGE) WHERE EXISTS (SELECT 1 FROM AD_PROCESS_TRL pt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Process_ID=pt.AD_Process_ID AND AD_MENU_TRL.AD_LANGUAGE=pt.AD_LANGUAGE AND m.AD_Process_ID IS NOT NULL AND m."action" IN ('R', 'P') AND m.IsCentrallyMaintained='Y' AND m.IsActive='Y')
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_MENU SET Name = (SELECT Name FROM AD_FORM f WHERE AD_MENU.AD_Form_ID=f.AD_Form_ID), Description = (SELECT Description FROM AD_FORM f WHERE AD_MENU.AD_Form_ID=f.AD_Form_ID) WHERE AD_MENU.AD_Form_ID IS NOT NULL AND AD_MENU."action" = 'X' AND AD_MENU.IsCentrallyMaintained='Y' AND AD_MENU.IsActive='Y'
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_MENU_TRL SET Name = (SELECT ft.Name FROM AD_FORM_TRL ft, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Form_ID=ft.AD_Form_ID AND AD_MENU_TRL.AD_LANGUAGE=ft.AD_LANGUAGE), Description = (SELECT ft.Description FROM AD_FORM_TRL ft, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Form_ID=ft.AD_Form_ID AND AD_MENU_TRL.AD_LANGUAGE=ft.AD_LANGUAGE), IsTranslated = (SELECT ft.IsTranslated FROM AD_FORM_TRL ft, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Form_ID=ft.AD_Form_ID AND AD_MENU_TRL.AD_LANGUAGE=ft.AD_LANGUAGE) WHERE EXISTS (SELECT 1 FROM AD_FORM_TRL ft, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Form_ID=ft.AD_Form_ID AND AD_MENU_TRL.AD_LANGUAGE=ft.AD_LANGUAGE AND m.AD_Form_ID IS NOT NULL AND m."action" = 'X' AND m.IsCentrallyMaintained='Y' AND m.IsActive='Y')
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_MENU SET Name = (SELECT p.Name FROM AD_WORKFLOW p WHERE AD_MENU.AD_Workflow_ID=p.AD_Workflow_ID), Description = (SELECT p.Description FROM AD_WORKFLOW p WHERE AD_MENU.AD_Workflow_ID=p.AD_Workflow_ID) WHERE AD_MENU.AD_Workflow_ID IS NOT NULL AND AD_MENU."action" = 'F' AND AD_MENU.IsCentrallyMaintained='Y' AND AD_MENU.IsActive='Y'
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_MENU_TRL SET Name = (SELECT pt.Name FROM AD_WORKFLOW_TRL pt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Workflow_ID=pt.AD_Workflow_ID AND AD_MENU_TRL.AD_LANGUAGE=pt.AD_LANGUAGE), Description = (SELECT pt.Description FROM AD_WORKFLOW_TRL pt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Workflow_ID=pt.AD_Workflow_ID AND AD_MENU_TRL.AD_LANGUAGE=pt.AD_LANGUAGE), IsTranslated = (SELECT pt.IsTranslated FROM AD_WORKFLOW_TRL pt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Workflow_ID=pt.AD_Workflow_ID AND AD_MENU_TRL.AD_LANGUAGE=pt.AD_LANGUAGE) WHERE EXISTS (SELECT 1 FROM AD_WORKFLOW_TRL pt, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Workflow_ID=pt.AD_Workflow_ID AND AD_MENU_TRL.AD_LANGUAGE=pt.AD_LANGUAGE AND m.AD_Workflow_ID IS NOT NULL AND m."action" = 'F' AND m.IsCentrallyMaintained='Y' AND m.IsActive='Y')
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_MENU SET Name = (SELECT Name FROM AD_TASK f WHERE AD_MENU.AD_Task_ID=f.AD_Task_ID), Description = (SELECT Description FROM AD_TASK f WHERE AD_MENU.AD_Task_ID=f.AD_Task_ID) WHERE AD_MENU.AD_Task_ID IS NOT NULL AND AD_MENU."action" = 'T' AND AD_MENU.IsCentrallyMaintained='Y' AND AD_MENU.IsActive='Y'
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_MENU_TRL SET Name = (SELECT ft.Name FROM AD_TASK_TRL ft, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Task_ID=ft.AD_Task_ID AND AD_MENU_TRL.AD_LANGUAGE=ft.AD_LANGUAGE), Description = (SELECT ft.Description FROM AD_TASK_TRL ft, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Task_ID=ft.AD_Task_ID AND AD_MENU_TRL.AD_LANGUAGE=ft.AD_LANGUAGE), IsTranslated = (SELECT ft.IsTranslated FROM AD_TASK_TRL ft, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Task_ID=ft.AD_Task_ID AND AD_MENU_TRL.AD_LANGUAGE=ft.AD_LANGUAGE) WHERE EXISTS (SELECT 1 FROM AD_TASK_TRL ft, AD_MENU m WHERE AD_MENU_TRL.AD_Menu_ID=m.AD_Menu_ID AND m.AD_Task_ID=ft.AD_Task_ID AND AD_MENU_TRL.AD_LANGUAGE=ft.AD_LANGUAGE AND m.AD_Task_ID IS NOT NULL AND m."action" = 'T' AND m.IsCentrallyMaintained='Y' AND m.IsActive='Y')
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_COLUMN SET Name=e.Name,Description=e.Description,Help=e.Help FROM AD_ELEMENT e WHERE AD_COLUMN.AD_Element_ID=e.AD_Element_ID AND EXISTS (SELECT 1 FROM AD_ELEMENT e WHERE AD_COLUMN.AD_Element_ID=e.AD_Element_ID AND AD_COLUMN.Name<>e.Name)
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_COLUMN_TRL SET Name = (SELECT e.Name FROM AD_COLUMN c INNER JOIN AD_ELEMENT_TRL e ON (c.AD_Element_ID=e.AD_Element_ID) WHERE AD_COLUMN_TRL.AD_Column_ID=c.AD_Column_ID AND AD_COLUMN_TRL.AD_LANGUAGE=e.AD_LANGUAGE) WHERE EXISTS (SELECT 1 FROM AD_COLUMN c INNER JOIN AD_ELEMENT_TRL e ON (c.AD_Element_ID=e.AD_Element_ID) WHERE AD_COLUMN_TRL.AD_Column_ID=c.AD_Column_ID AND AD_COLUMN_TRL.AD_LANGUAGE=e.AD_LANGUAGE AND AD_COLUMN_TRL.Name<>e.Name)
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TABLE SET Name=e.Name,Description=e.Description FROM AD_ELEMENT e WHERE AD_TABLE.TableName||'_ID'=e.ColumnName AND EXISTS (SELECT 1 FROM AD_ELEMENT e WHERE AD_TABLE.TableName||'_ID'=e.ColumnName AND AD_TABLE.Name<>e.Name)
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TABLE_TRL SET Name = (SELECT e.Name FROM AD_TABLE t INNER JOIN AD_ELEMENT ex ON (t.TableName||'_ID'=ex.ColumnName) INNER JOIN AD_ELEMENT_TRL e ON (ex.AD_Element_ID=e.AD_Element_ID) WHERE AD_TABLE_TRL.AD_Table_ID=t.AD_Table_ID AND AD_TABLE_TRL.AD_LANGUAGE=e.AD_LANGUAGE) WHERE EXISTS (SELECT 1 FROM AD_TABLE t INNER JOIN AD_ELEMENT ex ON (t.TableName||'_ID'=ex.ColumnName) INNER JOIN AD_ELEMENT_TRL e ON (ex.AD_Element_ID=e.AD_Element_ID) WHERE AD_TABLE_TRL.AD_Table_ID=t.AD_Table_ID AND AD_TABLE_TRL.AD_LANGUAGE=e.AD_LANGUAGE AND AD_TABLE_TRL.Name<>e.Name)
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TABLE SET Name=e.Name||' Trl',Description=e.Description FROM AD_ELEMENT e WHERE SUBSTR(AD_TABLE.TableName,1,LENGTH(AD_TABLE.TableName)-4)||'_ID'=e.ColumnName AND AD_TABLE.TableName LIKE '%_Trl' AND EXISTS (SELECT 1 FROM AD_ELEMENT e WHERE SUBSTR(AD_TABLE.TableName,1,LENGTH(AD_TABLE.TableName)-4)||'_ID'=e.ColumnName AND AD_TABLE.Name<>e.Name)
;

-- 24/09/2013 04:35:47 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TABLE_TRL SET Name = (SELECT e.Name || ' **' FROM AD_TABLE t INNER JOIN AD_ELEMENT ex ON (SUBSTR(t.TableName,1,LENGTH(t.TableName)-4)||'_ID'=ex.ColumnName) INNER JOIN AD_ELEMENT_TRL e ON (ex.AD_Element_ID=e.AD_Element_ID) WHERE AD_TABLE_TRL.AD_Table_ID=t.AD_Table_ID AND AD_TABLE_TRL.AD_LANGUAGE=e.AD_LANGUAGE) WHERE EXISTS (SELECT 1 FROM AD_TABLE t INNER JOIN AD_ELEMENT ex ON (SUBSTR(t.TableName,1,LENGTH(t.TableName)-4)||'_ID'=ex.ColumnName) INNER JOIN AD_ELEMENT_TRL e ON (ex.AD_Element_ID=e.AD_Element_ID) WHERE AD_TABLE_TRL.AD_Table_ID=t.AD_Table_ID AND AD_TABLE_TRL.AD_LANGUAGE=e.AD_LANGUAGE AND t.TableName LIKE '%_Trl' AND AD_TABLE_TRL.Name<>e.Name)
;

-- 24/09/2013 04:46:04 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Val_Rule (AD_Client_ID,AD_Org_ID,AD_Val_Rule_ID,Code,Created,CreatedBy,EntityType,IsActive,Name,Type,Updated,UpdatedBy) VALUES (0,0,52213,'HR_Process.DocStatus <> ''VO''',TO_TIMESTAMP('2013-09-24 16:46:01','YYYY-MM-DD HH24:MI:SS'),100,'ECA02','Y','HR_Process not Anuled','S',TO_TIMESTAMP('2013-09-24 16:46:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/09/2013 04:46:21 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET AD_Val_Rule_ID=52213,Updated=TO_TIMESTAMP('2013-09-24 16:46:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=53963
;

