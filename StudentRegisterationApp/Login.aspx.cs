using System;
using System.Data;
using System.Web.UI;

namespace StudentRegisterationApp
{
    public partial class Login : Page
    {
        ConnectionClass conn = new ConnectionClass();

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "SELECT StudentId FROM Students WHERE Username='" + TextBox1.Text + "' AND Password='" + TextBox2.Text + "'";
                DataTable dt = conn.Fn_Exetendable(query); 

                if (dt.Rows.Count > 0)
                {
                    Session["StudentId"] = dt.Rows[0]["StudentId"].ToString(); 
                    Response.Redirect("StudentList.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid login credentials');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
