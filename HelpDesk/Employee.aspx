<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="Employee.aspx.cs" Inherits="EmployeeComplaint" Title="HelpDesk - Employee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>HelpDesk - Employee</title>
</head>
<body>
    <form id="form1" runat="server">
        &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td colspan="2" style="height: 9px; background-color: #ffcccc;">
                    <strong><span style="font-size: 36pt; color: #000080; background-color: #ffcccc;">
                        <asp:Image ID="Image1" runat="server" Height="120px" ImageUrl="~/red_downloads.jpg"
                            Width="130px" />MAFIA Enterprises</span></strong></td>
            </tr>
            <tr>
            <td style="width: 140px; vertical-align: top; background-color: #ffcccc;">
                &nbsp;
            <asp:LoginName ID="LoginName3" runat="server" style="left: -154px; top: -47px;" Width="84px" />
            <asp:LoginStatus ID="LoginStatus3" runat="server" style="left: 0px; top: 0px;" />
                <br />
                <br />
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Show All Complaints</asp:LinkButton><br />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Show My Complaints</asp:LinkButton>
                <br />
            </td>
                <td style="width: 675px; background-color: #ffcccc;">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" EnableTheming="True">
        &nbsp;<asp:View ID="ComplaintView" runat="server" OnLoad="ComplaintView_Load">
            &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:GridView ID="GridView1" runat="server" DataSourceID="DSComplaints" CellPadding="4"  ForeColor="#333333"  AutoGenerateSelectButton="True" DataKeyNames="complaintID">
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
            <br />
            <asp:Button ID="btnHandleComplaint" runat="server" OnClick="btnHandleComplaint_Click"
                Text="Handle Complaint" /><br />
            <asp:ObjectDataSource ID="DSComplaints"  runat="server" TypeName="DAL" SelectMethod="GetNewComplaints" OldValuesParameterFormatString="original_{0}" UpdateMethod="ForwardComplaint">
                <UpdateParameters>
                    <asp:Parameter Name="complaintID" Type="String" />
                    <asp:Parameter Name="fromEmployeeID" Type="String" />
                    <asp:Parameter Name="toEmployeeID" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            </asp:View>
        <asp:View ID="HandleComplaintView" runat="server" OnLoad="HandleComplaintView_Load">
            <asp:HiddenField ID="HiddenField1" runat="server" Value = "<%#User.Identity.Name %>"/>
            &nbsp; &nbsp;<asp:GridView ID="GridView2" runat="server" CellPadding="4" DataSourceID="DSEmployeeComplaints"
                ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <br />
            &nbsp;<asp:Button ID="btnCompleted"
                runat="server" OnClick="btnCompleted_Click" Text="Set Completed" />
            <asp:Button ID="btnForward" runat="server" OnClick="btnForward_Click" Text="Forward" />
            <br />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" CellPadding="4" ForeColor="#333333"
                GridLines="None" Height="50px" Width="125px" Visible="False">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
            <br />
            <asp:GridView ID="GridView3" runat="server" CellPadding="4" DataSourceID="DSOtherEmployees"
                ForeColor="#333333" Visible="False">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <br />
            &nbsp;
            <asp:Button ID="btnForwardSelected" runat="server" Text="Forward to Selected Employee"
                Visible="False" OnClick="btnForwardSelected_Click" /><br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:ObjectDataSource ID="DSEmployeeComplaints" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetComplaintsForEmployee" TypeName="DAL" UpdateMethod="ForwardComplaint">
                <UpdateParameters>
                    <asp:Parameter Name="complaintID" Type="String" />
                    <asp:Parameter Name="fromEmployeeID" Type="String" />
                    <asp:Parameter Name="toEmployeeID" Type="String" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenField1" Name="employeeID" PropertyName="Value"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="DSOtherEmployees" runat="server" SelectMethod="GetOtherEmployees" TypeName="DAL" OldValuesParameterFormatString="original_{0}" UpdateMethod="ForwardComplaint">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenField1" Name="employeeID" PropertyName="Value"
                        Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="complaintID" Type="String" />
                    <asp:Parameter Name="fromEmployeeID" Type="String" />
                    <asp:Parameter Name="toEmployeeID" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="DSComplaintDetails" runat="server"></asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 146px">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
