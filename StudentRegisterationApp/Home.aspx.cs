using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace StudentRegisterationApp
{
    public partial class Home : Page
    {
        string connectionString = @"server=DESKTOP-SOADOMN\SQLEXPRESS;database=StudentRegistrationDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValidInput()) 
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    try
                    {
                        con.Open();

                        string studentQuery = "INSERT INTO Students (FirstName, LastName, Age, DOB, Gender, Email, Phone, Username, Password) " +
                                              "VALUES (@FirstName, @LastName, @Age, @DOB, @Gender, @Email, @Phone, @Username, @Password); " +
                                              "SELECT SCOPE_IDENTITY();";

                        SqlCommand cmd = new SqlCommand(studentQuery, con);
                        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Age", txtAge.Text.Trim());
                        cmd.Parameters.AddWithValue("@DOB", txtDOB.Text.Trim());
                        cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                        int studentId = Convert.ToInt32(cmd.ExecuteScalar());

                        string[] courseNames = Request.Form.GetValues("courseName[]") ?? new string[0];

                        for (int i = 0; i < courseNames.Length; i++)
                        {
                            string qualificationQuery = "INSERT INTO Qualifications (StudentId, CourseName, Percentage, YearOfPassing) VALUES (@StudentId, @CourseName, @Percentage, @YearOfPassing)";
                            SqlCommand cmdQual = new SqlCommand(qualificationQuery, con);
                            cmdQual.Parameters.AddWithValue("@StudentId", studentId);
                            cmdQual.Parameters.AddWithValue("@CourseName", courseNames[i].Trim());
                            cmdQual.ExecuteNonQuery();
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                }
            }
        }

        private bool IsValidInput()
        {
            return !string.IsNullOrWhiteSpace(txtFirstName.Text) &&
                   !string.IsNullOrWhiteSpace(txtUsername.Text) &&
                   !string.IsNullOrWhiteSpace(txtPassword.Text);
        }
    }
}
