<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="MAFIA Welcome" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>MAFIA HelpDesk - Login</title>
<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE1_onclick() {

}

// ]]>
</script>
</head>
<body>
    <form id="form1" runat="server">
                    <table border="0" style="width: 1025px; font-family: Verdana;" id="TABLE1" onclick="return TABLE1_onclick()">
                        <tr>
                            <td colspan="3" style="background-image: url(space.jpg); height: 24px" valign="top">
                        <asp:Image ID="Image1" runat="server" Height="120px" ImageUrl="~/red_downloads.jpg"
                            Width="130px" /><span style="font-size: 36pt; color: #33ccff">MAFIA Enterprises</span></td>
                        </tr>
                        <tr>
                            <td style="width: 294px; height: 32px" valign="top">
    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <asp:LoginName ID="LoginName1" runat="server" />
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </LoggedInTemplate>
        <AnonymousTemplate>
        <asp:Login ID="Login1" runat="server" BorderColor="#E6E2D8" BorderPadding="4"
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
        ForeColor="#333333" OnLoggedIn="Login1_LoggedIn">
        <LoginButtonStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
        <TextBoxStyle Font-Size="0.8em" BackColor="Gainsboro" />
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        </asp:Login>
        </AnonymousTemplate>
    </asp:LoginView>
                            </td>
                            <td style="width: 25px; height: 32px">
                            </td>
                            <td style="width: 780px; height: 32px">
                                MAFIA Enterprises was formed as an after-effect of a plasma burst in a rupture space/time
                                contiuum. A galaxy-class warship was traveling in the unchartered space when it
                                triggered a chain reaction which resulted in the creation of MAFIA Enterprises,
                                a galactic organization. The data warehouse is kept in the Delta Quadrant and permanent
                                secured subspace channel is kept for database access across all the quadrants.<br />
                                <br />
                                MAFIA Enterprises is the first company in the galaxy to offer intergalactic HelpDesk
                                services to all lifeforms that exist in the entire Universe.<br />
                                <br />
                                We are based on SQL Server 2005 and .NET and are making Microsoft popular on a galactic
                                level!</td>
                        </tr>
                    </table>
    </form>
</body>
</html>

