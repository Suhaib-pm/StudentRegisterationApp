using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace StudentRegisterationApp
{
    public partial class Login : Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = @"server=DESKTOP-SOADOMN\SQLEXPRESS;database=StudentRegistrationDB; Integrated security=true";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT StudentId FROM Students WHERE Username=@Username AND Password=@Password";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Username", txtLoginUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtLoginPassword.Text);

                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        Session["UserId"] = result.ToString();
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
}
