using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.Common;
using System.ComponentModel;
using System.Data.SqlClient;

[DataObject(true)]
public class DAL : IDisposable
{
    DbConnection conn = null;
    DbCommand cmd = null;
    DbDataReader reader = null;
    //connects to SQL Server here
    public DAL()
    {
        conn = DbProviderFactories.GetFactory(ConfigurationManager.ConnectionStrings["SqlServerConnectionString"].ProviderName).CreateConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["SqlServerConnectionString"].ConnectionString;
        cmd = conn.CreateCommand();
        cmd.Connection = conn;
        conn.Open();
        cmd.CommandType = CommandType.Text;
        
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetAllEmployees()
	{

        try
        {
            cmd.CommandText = "select * from employee";
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            
        }
        catch(Exception ex)
        {
            this.TraceIt("Error in GetAllEmployees", ex);
            
        }
        
        return reader;

	}
    [DataObjectMethod(DataObjectMethodType.Select)]
	public DbDataReader GetAllComplaints()
	{
        try
        {
            cmd.CommandText = "select * from complaint";

            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            

        }
        catch (Exception ex)
        {
            TraceIt("Error in GetAllComplaints", ex);
            
        }
        
        return reader;

	}
    [DataObjectMethod(DataObjectMethodType.Select)]
	public DbDataReader GetNewComplaints()
	{
        try
        {


            cmd.CommandText = @"select * from newcomplaintsview";
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);


        }
        catch (Exception ex)
        {
            TraceIt("Error in method GetNewComplaints", ex);
        }
        
        return reader;

	}
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetAllProducts()
    {
        try
        {
            cmd.CommandText = "select * from product";
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (Exception ex)
        {
            TraceIt("Error in method GetAllProducts", ex);

        }
        return reader;
    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetAllCustomers()
    {
        try
        {
            cmd.CommandText = "select * from Customer";
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            
        }
        catch (Exception ex)
        {
            TraceIt("Error in method GetAllCustomers", ex);

        }
        return reader;


    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetComplaintsByProduct(string productID)
    {
        try
        {
            cmd.CommandText = "select * from productcomplaint where productid = '" + productID + "'";
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        }
        catch (Exception ex)
        {
            TraceIt("Error in method GetComplaintsByProduct", ex);
        }

        
        return reader;
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public int RegisterComplaint(string customerID, string productID, string productComplaintID, string comments)
    {

        int rowsAffected = 0;
        try
        {
            cmd.CommandText = "select statusID from status where statustext = 'new'";
            string complaintStatus = (string)cmd.ExecuteScalar();
            cmd.CommandText = string.Format("insert into complaint values ( '{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', null )", Guid.NewGuid().ToString(), customerID, productID, productComplaintID, comments, DateTime.Now.ToString(), complaintStatus);
            rowsAffected = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            TraceIt("Error in method RegisterComplaint", ex);

        }        

        return rowsAffected;
    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public string GetRoleFromUserName(string userName)
    {

        string role = string.Empty;
        try
        {
            cmd.CommandText = "select rolename from roles, credentials where credentials.roleid = roles.roleid and id = '" + userName + "'";
            role = (string)cmd.ExecuteScalar();
            

        }
        catch (Exception ex)
        {
            TraceIt("Error in method GetRoleFromUserName", ex);

        }

        
        return role;
    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public string GetRedirectUrlFromRole(string role)
    {

        string redirectUrl = string.Empty;
        try
        {
            cmd.CommandText = "select redirecturl from roles where rolename = '" + role + "'";
            redirectUrl = (string)cmd.ExecuteScalar();
            
        }
        catch (Exception ex)
        {
            TraceIt("Error in method GetRedirectUrlFromRole", ex);

        }

        
        return redirectUrl;

    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public string GetRedirectUrlForUser(string userName)
    {
        string redirectUrl = string.Empty;
        try
        {
            cmd.CommandText = string.Format(@"select redirecturl from roles where roleid = (select roleid from credentials where id = '{0}')", userName);
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            reader.Read();
            redirectUrl = (string)reader["redirecturl"];

        }
        catch (Exception ex)
        {
            TraceIt("Error in method GetRedirectUrlForUser", ex);

        }
        return redirectUrl;


    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetComplaintsForEmployee(string employeeID)
    {
        try
        {
            cmd.CommandText = string.Format(
            @"select complaint.complaintid, 
            complaint.customerid , complaint.productid 
            from  ( complaint inner join employeecomplaint on 
            complaint.complaintid = employeecomplaint.complaintid 
            and employeecomplaint.employeeid = '{0}' )
            where employeecomplaint.internalstatusid = 
            ( select internalstatusid from internalcomplaintstatus 
              where internalstatustext = 'processing')", 
                                                       employeeID);

            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);            
            
        }
        catch (Exception ex)
        {
            TraceIt("Error in method GetCopmlaintsForEmployee", ex);

        }

        return reader;

    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetOtherEmployees(string employeeID)
    {
        try
        {
            cmd.CommandText = string.Format("select employeeid, employeename from employee where employeeid <> '{0}'", employeeID);
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            
            
        }
        catch (Exception ex)
        {
            TraceIt("Error in method GetOtherEmployees", ex);

        }

        
        return reader;

    }
    [DataObjectMethod(DataObjectMethodType.Update)]
    public int AssignComplaintToEmployee(string complaintID, string employeeID)
    {
        int rowsAffected = 0;
        try
        {
            cmd.CommandText = "select internalstatusid from internalcomplaintstatus where internalstatustext = 'processing'";
            string internalStatusID = (string)cmd.ExecuteScalar();
            cmd.CommandText = string.Format(
                "insert into employeecomplaint values ( '{0}', '{1}', '{2}' , null , '{3}' , null )",
                new object[] { 
                complaintID, employeeID, internalStatusID, DateTime.Now.ToString() 
                }
                );
            rowsAffected = cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format(
                @"update complaint set statusid = 
                (select statusid from status where statustext = 'Pending') 
                where complaintid = '{0}'", 
                                          complaintID);

            rowsAffected = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            TraceIt("Error in method AssignComplaintToEmployee", ex);

        }

        return rowsAffected;
    }

    [DataObjectMethod(DataObjectMethodType.Update, true)]
    public int ForwardComplaint(string complaintID, string fromEmployeeID, string toEmployeeID)
    {
        int rowsAffected = 0;
        try
        {
            cmd.CommandText = string.Format("update employeecomplaint set otheremployeeid = '{0}', internalstatusid = (select internalstatusid from internalcomplaintstatus where internalstatustext = 'forwarded' ) where complaintid = '{1}' and employeeid = '{2}'", toEmployeeID, complaintID, fromEmployeeID);
            rowsAffected = cmd.ExecuteNonQuery();
            cmd.CommandText = "select internalstatusid from internalcomplaintstatus where internalstatustext = 'processing'";
            string internalStatusID = ( string ) cmd.ExecuteScalar ();
            cmd.CommandText = string.Format("insert into employeecomplaint (complaintid, employeeid, internalstatusid, otheremployeeid, issuedate, completiondate ) values ( '{0}', '{1}', '{2}', null, '{3}' , null )", complaintID, toEmployeeID, internalStatusID, DateTime.Now.ToString());
            rowsAffected = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            TraceIt("Error in method ForwardComplaint", ex);

        }

        
        return rowsAffected;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public int SetComplaintCompleted(string complaintID, string employeeID)
    {
        int rowsAffected = 0;

        try
        {
            cmd.CommandText = string.Format("update employeecomplaint set internalstatusid = ( select internalstatusid from internalcomplaintstatus where internalstatustext = 'completed' ) where complaintid = '{0}' and employeeid = '{1}'", complaintID, employeeID);
            rowsAffected = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            TraceIt("Error in method SetComplaintCompleted", ex);

        }

        
        return rowsAffected;
    }
    [DataObjectMethod(DataObjectMethodType.Update)]
    public int SetComplaintResolved(string complaintID)
    {

        int rowsAffected = 0;
        try
        {
            cmd.CommandText = string.Format("update complaint set statusid = ( select statusid from status where statustext = 'Resolved' ) where complaintid = '{0}'", complaintID);
            rowsAffected = cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format("update employeecomplaint set internalstatusid = ( select internalstatusid from internalcomplaintstatus where internalstatustext = 'completed' ) where complaintid = '{0}' and internalstatusid <> ( select internalstatusid from internalcomplaintstatus where internalstatustext = 'forwarded' )", complaintID);
            rowsAffected = cmd.ExecuteNonQuery();
            TraceIt(rowsAffected.ToString());

            
        }
        catch (Exception ex)
        {
            TraceIt("Error in method SetComplaintResolved", ex);

        }

        
        return rowsAffected;

    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public string GetComplaintStatus(string complaintID)
    {

        string complaintStatus = string.Empty;
        try
        {
            cmd.CommandText = string.Format("select statustext from status inner join complaint on complaint.statusid = status.statusid where complaintid = '{0}'", complaintID);
            complaintStatus = (string)cmd.ExecuteScalar();


        }
        catch (Exception ex)
        {
            TraceIt("Error in method GetComplaintStatus", ex);

        }

        
        return complaintStatus;

    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetComplaintsForCustomer(string customerID)
    {


        try
        {
            cmd.CommandText = string.Format("select [complaint id], productid, product, complaint, comments, lodgedate, status from customercomplaintsview where customerid = '{0}'", customerID);
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        }
        catch (Exception ex)
        {
            TraceIt("Error in method GetComplaintsForCustomer", ex);

        }

        return reader;

    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetComplaintDetails(string complaintID)
    {
        try
        {

            cmd.CommandText = string.Format(@"select * from ComplaintDetailsView where complaintid = '{0}'", complaintID);

            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        }
        catch (Exception ex)
        {

            TraceIt("Error in GetComplaintDetails", ex);

        }
        return reader;

    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetAllComplaintDetails()
    {
        try
        {
            cmd.CommandText = "select * from complaintdetailsview";
            reader = cmd.ExecuteReader();
        }
        catch (Exception ex)
        {
            TraceIt("Error in GetAllComplaintDetails", ex);

        }
        return reader;

    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetEmployeeComplaintDetails()
    {
        try
        {
            cmd.CommandText = "select * from employeecomplaintview";
            reader = cmd.ExecuteReader();

        }
        catch (Exception ex)
        {
            TraceIt("Error in GetEmployeeComplaintDetails", ex);

        }
        return reader;
    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetAllStatus()
    {
        try
        {
            cmd.CommandText = "select * from status";
            reader = cmd.ExecuteReader();


        }
        catch (Exception ex)
        {
            TraceIt("Error in GetAllStatus", ex);

        } 
        return reader;

    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DbDataReader GetAllInternalStatus()
    {
        try
        {
            cmd.CommandText = "select * from internalcomplaintstatus";
            reader = cmd.ExecuteReader();

        }
        catch (Exception ex)
        {
            TraceIt("Error in GetAllInternalStatus", ex);

        }
        return reader;

    }
    [DataObjectMethod(DataObjectMethodType.Update)]
    public int SetComplaintStatus(string complaintid, string status)
    {
        int rowsAffected = 0;
        try
        {
            cmd.CommandText = string.Format("update complaint set statusid = ( select statusid from status where statustext = '{0}' ) where complaintid = '{1}'", status, complaintid);
            rowsAffected = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {
            TraceIt("Error in SetComplaintStatus", ex);

        }
        return rowsAffected;
        
    }
    [DataObjectMethod(DataObjectMethodType.Update)]
    public int SetComplaintStatus(string complaintid, int statusid)
    {
        int rowsAffected = 0;
        try
        {
            cmd.CommandText = string.Format("update complaint set statusid = '{0}' where complaintid = '{1}'", statusid.ToString(), complaintid);
            rowsAffected = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {
            TraceIt("Error in SetComplaintStatus", ex);

        }
        return rowsAffected;

    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public int SetInternalComplaintStatus(string complaintid, string employeeid, string internalstatus)
    {
        int rowsAffected = 0;
        try
        {
            cmd.CommandText = string.Format("update employeecomplaint set internalstatusid = ( select internalstatusid from internalcomplaintstatus where internalstatustext = '(0}' ) where complaintid = '{1}' and employeeid = '{2}'", new object[] { internalstatus, complaintid, employeeid });
            rowsAffected = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            TraceIt("Error in SetInternalComplaintStatus", ex);

        } 
        return rowsAffected;

    }
    [DataObjectMethod(DataObjectMethodType.Update)]
    public int SetInternalComplaintStatus(string complaintid, string employeeid, int internalstatusid)
    {
        int rowsAffected = 0;
        try
        {
            cmd.CommandText = string.Format("update employeecomplaint set internalstatusid =  '{0}'  where complaintid = '{1}' and employeeid = '{2}'", new object[] { internalstatusid, complaintid, employeeid });
            rowsAffected = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            TraceIt("Error in SetInternalComplaintStatus", ex);

        }
        return rowsAffected;

    }

    private void TraceIt(string message, Exception ex)
    {
        HttpContext.Current.Trace.Write("DAL", message + "\n" + ex.Source + "\n" + ex.StackTrace + "\n" + ex.Message);
    }
    private void TraceIt(string message)
    {
        HttpContext.Current.Trace.Write("DAL", message);
    }


    #region IDisposable Members

    void IDisposable.Dispose()
    {
        
    }

    #endregion
}
