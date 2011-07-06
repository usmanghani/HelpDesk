<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="AdminPage" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>MAFIA HelpDesk - Administration System</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td colspan="2" style="height: 127px; background-color: #ffcccc;">
                    &nbsp; &nbsp;
                    <img border="0" src="red_downloads.jpg" style="width: 130px; height: 120px; background-color: #ffcccc;" />
                    &nbsp; <font color="#000080" size="7">MAFIA Enterprises</font></td>
            </tr>
            <tr>
                <td style="width: 143px; height: 365px; vertical-align: top; background-color: #ffcccc;">
                    <br />
                    <asp:LoginName ID="LoginName1" runat="server" />
                    <br />
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                    <br />
                    <br />
                    <asp:LinkButton ID="lnkEmployees" runat="server" OnClick="lnkEmployees_Click">Employees</asp:LinkButton><br />
                    <br />
                    <asp:LinkButton ID="lnkCustomers" runat="server" OnClick="lnkCustomers_Click">Customers</asp:LinkButton><br />
                    <br />
                    <asp:LinkButton ID="lnkProducts" runat="server" OnClick="lnkProducts_Click">Products</asp:LinkButton><br />
                    <br />
                    <asp:LinkButton ID="lnkComplaints" runat="server" OnClick="lnkComplaints_Click">Complaints</asp:LinkButton><br />
                    <br />
                    <asp:LinkButton ID="lnkEmpComp" runat="server" OnClick="lnkEmpComp_Click">Employees And Complaints</asp:LinkButton><br />
                    <br />
                    <asp:LinkButton ID="lnkReports" runat="server" OnClick="LinkButton4_Click">Reports</asp:LinkButton></td>
                <td style="width: 588px; height: 365px; background-color: #ffcccc;">
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="EmployeesView" runat="server">
                            &nbsp;<asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="DSEmployees"
                                ForeColor="#333333">
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
                            <asp:ObjectDataSource ID="DSEmployees" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetAllEmployees" TypeName="DAL" UpdateMethod="ForwardComplaint">
                                <UpdateParameters>
                                    <asp:Parameter Name="complaintID" Type="String" />
                                    <asp:Parameter Name="fromEmployeeID" Type="String" />
                                    <asp:Parameter Name="toEmployeeID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            &nbsp;
                        </asp:View>
                        &nbsp; &nbsp;
                        <asp:View ID="CustomersView" runat="server">
                            <br />
                            <asp:GridView ID="GridView2" runat="server" CellPadding="4" DataSourceID="DSCustomers"
                                ForeColor="#333333">
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
                            <asp:ObjectDataSource ID="DSCustomers" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetAllCustomers" TypeName="DAL" UpdateMethod="ForwardComplaint">
                                <UpdateParameters>
                                    <asp:Parameter Name="complaintID" Type="String" />
                                    <asp:Parameter Name="fromEmployeeID" Type="String" />
                                    <asp:Parameter Name="toEmployeeID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                        </asp:View>
                        <asp:View ID="ComplaintsView" runat="server">
                            <asp:GridView ID="GridView3" runat="server" CellPadding="4" DataSourceID="DSComplaintDetails"
                                ForeColor="#333333">
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
                            <asp:ObjectDataSource ID="DSComplaintDetails" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetAllComplaintDetails" TypeName="DAL" UpdateMethod="ForwardComplaint">
                                <UpdateParameters>
                                    <asp:Parameter Name="complaintID" Type="String" />
                                    <asp:Parameter Name="fromEmployeeID" Type="String" />
                                    <asp:Parameter Name="toEmployeeID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <br />
                            Set Complaint Status to :
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="DSStatus" DataTextField="statustext"
                                DataValueField="statusid" Width="249px" style="background-color: #cccccc">
                            </asp:DropDownList>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Go" /><br />
                            <br />
                            <asp:ObjectDataSource ID="DSStatus" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetAllStatus" TypeName="DAL" UpdateMethod="ForwardComplaint">
                                <UpdateParameters>
                                    <asp:Parameter Name="complaintID" Type="String" />
                                    <asp:Parameter Name="fromEmployeeID" Type="String" />
                                    <asp:Parameter Name="toEmployeeID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                        </asp:View>
                        <asp:View ID="EmployeeComplaintsView" runat="server">
                            <br />
                            <asp:GridView ID="GridView4" runat="server" CellPadding="4" DataSourceID="DSEmployeeComplaintDetails"
                                ForeColor="#333333" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
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
                            &nbsp;<br />
                            <br />
                                        Set Internal Complaint Status to :
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="DSInternalStatus"
                                DataTextField="internalstatustext" DataValueField="internalstatusid" Width="209px" style="background-color: #cccccc">
                            </asp:DropDownList>
                            <asp:Button ID="Button2" runat="server" Text="Go" OnClick="Button2_Click" /><br />
                            <br />
                            Forward Complaint to :
                            <asp:DropDownList ID="DropDownList3" runat="server" Style="background-color: #cccccc"
                                Width="264px">
                            </asp:DropDownList>&nbsp;
                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Go" /><br />
                            <br />
                            <asp:ObjectDataSource ID="DSInternalStatus" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetAllInternalStatus" TypeName="DAL" UpdateMethod="ForwardComplaint">
                                <UpdateParameters>
                                    <asp:Parameter Name="complaintID" Type="String" />
                                    <asp:Parameter Name="fromEmployeeID" Type="String" />
                                    <asp:Parameter Name="toEmployeeID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="DSEmployeeComplaintDetails" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetEmployeeComplaintDetails" TypeName="DAL" UpdateMethod="ForwardComplaint">
                                <UpdateParameters>
                                    <asp:Parameter Name="complaintID" Type="String" />
                                    <asp:Parameter Name="fromEmployeeID" Type="String" />
                                    <asp:Parameter Name="toEmployeeID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                        </asp:View>
                        <asp:View ID="ReportView" runat="server">
                            <rsweb:ReportViewer ID="ReportViewer1" runat="server" ProcessingMode="Remote" Width="642px">
                            </rsweb:ReportViewer>
                        </asp:View>
                        <asp:View ID="ProductsView" runat="server">
                            <br />
                            <asp:GridView ID="GridView5" runat="server" CellPadding="4" DataSourceID="DSProducts"
                                ForeColor="#333333">
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
                            <asp:ObjectDataSource ID="DSProducts" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetAllProducts" TypeName="DAL" UpdateMethod="ForwardComplaint">
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
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
