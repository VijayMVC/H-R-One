﻿<%@ page language="C#" autoeventwireup="true" inherits="Company_Edit, HROneWeb.deploy" masterpagefile="~/MainMasterPage.master" viewStateEncryptionMode="Always" %>

<%@ Register Src="~/controls/DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>
<%@ Register Src="~/controls/RecordListFooter.ascx" TagName="RecordListFooter" TagPrefix="tb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
        <input type="hidden" id="CompanyID" runat="server" name="ID" />
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label Text="Company Setup" runat="server" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <%=CurID<=0?HROne.Common.WebUtility.GetLocalizedString("Add"):HROne.Common.WebUtility.GetLocalizedString("Edit") %>
                  <asp:Label Text="Company " runat="server" />:
                    <%=CompanyCode.Text %>
                </td>
            </tr>
        </table>
        
            
                
        
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
                    <asp:Button ID="btnHelp" runat="server" CSSClass="button" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openHelp(); return false;"/>
                </td>
            </tr>
        </table>
        <table border="0" width="100%" cellspacing="0" cellpadding="0" class="pm_field_section">
            <col width="15%" />
            <col width="35%" />
            <col width="15%" />
            <col width="35%" />
            <tr>
                <td class="pm_field_header">
                    <asp:Label Text="Code " runat="server" />:</td>
                <td class="pm_field" colspan="3">
                    <asp:TextBox ID="CompanyCode" runat="Server"  /></td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label Text="Company Name " runat="server" />:</td>
                <td class="pm_field" colspan="3">
                    <asp:TextBox ID="CompanyName" runat="Server" /></td>
            </tr>
            <tr>
                <td class="pm_field_header" rowspan="4">
                    <asp:Label Text="Address" runat="server" />:</td>
                <td class="pm_field" rowspan="4" valign="top">
                    <asp:TextBox ID="CompanyAddress" runat="Server" MaxLength="70" Rows="5" Columns="35"
                        TextMode="MultiLine" /></td>
                <td class="pm_field_header">
                    <asp:Label Text="Contact Person " runat="server" />:</td>
                <td class="pm_field">
                    <asp:TextBox ID="CompanyContactPerson" runat="Server"  /></td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label Text="Contact No." runat="server" />:</td>
                <td class="pm_field">
                    <asp:TextBox ID="CompanyContactNo" runat="Server"  /></td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label Text="Fax No." runat="server" />:</td>
                <td class="pm_field">
                    <asp:TextBox ID="CompanyFaxNo" runat="Server" /></td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label Text="BR No." runat="server" />:</td>
                <td class="pm_field">
                    <asp:TextBox ID="CompanyBRNo" runat="Server"  /></td>

            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label ID="Label1" Text="Bank Account Number" runat="server" />:</td>
                <td class="pm_field" colspan="3" >
                    <asp:Repeater ID="companyBankAccountRepeater" runat="server" OnItemDataBound="companyBankAccountRepeater_ItemDataBound">
                        <ItemTemplate>
                            <asp:CheckBox ID="ItemSelect" runat="server" />
                        </ItemTemplate>
                        <SeparatorTemplate>
                            <br />
                        </SeparatorTemplate>
                    </asp:Repeater>
                    <tb:RecordListFooter ID="ListFooter" runat="server" 
                        ShowAllRecords="true"
                        ListOrderBy="CompanyBankAccountBankCode"
                        ListOrder="true" Visible="false"  />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="toolbar"/>
        </Triggers>
        </asp:UpdatePanel >
</asp:Content> 