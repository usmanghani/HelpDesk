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
using System.Data.OleDb;

public partial class AdminPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {

    }
    protected void lnkEmployees_Click(object sender, EventArgs e)
    {
        this.MultiView1.SetActiveView(EmployeesView);

    }
    protected void lnkComplaints_Click(object sender, EventArgs e)
    {
        this.MultiView1.SetActiveView(ComplaintsView);

    }
    protected void lnkEmpComp_Click(object sender, EventArgs e)
    {
        this.MultiView1.SetActiveView(EmployeeComplaintsView);

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.GridView3.SelectedIndex >= 0)
        {
            DAL dal = new DAL();
            dal.SetComplaintStatus(GridView3.SelectedRow.Cells[1].Text, int.Parse(DropDownList1.SelectedValue));
            DataBind();

        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        if (this.GridView4.SelectedIndex >= 0)
        {
            DAL dal = new DAL();
            Trace.Write(GridView4.SelectedRow.Cells[1].Text);
            Trace.Write(GridView4.SelectedRow.Cells[3].Text);
            Trace.Write(int.Parse(DropDownList2.SelectedValue).ToString());
            dal.SetInternalComplaintStatus(GridView4.SelectedRow.Cells[1].Text, GridView4.SelectedRow.Cells[3].Text, int.Parse(DropDownList2.SelectedValue));
            DataBind();

        }

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (this.GridView4.SelectedIndex >= 0)
        {
            DAL dal = new DAL();
            dal.ForwardComplaint(GridView4.SelectedRow.Cells[1].Text, GridView4.SelectedRow.Cells[3].Text, DropDownList3.SelectedValue);
            DataBind();
                        
        }

    }
    protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GridView4.SelectedIndex >= 0)
        {
            DAL dal = new DAL();
            this.DropDownList3.DataSource = dal.GetOtherEmployees(GridView4.SelectedRow.Cells[3].Text);
            this.DropDownList3.DataTextField = "employeename";
            this.DropDownList3.DataValueField = "employeeid";
            this.DropDownList3.DataBind();

        }

    }
    protected void lnkCustomers_Click(object sender, EventArgs e)
    {
        this.MultiView1.SetActiveView(CustomersView);

    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        this.MultiView1.SetActiveView(ReportView);

    }
    protected void lnkProducts_Click(object sender, EventArgs e)
    {
        this.MultiView1.SetActiveView(ProductsView);

    }
}
