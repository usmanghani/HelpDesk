<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="LodgeComplaint" Title="MAFIA HelpDesk - Lodge Complaint" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>MAFIA - HelpDesk</title>
</head>
<body>
    <form id="form1" runat="server">
        &nbsp;
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td colspan="2" style="height: 9px; background-color: #ffcccc;">
                    <strong><span style="font-size: 32pt; color: #0033ff">
                        <asp:Image ID="Image1" runat="server" Height="120px" ImageUrl="~/red_downloads.jpg"
                            Width="130px" /><span style="font-size: 36pt; color: #000080; background-color: #ffcccc;">MAFIA Enterprises</span></span></strong></td>
            </tr>
            <tr>
                <td style="width: 146px; vertical-align: top; background-color: #ffcccc;">
                    <asp:LoginName ID="LoginName1" runat="server" />
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                    &nbsp;<br />
                    <br />
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Lodge Complaint</asp:LinkButton><br />
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Height="21px" Width="154px">Check Complaint Status</asp:LinkButton><br />
                    <br />
                </td>
                <td style="width: 549px; background-color: #ffcccc;">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" OnActiveViewChanged="MultiView1_ActiveViewChanged">
            <asp:View ID="LodgeComplaintView" runat="server">
                <table border="0" height="100%" width="100%" id="TABLE1" runat="server" style="text-align: right" cellspacing="10">
                    <tr>
                    <td style="width: 117px; height: 33px; text-align: right;">
                        Customer ID</td>
                    <td style="width: 156px; height: 33px; text-align: left;">
                <asp:TextBox ID="CustomerID"  Text = "<%# User.Identity.Name %>" runat="server" Width="234px" Enabled="False" style="background-color: #cccccc"></asp:TextBox><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="CustomerID"
                            Display="Dynamic" ErrorMessage="No mischief please !" SetFocusOnError="True"
                            ValidationExpression="[^<>]*" ValidationGroup="usman"></asp:RegularExpressionValidator></td>
                    </tr>
        <tr style="color: #000000">
            <td style="width: 117px; text-align: right; height: 24px;">
                Product </td>
            <td style="width: 156px; text-align: left; height: 24px;">
                <asp:DropDownList ID="ProductName" runat="server" Width="234px" AutoPostBack="True" DataValueField="productID" DataSourceID="DSProducts" DataTextField="productTitle" style="background-color: #cccccc">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 117px; height: 24px; text-align: right;">
                Complaint</td>
            <td style="width: 156px; height: 24px; text-align: left;">
                <asp:DropDownList ID="Complaint" runat="server" Width="234px" DataSourceID="DSProductComplaints" DataTextField="complaintText" DataValueField="productComplaintID" DataMember="DefaultView" OnDataBound="Complaint_DataBound" style="background-color: #cccccc">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 117px; height: 70px; text-align: right;">
                Comments</td>
            <td style="width: 156px; height: 70px; text-align: left;">
                <asp:TextBox ID="Comments" runat="server" Height="34px" TextMode="MultiLine" Width="234px" style="background-color: #cccccc"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Comments"
                    Display="Dynamic" ErrorMessage="No mischief please !" SetFocusOnError="True"
                    ValidationExpression="[^<>]*" ValidationGroup="usman">This is a great effort to hack MAFIA (Y). May the force be with you.</asp:RegularExpressionValidator></td>
        </tr>
    </table>
        &nbsp;&nbsp;
    <asp:Button ID="Submit" runat="server" Text="Submit" CommandName="Submit" OnClick="Submit_Click" />&nbsp;<br />
        &nbsp;
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="usman" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:ObjectDataSource ID="DSProducts" runat="server" SelectMethod="GetAllProducts" TypeName="DAL" OldValuesParameterFormatString="original_{0}" UpdateMethod="ForwardComplaint">
                    <UpdateParameters>
                        <asp:Parameter Name="complaintID" Type="String" />
                        <asp:Parameter Name="fromEmployeeID" Type="String" />
                        <asp:Parameter Name="toEmployeeID" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DSProductComplaints" runat="server" SelectMethod="GetComplaintsByProduct"
                    TypeName="DAL" OldValuesParameterFormatString="original_{0}" UpdateMethod="ForwardComplaint">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ProductName" Name="productID" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="complaintID" Type="String" />
                        <asp:Parameter Name="fromEmployeeID" Type="String" />
                        <asp:Parameter Name="toEmployeeID" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
            </asp:View>
            <asp:View ID="ComplaintConfirmView" runat="server">
                Please confirm the complaint details you have chosen:<br />
                <table border="0" cellspacing="10" style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 138px">
                            CustomerID</td>
                        <td>
                            <asp:Label ID="lblCustomerID" runat="server" Width="128px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 138px; height: 64px">
                            ProductName</td>
                        <td style="height: 64px">
                            <asp:Label ID="lblProductName" runat="server"></asp:Label><asp:HiddenField ID="hiddenProductID"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 138px">
                            Complaint</td>
                        <td>
                            <asp:Label ID="lblComplaint" runat="server"></asp:Label><asp:HiddenField ID="hiddenComplaintID"
                                runat="server" Value="" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 138px">
                            Comments</td>
                        <td>
                            <asp:Label ID="lblComments" runat="server"></asp:Label></td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" PostBackUrl="~/LodgeComplaint.aspx"
                    Text="Back" UseSubmitBehavior="False" />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click"
                    Text="OK" />
                &nbsp;&nbsp;&nbsp;&nbsp;</asp:View>
            &nbsp;
            <asp:View ID="ComplaintSubmittedView" runat="server">
                Thank you for using MAFIA HelpDesk.<br />
                Your complaint has been registered.<br />
                You will receive appropriate response through email or phone.<br />
            </asp:View>
            <asp:View ID="CheckComplaintStatusView" runat="server" OnLoad="CheckComplaintStatusView_Load">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" DataSourceID="DSCustomerComplaints">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <br />
                &nbsp;
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Set Resolved" />&nbsp;
                <br />
                <br />
                <asp:HiddenField ID="HiddenField1" runat="server"  Value = "<%# User.Identity.Name %>"/>
                <asp:ObjectDataSource ID="DSCustomerComplaints" runat="server" SelectMethod="GetComplaintsForCustomer"
                    TypeName="DAL" OldValuesParameterFormatString="original_{0}" UpdateMethod="ForwardComplaint">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenField1" Name="customerID" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="complaintID" Type="String" />
                        <asp:Parameter Name="fromEmployeeID" Type="String" />
                        <asp:Parameter Name="toEmployeeID" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
            </asp:View>
        </asp:MultiView></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 123px">
                </td>
            </tr>
        </table>
        </form>
</body>
</html>