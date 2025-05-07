using System;
using System.Data;
using System.Web.UI;

namespace StudentRegisterationApp
{
    public partial class StudentList : Page
    {
        ConnectionClass con = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StudentId"] != null)
                {
                    string studentId = Session["StudentId"].ToString();
                    LoadStudentDetails(studentId);
                    LoadQualifications(studentId);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

       
        private void LoadStudentDetails(string studentId)
        {
            string query = "SELECT * FROM Students WHERE StudentId = " + studentId;
            DataTable dt = con.Fn_Exetendable(query);

            if (dt.Rows.Count > 0)
            {
                Label1.Text = dt.Rows[0]["StudentId"].ToString(); 
                Label2.Text = dt.Rows[0]["FirstName"].ToString();  
                Label3.Text = dt.Rows[0]["LastName"].ToString();   
                Label4.Text = dt.Rows[0]["Age"].ToString();       
                Label5.Text = dt.Rows[0]["Email"].ToString();      
                Label6.Text = dt.Rows[0]["Phone"].ToString();      
            }
        }

      
        private void LoadQualifications(string studentId)
        {
            string query = "SELECT CourseName, Percentage, YearOfPassing FROM Qualifications WHERE StudentId = " + studentId;
            DataTable dt = con.Fn_Exetendable(query);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}
