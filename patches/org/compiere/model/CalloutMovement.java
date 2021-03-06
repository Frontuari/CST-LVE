/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
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
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 * Contributor(s): Armen Rizal (armen@goodwill.co.id) Bug Fix 1564496         *
 *****************************************************************************/
package org.compiere.model;

import java.math.BigDecimal;
import java.util.Properties;

import org.compiere.util.Env;
import org.eevolution.model.MDDOrderLine;

/**
 *	Inventory Movement Callouts
 *	
 *  @author Jorg Janke
 *  @version $Id: CalloutMovement.java,v 1.2 2006/07/30 00:51:03 jjanke Exp $
 * 
 * @author Teo Sarca, SC ARHIPAC SERVICE SRL
 * 			<li>BF [ 1879568 ] CalloutMouvement QtyAvailable issues
 */
public class CalloutMovement extends CalloutEngine
{
//	2015-07-07 Dixon Martinez
//	Add lines from Patches of LVE-ADempiere and had no comments		
	/**	Locator 							*/
	private int 	p_M_Locator_ID 			= 0;
//	End Dixon Martinez
	
	/**
	 *  Product modified
	 * 		Set Attribute Set Instance
	 *
	 *  @param ctx      Context
	 *  @param WindowNo current Window No
	 *  @param GridTab     Model Tab
	 *  @param GridField   Model Field
	 *  @param value    The new value
	 *  @return Error message or ""
	 */
	public String product (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
	{
		Integer M_Product_ID = (Integer)value;
		if (M_Product_ID == null || M_Product_ID.intValue() == 0)
			return "";
		//	Set Attribute
		if (Env.getContextAsInt(ctx, WindowNo, Env.TAB_INFO, "M_Product_ID") == M_Product_ID.intValue()
			&& Env.getContextAsInt(ctx, WindowNo, Env.TAB_INFO, "M_AttributeSetInstance_ID") != 0)
			mTab.setValue("M_AttributeSetInstance_ID", Env.getContextAsInt(ctx, WindowNo, Env.TAB_INFO, "M_AttributeSetInstance_ID"));
		else
			mTab.setValue("M_AttributeSetInstance_ID", null);
		 
		checkQtyAvailable(ctx, mTab, WindowNo, M_Product_ID, null);
		return "";
	}   //  product
	
	// Begin Armen 2006/10/01
	/**
	 *  Movement Line - MovementQty modified
	 *              called from MovementQty
	 *
	 *  @param ctx      Context
	 *  @param WindowNo current Window No
	 *  @param GridTab     Model Tab
	 *  @param GridField   Model Field
	 *  @param value    The new value
	 *  @return Error message or ""
	 */
	public String qty(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value) {
		if (isCalloutActive() || value == null)
			return "";

		int M_Product_ID = Env.getContextAsInt(ctx, WindowNo, "M_Product_ID");
		checkQtyAvailable(ctx, mTab, WindowNo, M_Product_ID, (BigDecimal)value);
		//
		return "";
	} //  qty
	
	/**
	 * Movement Line - Locator modified
	 * 
	 * @param ctx      Context
	 * @param WindowNo current Window No
	 * @param GridTab     Model Tab
	 * @param GridField   Model Field
	 * @param value    The new value
	 * @return Error message or ""
	 */
	public String locator(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value) {
		if (value == null)
			return "";
		int M_Product_ID = Env.getContextAsInt(ctx, WindowNo, "M_Product_ID");
		checkQtyAvailable(ctx, mTab, WindowNo, M_Product_ID, null);
		return "";
	}

	/**
	 * Check available qty
	 * 
	 * @param ctx context
	 * @param mTab Model Tab
	 * @param WindowNo current Window No
	 * @param M_Product_ID product ID
	 * @param MovementQty movement qty (if null will be get from context "MovementQty")
	 */
	private void checkQtyAvailable(Properties ctx, GridTab mTab, int WindowNo, int M_Product_ID, BigDecimal MovementQty) {
		// Begin Armen 2006/10/01
		if (M_Product_ID != 0) {
			MProduct product = MProduct.get(ctx, M_Product_ID);
			if (product.isStocked()) {
				if (MovementQty == null)
					MovementQty = (BigDecimal) mTab.getValue("MovementQty");
				//	Dixon Martinez 2014-12-01
				//	Set locator of distribution order line				
				int M_Locator_ID ;
				MDDOrderLine m_DDOrderLine	= null;
				if(mTab.getValue("DD_OrderLine_ID") != null 
								&& (Integer) mTab.getValue("DD_OrderLine_ID") > 0) {
					int p_DD_OrderLine_ID	= (Integer) mTab.getValue("DD_OrderLine_ID");
					m_DDOrderLine = new MDDOrderLine(ctx, p_DD_OrderLine_ID , null);
					p_M_Locator_ID = m_DDOrderLine.getM_Locator_ID();
				}
				
				if(p_M_Locator_ID > 0 )
					M_Locator_ID = p_M_Locator_ID;
				else 
					M_Locator_ID = Env.getContextAsInt(ctx, WindowNo, "M_Locator_ID");
				//	End Dixon Martinez
				// If no locator, don't check anything and assume is ok
				if (M_Locator_ID <= 0)
					return;
				int M_AttributeSetInstance_ID = Env.getContextAsInt(ctx, WindowNo, "M_AttributeSetInstance_ID");
				BigDecimal available = MStorage.getQtyAvailable(0, M_Locator_ID, M_Product_ID, M_AttributeSetInstance_ID, null);
				if (available == null)
					available = Env.ZERO;
				if (available.signum() == 0)
					mTab.fireDataStatusEEvent("NoQtyAvailable", "0", false);
				else if (available.compareTo(MovementQty) < 0)
					mTab.fireDataStatusEEvent("InsufficientQtyAvailable", available.toString(), false);
			}
		}
		// End Armen
	}
	
	/**
	 * Set Field Is Transit depend of Doc Type Is Transit.
	 * @author <a href="mailto:dixon.22martinez@gmail.com">Dixon Martinez</a>
	 * @param ctx
	 * @param WindowNo
	 * @param mTab
	 * @param mField
	 * @param value
	 * @return
	 */
	public String doctype (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value){		
		//	Set Variable of Doc Type ID of Context
		Integer p_DocType_ID = (Integer) value;
		
		if (p_DocType_ID == null || p_DocType_ID.intValue() == 0)
			return "";
		
		//	Create object Doc Type
		MDocType m_DocType = new MDocType(ctx, p_DocType_ID.intValue(), null);
	
		//	Set value Affects Book
		mTab.setValue("IsInTransit", m_DocType.get_ValueAsBoolean("IsInTransit"));
		//	Dixon Martinez 2015-01-27
		//	Set Value is manual
		mTab.setValue("IsManual", m_DocType.get_ValueAsBoolean("IsManual"));
		//	End Dixon Martinez
		
		return "";
	}


	/**
	 * Set Values of Distribution Line.
	 * @author <a href="mailto:dixon.22martinez@gmail.com">Dixon Martinez</a>
	 * @param ctx
	 * @param WindowNo
	 * @param mTab
	 * @param mField
	 * @param value
	 * @return
	 */
	public String ddOrderLine (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value){		
		//	Set Variable of Doc Type ID of Context
		Integer p_DD_OrderLine_ID = (Integer) value;
		
		if (p_DD_OrderLine_ID == null || p_DD_OrderLine_ID.intValue() == 0)
			return "";
		
		//	Create object DD Order Line
		MDDOrderLine m_DDOrderLine = new MDDOrderLine(ctx, p_DD_OrderLine_ID.intValue(), null);
	
		//	Set value 
		mTab.setValue("M_Product_ID", Integer.valueOf(m_DDOrderLine.getM_Product_ID()));
		mTab.setValue("M_AttributeSetInstance_ID", Integer.valueOf(m_DDOrderLine.getM_AttributeSetInstance_ID()));
		mTab.setValue("M_AttributeSetInstanceTo_ID", Integer.valueOf(m_DDOrderLine.getM_AttributeSetInstanceTo_ID()));
		mTab.setValue("M_Locator_ID", Integer.valueOf(m_DDOrderLine.getM_Locator_ID()));
		mTab.setValue("M_LocatorTo_ID", Integer.valueOf(m_DDOrderLine.getM_LocatorTo_ID()));
		mTab.setValue("MovementQty", m_DDOrderLine.getQtyEntered());
		mTab.setValue("ConfirmedQty", m_DDOrderLine.getConfirmedQty());
		
		return "";
	}
	
}	//	CalloutMove