using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        try
        {

            System.Web.UI.WebControls.Login login = LoginView1.FindControl("Login1") as System.Web.UI.WebControls.Login;
            DAL dal = new DAL();
            string redirectUrl = dal.GetRedirectUrlForUser(login.UserName);
            Response.Redirect(redirectUrl);

        }
        catch (Exception ex)
        {
            Trace.Write("Can't perform redirection" + ex.Message);


        }

    }
}
