/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * Copyright (C) 2003-2014 E.R.P. Consultores y Asociados, C.A.               *
 * All Rights Reserved.                                                       *
 * Contributor(s): Yamel Senih www.erpconsultoresyasociados.com               *
 *****************************************************************************/
package org.spin.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.logging.Level;

import org.compiere.model.MBPartner;
import org.compiere.model.MClientInfo;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.eevolution.model.MHREmployee;
import org.spin.model.MLVEHRProcessReport;
import org.spin.model.MLVERVHRProcessDetail;

/**
 * @author <a href="mailto:yamelsenih@gmail.com">Yamel Senih</a>
 * Export class for BANAVIH in payroll
 */
public class BHR_ProvincialBenefits implements HRReportExport {
	/** Logger										*/
	static private CLogger	s_log = CLogger.getCLogger (BHR_ProvincialBenefits.class);
	/** BPartner Info Index for Nationality	    	*/
	private static final int     BP_NATIONALITY 	= 0;
	/** BPartner Info Index for Tax ID		    	*/
	private static final int     BP_TAX_ID 			= 1;
	/** BPartner Info Index for First Name 1    	*/
	private static final int     BP_FIRST_NAME 	= 2;
	/** BPartner Info Index for First Name 1    	*/
	private static final int     BP_LAST_NAME 	= 4;
	/** BPartner Info Index for Employee Start Date	*/
	private static final int     EM_MARITAL_STATUS 	= 6;
	/** BPartner Info Index for Employee End Date	*/
	private static final int     EM_ACCOUNT_NO 		= 7;
	
	/**	Constant Payroll						*/
	private final String		PAYROLL_CONSTANT_1	= "C";
	/**	Constant Payroll						*/
	private final String		PAYROLL_CONSTANT_2	= " ";
	/**	Constant Payroll						*/
	private final String		PAYROLL_CONSTANT_3	= "000";
	
	/**	Constant Payroll						*/
	private final String		PAYROLL_CONSTANT	= "F";
	/**	File Extension							*/
	private final String		FILE_EXTENSION		= ".txt";
	/**	Separator								*/
	private final String 		SEPARATOR 			= " ";
	/**	Number Format							*/
	private DecimalFormat 		m_NumberFormat 	= null;
	/**	Date Format for Process					*/
	private SimpleDateFormat 	m_ProcessDateFormat = null;
	/**	Current Amount							*/
	private BigDecimal 			m_CurrentAmt		= null;
	/**	Current Process Report Line				*/
	private MLVERVHRProcessDetail 	m_Current_Pdl 	= null;
	/**	File Writer								*/
	private FileWriter 				m_FileWriter	= null;
	/**	Number Lines							*/
	private int 					m_NoLines 		= 0;
	/** Name File								*/
	private String 					m_NameFile		= null; 
	
	
	@Override
	public int exportToFile(MLVERVHRProcessDetail[] details, File file, StringBuffer err) {
		if (details == null || details.length == 0)
			return 0;
		MLVERVHRProcessDetail pdl = details[0];
		//  delete if exists
		try {
			//	Set new File Name
			StringBuffer pathName = new StringBuffer(file.isFile() || !file.exists()
												? file.getParent()
														: file.getAbsolutePath());
			//	Get Client account
			MClientInfo clientInfo = MClientInfo.get(Env.getCtx(), pdl.getAD_Client_ID());
			//	Suffix
			MLVEHRProcessReport pr = (MLVEHRProcessReport) pdl.getLVE_HR_ProcessReport();
			String m_Suffix = null;
			if(pr != null)
				m_Suffix = pr.getPrintName();
			//	Add Separator
			pathName.append(File.separator)
				//	
				.append(PAYROLL_CONSTANT)
				//	Payroll Account
				.append(clientInfo.get_ValueAsString("CB_Code") == null? "": clientInfo.get_ValueAsString("CB_Code").trim())
				//	Accounting Date in format MM YYYY
				.append(new SimpleDateFormat("yyyyMM").format(pdl.getDateAcct()))
				//	Suffix
				.append(m_Suffix != null? m_Suffix.trim(): "")
				//	Extension
				.append(FILE_EXTENSION);
			
			file = new File(pathName.toString());
			//	Delete if Exists
			if (file.exists())
				file.delete();
		} catch (Exception e) {
			s_log.log(Level.WARNING, "Could not delete - " + file.getAbsolutePath(), e);
		}
		//	Number Format
		m_NumberFormat = new DecimalFormat("0000000000000.00");
		m_ProcessDateFormat = new SimpleDateFormat("MMyyyy");
		//	Current Business Partner
		int m_Current_BPartner_ID = 0;
		//	Current Month
		String m_CurrentMonth = null;
		//	
		try {
			//	
			m_FileWriter = new FileWriter(file);
			//  write header
			m_NoLines ++;
			//  write lines
			for (int i = 0; i < details.length; i++) {
				pdl = details[i];
				if (pdl == null)
					continue;
				//	Verify Current Business Partner and Month
				if(m_Current_BPartner_ID != pdl.getC_BPartner_ID()) {
					writeLine();
					m_Current_BPartner_ID = pdl.getC_BPartner_ID();
					m_CurrentMonth = m_ProcessDateFormat.format(pdl.getDateAcct());
					m_CurrentAmt = pdl.getAmt();
					m_Current_Pdl = pdl;
				} else if(m_CurrentMonth != null
						&& m_CurrentMonth.equals(m_ProcessDateFormat.format(pdl.getDateAcct()))) {
					m_CurrentAmt = m_CurrentAmt.add(pdl.getAmt());
				}
			}   
			//  write last line
			writeLine();
			//	Close
			m_FileWriter.flush();
			m_FileWriter.close();
			
			// Raul Munoz set Name file for zk 
			m_NameFile = file.getName();
			
		} catch (Exception e) {
			err.append(e.toString());
			s_log.log(Level.SEVERE, "", e);
			return -1;
		}
		//
		return m_NoLines;
	}
	
