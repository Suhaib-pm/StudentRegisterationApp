using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace StudentRegisterationApp
{
    public partial class StudentList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] != null)
                {
                    LoadStudentDetails(Session["UserId"].ToString());
                    LoadQualifications(Session["UserId"].ToString());
                }
                else
                {
                    Response.Redirect("Login.aspx"); 
                }
            }
        }

        private void LoadStudentDetails(string userId)
        {
            string connectionString = @"server=DESKTOP-SOADOMN\SQLEXPRESS;database=StudentRegistrationDB; Integrated security=true";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"SELECT StudentId, FirstName, LastName, Age, Email, Phone FROM Students WHERE StudentId = @UserId";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        lblStudentId.Text = reader["StudentId"].ToString();
                        lblFirstName.Text = reader["FirstName"].ToString();
                        lblLastName.Text = reader["LastName"].ToString();
                        lblAge.Text = reader["Age"].ToString();
                        lblEmail.Text = reader["Email"].ToString();
                        lblPhone.Text = reader["Phone"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        private void LoadQualifications(string userId)
        {
            string connectionString = @"server=DESKTOP-SOADOMN\SQLEXPRESS;database=StudentRegistrationDB; Integrated security=true";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"SELECT CourseName, Percentage, YearOfPassing FROM Qualifications WHERE StudentId = @UserId";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvQualifications.DataSource = dt;
                    gvQualifications.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}
