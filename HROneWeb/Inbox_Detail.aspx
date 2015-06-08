<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Inbox_Detail.aspx.cs" Inherits="Inbox_Detail"  %>
<%@ Register Src="~/controls/DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" Runat="Server">
    <input type="hidden" id="InboxID" runat="server" name="ID" />
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Inbox" />
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
        <tr>
            <td>
                <asp:Label runat="server" Text="Message Detail"/>
            </td>
        </tr>
    </table>
        <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
            <tr>
                <td>
                    <tb:DetailToolBar id="toolBar" runat="server"
                     NewButton_Visible="false" 
                     SaveButton_Visible="false" 
                     EditButton_Visible="false"
                     OnBackButton_Click="Back_Click"
                     OnDeleteButton_Click="Delete_Click"
                      />
                </td>
                <td align="right">
                    <asp:Button ID="btnHelp" runat="server" CSSClass="button" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openHelp(); return false;"/>
                </td>
            </tr>
        </table>
    <table border="0" width="100%" cellpadding="0" cellspacing="0" class="pm_field_section">
        <colgroup>
        <col width="15%" />
        <col width="35%" />
        <col width="15%" />
        <col width="35%" />
        </colgroup>
        <tr>
            <td class="pm_field_header" >
                <asp:Label ID="Label2" runat="server" Text="From" />:
            </td>
            <td class="pm_field" >
                <asp:Label ID="InboxFromUserID" runat="Server" />
            </td>
            <td class="pm_field_header" >
                <asp:Label ID="Label6" runat="server" Text="Date" />:
            </td>
            <td class="pm_field" >
                <asp:Label ID="InboxCreateDate" runat="Server" />
            </td>
        </tr>
        <tr>
            <td class="pm_field_header" >
                <asp:Label ID="Label3" runat="server" Text="Subject" />:
            </td>
            <td class="pm_field" colspan="3">
                <asp:Label ID="InboxSubject" runat="Server" />
            </td>
        </tr>
        <tr id="AttachmentRow" runat="server" >
            <td class="pm_field_header" >
                <asp:Label ID="Label5" runat="server" Text="Attachment" />:
            </td>
            <td class="pm_field" colspan="3">
                <asp:Repeater ID="InboxAttachmentRepeater" runat="server" OnItemDataBound="InboxAttachmentRepeater_ItemDataBound" >
                <ItemTemplate>
                    <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "Inbox_Attachment_Download.aspx?InboxID=" + sbinding.getValue(Container.DataItem, "InboxID") + "&InboxAttachmentID=" + sbinding.getValue(Container.DataItem, "InboxAttachmentID"))%>">
                        <%#sbinding.getValue(Container.DataItem, "InboxAttachmentOriginalFileName")%>
                    </a>
                </ItemTemplate>
                <SeparatorTemplate>
                <br />
                </SeparatorTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td class="pm_field" colspan="4">
                <asp:Label ID="InboxMessage" runat="Server" />
            </td>
        </tr>
        <tr id="eChannelRow" runat="server" >
            <td class="pm_field" colspan="4">
                <asp:Button ID="btnSubmit" runat="Server" Text="Submit via e-Channel" CssClass="button" OnClick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

