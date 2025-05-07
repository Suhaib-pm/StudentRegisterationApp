<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="StudentRegistrationApp.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>
    <style>
        .error-message { color: red; font-size: small; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        table, th, td { border: 1px solid black; padding: 5px; }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#form1").submit(function (e) {
                $(".error-message").remove(); // Remove old errors
                let isValid = true;

                function showError(selector, message) {
                    $(selector).after('<div class="error-message">' + message + '</div>');
                    isValid = false;
                }

            
                let firstName = $("#<%= TextBox1.ClientID %>").val().trim();
                if (!firstName) showError("#<%= TextBox1.ClientID %>", "First Name is required");

               
                let lastName = $("#<%= TextBox2.ClientID %>").val().trim();
                if (!lastName) showError("#<%= TextBox2.ClientID %>", "Last Name is required");

           
                let age = $("#<%= TextBox3.ClientID %>").val().trim();
                if (!age || isNaN(age) || age <= 0) showError("#<%= TextBox3.ClientID %>", "Valid Age is required");

               
                let dob = $("#<%= TextBox4.ClientID %>").val().trim();
                if (!dob) showError("#<%= TextBox4.ClientID %>", "Date of Birth is required");

             
                let gender = $("#<%= DropDownList1.ClientID %>").val();
                if (!gender) showError("#<%= DropDownList1.ClientID %>", "Gender is required");

      
                let email = $("#<%= TextBox5.ClientID %>").val().trim();
                let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!email || !emailRegex.test(email)) showError("#<%= TextBox5.ClientID %>", "Valid Email is required");

             
                let phone = $("#<%= TextBox6.ClientID %>").val().trim();
                let phoneRegex = /^[0-9]{10}$/;
                if (!phone || !phoneRegex.test(phone)) showError("#<%= TextBox6.ClientID %>", "Valid 10-digit Phone is required");

             
                let username = $("#<%= TextBox7.ClientID %>").val().trim();
                if (!username) showError("#<%= TextBox7.ClientID %>", "Username is required");

              
                let password = $("#<%= TextBox8.ClientID %>").val().trim();
                if (!password) showError("#<%= TextBox8.ClientID %>", "Password is required");

         
                $("#qualificationTable input").each(function () {
                    if (!$(this).val().trim()) {
                        showError($(this), "All qualification fields are required");
                    }
                });

                if (!isValid) e.preventDefault();
            });

          
            $("#btnAddQualification").click(function () {
                let newRow = `<tr>
                    <td><input type="text" name="courseName[]" required /></td>
                    <td><input type="text" name="percentage[]" required /></td>
                    <td><input type="text" name="yearOfPassing[]" required /></td>
                    <td><button type="button" class="btn-remove">Remove</button></td>
                </tr>`;
                $("#qualificationTable").append(newRow);
            });

       
            $(document).on("click", ".btn-remove", function () {
                $(this).closest("tr").remove();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 50%; margin: auto;">
            <h2>Student Registration</h2>

            <label>First Name:</label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />

            <label>Last Name:</label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />

            <label>Age:</label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />

            <label>DOB:</label>
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox><br />

            <label>Gender:</label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
                <asp:ListItem Text="Other" Value="Other" />
            </asp:DropDownList><br />

            <label>Email:</label>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><br />

            <label>Phone:</label>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox><br />

            <label>Username:</label>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox><br />

            <label>Password:</label>
            <asp:TextBox ID="TextBox8" runat="server" TextMode="Password"></asp:TextBox><br />

            <h3>Qualification Details</h3>
            <table>
                <thead>
                    <tr>
                        <th>Course Name</th>
                        <th>Percentage</th>
                        <th>Year of Passing</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="qualificationTable">
                    <tr>
                        <td><input type="text" name="courseName[]" required /></td>
                        <td><input type="text" name="percentage[]" required /></td>
                        <td><input type="text" name="yearOfPassing[]" required /></td>
                        <td><button type="button" id="btnAddQualification">Add</button></td>
                    </tr>
                </tbody>
            </table>

            <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>
