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
using System.Web.RegularExpressions;
using System.Web.Util;
using System.Data.OleDb;
using System.Data.SqlTypes;
using System.IO;
using System.Data.Common;

public partial class LodgeComplaint : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        this.CustomerID.DataBind();
        this.HiddenField1.DataBind();
        if (IsPostBack)
            Trace.Write(ProductName.SelectedValue);


    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(ComplaintConfirmView);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DAL dal = new DAL();
        dal.RegisterComplaint(lblCustomerID.Text, hiddenProductID.Value, hiddenComplaintID.Value, lblComments.Text);
        MultiView1.SetActiveView(ComplaintSubmittedView);

    }
    protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
    {
        if (MultiView1.GetActiveView() == ComplaintConfirmView)
        {
            if (IsPostBack)
            {
                lblCustomerID.Text = CustomerID.Text;
                lblProductName.Text = ProductName.SelectedItem.Text;
                lblComplaint.Text = Complaint.SelectedItem.Text;
                lblComments.Text = Comments.Text;
                hiddenProductID.Value = ProductName.SelectedValue;
                hiddenComplaintID.Value = Complaint.SelectedValue;

            }

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(LodgeComplaintView);

    }
    protected void Complaint_DataBound(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(CheckComplaintStatusView);

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedRow != null)
        {
            DAL dal = new DAL();

            dal.SetComplaintResolved(GridView1.SelectedRow.Cells[1].Text);
                
            this.DSCustomerComplaints.DataBind();
        }
        

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        
        MultiView1.SetActiveView(LodgeComplaintView);

    }
    protected void CheckComplaintStatusView_Load(object sender, EventArgs e)
    {
        this.DSCustomerComplaints.DataBind();
        this.GridView1.DataBind();
        
    }
}
