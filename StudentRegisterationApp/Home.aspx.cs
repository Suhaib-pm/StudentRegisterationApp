using System;
using System.Web.UI;
using StudentRegisterationApp; 

namespace StudentRegistrationApp
{
    public partial class Home : Page
    {
        ConnectionClass conn = new ConnectionClass(); 

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                
                string studentQuery = "INSERT INTO Students (FirstName, LastName, Age, DOB, Gender, Email, Phone, Username, Password) VALUES " +
                                      "('" + TextBox1.Text + "', '" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + TextBox4.Text + "', " +
                                      "'" + DropDownList1.SelectedValue + "', '" + TextBox5.Text + "', '" + TextBox6.Text + "', '" + TextBox7.Text + "', '" + TextBox8.Text + "');";

                int StudentId = conn.Fun_exenonquery(studentQuery);

                
                string[] courseNames = Request.Form.GetValues("courseName[]") ?? new string[0];
                string[] percentages = Request.Form.GetValues("percentage[]") ?? new string[0];
                string[] yearsOfPassing = Request.Form.GetValues("yearOfPassing[]") ?? new string[0];

                for (int i = 0; i < courseNames.Length; i++)
                {
                    if (!string.IsNullOrWhiteSpace(courseNames[i]) &&
                        !string.IsNullOrWhiteSpace(percentages[i]) &&
                        !string.IsNullOrWhiteSpace(yearsOfPassing[i]))
                    {
                        string qualificationQuery = "INSERT INTO Qualifications (StudentId, CourseName, Percentage, YearOfPassing) VALUES " +
                            "(" + StudentId + ", '" + courseNames[i] + "', '" + percentages[i] + "', '" + yearsOfPassing[i] + "');";



                        conn.Fun_exenonquery(qualificationQuery);
                    }
                }

                Response.Write("<script>alert('Registration Successful!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