	/**
	 * Write Line
	 * @author <a href="mailto:yamelsenih@gmail.com">Yamel Senih</a> 8/12/2014, 15:08:36
	 * @return void
	 * @throws IOException 
	 */
	private void writeLine() throws IOException {
		//	Valid Null Value
		if(m_Current_Pdl == null)
			return;
		//	Process Business Partner
		String [] bpInfo = processBPartner(m_Current_Pdl.getC_BPartner_ID(), 
				m_Current_Pdl.getAD_Org_ID(), m_Current_Pdl.get_TrxName());
		//	Line
		StringBuffer line = new StringBuffer();
		//	Amount
		if(m_CurrentAmt == null)
			m_CurrentAmt = Env.ZERO;
		//	New Line
		if(m_NoLines > 1)
			line.append(Env.NL);
		//	Nationality
		line.append(bpInfo[BP_NATIONALITY])
		//	Tax ID
		.append(String.format("%1$" + 10 + "s", bpInfo[BP_TAX_ID]).replace(" ", "0"))
		.append(SEPARATOR)
		//	Amount
		.append(m_NumberFormat.format(m_CurrentAmt.doubleValue())
											.toString()
											.replace(",", ".")
											.replace(".", ""))
		.append(SEPARATOR)
		//	Constant 1
		.append(PAYROLL_CONSTANT_1)
		//	Constant 2
		.append(PAYROLL_CONSTANT_2)
		.append(SEPARATOR)
		//	Constant 3
		.append(PAYROLL_CONSTANT_3)
		.append(SEPARATOR)
		//	Account No
		.append(String.format("%1$" + 20 + "s", bpInfo[EM_ACCOUNT_NO]).replace(" ", "0"))
		.append(SEPARATOR)
		//	First Name 1
		.append(String.format("%1$-" + 20 + "s", bpInfo[BP_FIRST_NAME]))
		.append(SEPARATOR)
		//	Last Name 1
		.append(String.format("%1$-" + 20 + "s", bpInfo[BP_LAST_NAME]))
		.append(SEPARATOR)
		.append(SEPARATOR)
		.append(SEPARATOR)
		//	BParner Marital Status
		.append(bpInfo[EM_MARITAL_STATUS])
		;
		//	Write Line
		m_FileWriter.write(line.toString());
		m_NoLines ++;
	}
	
