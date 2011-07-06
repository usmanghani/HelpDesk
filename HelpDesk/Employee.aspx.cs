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

public partial class EmployeeComplaint : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        DataBind();
        
    }
    protected void HandleComplaintView_Load(object sender, EventArgs e)
    {
        //this.HiddenField1.DataBind();
        //this.DSEmployeeComplaints.DataBind();
        //this.DSOtherEmployees.DataBind();
        //this.GridView2.DataBind();
        //this.GridView3.DataBind();
        DataBind();
        //DAL dal = new DAL();
        //GridView2.DataSource =  dal.GetComplaintsForEmployee(User.Identity.Name);
        //GridView2.DataBind();

        
    }


    protected void btnForward_Click(object sender, EventArgs e)
    {
        if (GridView2.SelectedRow != null)
        {
            GridView3.Visible = true;
            btnForwardSelected.Visible = true;
        }


    }
    protected void btnCompleted_Click(object sender, EventArgs e)
    {
        if (GridView2.SelectedRow != null)
        {
            DAL dal = new DAL();
            dal.SetComplaintCompleted(GridView2.SelectedRow.Cells[1].Text, User.Identity.Name);
        }

    }
    protected void btnHandleComplaint_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedRow != null)
        {
            MultiView1.SetActiveView(HandleComplaintView);
            DAL dal = new DAL();
            dal.AssignComplaintToEmployee(GridView1.SelectedRow.Cells[1].Text, User.Identity.Name);

        }
   
    }
    protected void btnForwardSelected_Click(object sender, EventArgs e)
    {
        if (GridView2.SelectedRow != null && GridView3.SelectedRow != null)
        {
            DAL dal = new DAL();
            dal.ForwardComplaint(GridView2.SelectedRow.Cells[1].Text, User.Identity.Name, GridView3.SelectedRow.Cells[1].Text);

        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        Trace.Write(HiddenField1.Value);
        this.MultiView1.SetActiveView(HandleComplaintView);

    }
    protected void ComplaintView_Load(object sender, EventArgs e)
    {
        this.DSComplaints.DataBind();
        this.GridView1.DataBind();

    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        this.MultiView1.SetActiveView(ComplaintView);

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (GridView2.SelectedRow != null)
        {
            DetailsView1.Visible = true;
            DAL dal = new DAL();
            DetailsView1.DataSource = dal.GetComplaintDetails(GridView2.SelectedRow.Cells[1].Text);
            DetailsView1.DataBind();

        }

    }
}
