﻿<%@ page language="C#" autoeventwireup="true" inherits="Emp_Benefit_Edit, HROneWeb.deploy" masterpagefile="~/MainMasterPage.master" viewStateEncryptionMode="Always" %>
<%@ Register Src="~/controls/DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>
<%@ Register Src="~/controls/WebDatePicker.ascx" TagName="WebDatePicker" TagPrefix="uc1" %>

<%@ Register Src="~/controls/Emp_Common.ascx" TagName="Emp_Common" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <input type="hidden" id="EmpBenefitID" runat="server" name="ID" />
    <input type="hidden" id="EmpID" runat="server" name="ID" />
	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
        <tr>
            <td>
                <asp:Label Text="Employee Information" runat="server" />
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
        <tr>
            <td>
                <%=CurID<=0?HROne.Common.WebUtility.GetLocalizedString("Add"):HROne.Common.WebUtility.GetLocalizedString("Edit") %>
                <asp:Label Text="Benefit" runat="server" />
            </td>
        </tr>
    </table>
    
    <uc1:Emp_Common id="Emp_Common1" runat="server"></uc1:Emp_Common><br /> 
    <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
        <tr>
            <td>
                <tb:DetailToolBar id="toolBar" runat="server"
                 NewButton_Visible="false" 
                 EditButton_Visible="false" 
                 OnBackButton_Click="Back_Click"
                 OnSaveButton_Click ="Save_Click"
                 OnDeleteButton_Click="Delete_Click"
                  />
            </td>
            <td align="right">
                <asp:Button ID="btnHelp" runat="server" CSSClass="button" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openAlert(); return false;"/>
            </td>
        </tr>
    </table>
    <table border="0" width="100%" cellspacing="0" cellpadding="0" class="pm_field_section">
        <col width="15%" />
        <col width="35%" />
        <col width="15%" />
        <col width="35%" />
        <tr>
            <td class="pm_field_header" >
                <asp:Label Text="Effective" runat="server" />:
            </td>
            <td class="pm_field" >
                <uc1:WebDatePicker ID="EmpBenefitEffectiveDate" runat="server" />
            </td>
            <td class="pm_field_header" >
                <asp:Label ID="Label1" Text="Expiry" runat="server" />:
            </td>
            <td class="pm_field" >
                <uc1:WebDatePicker ID="EmpBenefitExpiryDate" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="pm_field_header">
                <asp:Label ID="Label4" Text="Benefit Plan" runat="server" />:</td>
            <td class="pm_field" colspan="3">
                <asp:DropDownList ID="EmpBenefitPlanID" runat="Server" OnSelectedIndexChanged="calculateBenefit" AutoPostBack="true" />
            </td>
        </tr>
        <tr>
            <td class="pm_field_header">
                <asp:Label Text="EE Premium" runat="server" />:</td>
            <td class="pm_field">
                <asp:TextBox ID="EmpBenefitEEPremium" runat="server" />
            </td>
            <td class="pm_field_header">
                <asp:Label ID="Label2" Text="ER Premium" runat="server" />:</td>
            <td class="pm_field">
                <asp:TextBox ID="EmpBenefitERPremium" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="pm_field_header">
                <asp:Label ID="Label3" Text="Spouse Premium" runat="server" />:</td>
            <td class="pm_field">
                <asp:TextBox ID="EmpBenefitSpousePremium" runat="server" />
            </td>
            <td class="pm_field_header">
                <asp:Label ID="Label6" Text="Child Premium" runat="server" />:</td>
            <td class="pm_field">
                <asp:TextBox ID="EmpBenefitChildPremium" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content> 