	/**
	 * Process Business Partner
	 * @author <a href="mailto:yamelsenih@gmail.com">Yamel Senih</a> 16/08/2014, 12:27:09
	 * @param p_C_BPartner_ID
	 * @param p_AD_Org_ID
	 * @param p_TrxName
	 * @return String []
	 */
	private String [] processBPartner(int p_C_BPartner_ID, int p_AD_Org_ID, String p_TrxName) {
		String [] bpInfo = new String[8];
		//	
		//	Get Business Partner
		MBPartner bpartner = MBPartner.get(Env.getCtx(), p_C_BPartner_ID);
		//	Get Name
		String name = bpartner.getName();
		String name2 = bpartner.getName2();
		//	Valid Null
		if(name == null)
			name = "";
		if(name2 == null)
			name2 = "";
		//	End Index for First Name
		int endIndex = name.indexOf(" ");
		if(endIndex < 0)
			endIndex = name.length();
		//	Extract First Name 1
		String m_FirstName1 = name.substring(0, endIndex);
		//	Extract First Name 2
		String m_FirstName2 = ((endIndex + 1) > name.length()
										? " "
										: name.substring(endIndex + 1));
		endIndex = m_FirstName2.indexOf(" ");
		//	Cut First Name 2
		if(endIndex < 0)
			endIndex = m_FirstName2.length();
		m_FirstName2 = m_FirstName2.substring(0, endIndex);
		//	End Index for Last Name
		endIndex = name2.indexOf(" ");
		if(endIndex < 0)
			endIndex = name2.length();
		//	Extract Last Name 1
		String m_LastName1 = name2.substring(0, endIndex);
		//	Extract Last Name 2
		String m_LastName2 = ((endIndex + 1) > name2.length()
										? " "
										: name2.substring(endIndex + 1));
		endIndex = m_LastName2.indexOf(" ");
		//	Cut Last Name 2
		if(endIndex < 0)
			endIndex = m_LastName2.length();
		m_LastName2 = m_LastName2.substring(0, endIndex);
		//	Valid length
		if(m_FirstName1.length() > 20)
			m_FirstName1 = m_FirstName1.substring(0, 19);
		else if(m_FirstName1.length() == 0)
			m_FirstName1 = "";
		if(m_FirstName2.length() > 20)
			m_FirstName2 = m_FirstName2.substring(0, 19);
		else if(m_FirstName2.length() == 0)
			m_FirstName2 = "";
		if(m_LastName1.length() > 20)
			m_LastName1 = m_LastName1.substring(0, 19);
		else if(m_LastName1.length() == 0)
			m_LastName1 = "";
		if(m_LastName2.length() > 20)
			m_LastName2 = m_LastName2.substring(0, 19);
		else if(m_LastName2.length() == 0)
			m_LastName2 = "";
		
		//	Get Active Employee
		MHREmployee employee = MHREmployee.getActiveEmployee(Env.getCtx(), 
				bpartner.getC_BPartner_ID(), p_AD_Org_ID, p_TrxName);
		//	Valid Employee
		if(employee == null)
			return null;
		//	Get Account No
		String accountNo = DB.getSQLValueString(p_TrxName, "SELECT MAX(bpa.AccountNo) "
				+ "FROM C_BP_BankAccount bpa "
				+ "WHERE bpa.C_BPartner_ID = ? "
				+ "AND bpa.IsPayrollAccount = 'Y'", bpartner.getC_BPartner_ID());
		if(accountNo == null)
			accountNo = "NO CUENTA";
		//	Set Array
		bpInfo[BP_NATIONALITY]		= bpartner.get_ValueAsString("Nationality");
		bpInfo[BP_TAX_ID]			= bpartner.getValue().substring(1);
		bpInfo[BP_FIRST_NAME]		= (m_FirstName1.length() > 0? m_FirstName1: m_FirstName2);
		bpInfo[BP_LAST_NAME]		= (m_LastName1.length() > 0? m_LastName1: m_LastName2);
		bpInfo[EM_MARITAL_STATUS]	= bpartner.get_ValueAsString("MaritalStatus");
		bpInfo[EM_ACCOUNT_NO]		= accountNo;
		//	Return
		return bpInfo;
	}
	
	@Override
	public String getNameFile() {
		
		return m_NameFile;
	}
}