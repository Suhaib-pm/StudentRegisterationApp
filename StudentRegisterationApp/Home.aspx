<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="StudentRegisterationApp.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.19.3/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                    txtFirstName: "required",
                    txtLastName: "required",
                    txtAge: { required: true, digits: true, min: 18, max: 100 },
                    txtDOB: "required",
                    ddlGender: "required",
                    txtEmail: { required: true, email: true },
                    txtPhone: { required: true, minlength: 10, digits: true },
                    txtUsername: "required",
                    txtPassword: { required: true, minlength: 6 },
                    "courseName[]": "required",
                    "percentage[]": { required: true, digits: true },
                    "yearOfPassing[]": { required: true, digits: true }
                },
                messages: {
                    txtFirstName: "Please enter your first name",
                    txtLastName: "Please enter your last name",
                    txtAge: "Please enter a valid age (18-100)",
                    txtDOB: "Please select your date of birth",
                    ddlGender: "Please select your gender",
                    txtEmail: "Please enter a valid email address",
                    txtPhone: "Please enter a valid phone number (minimum 10 digits)",
                    txtUsername: "Please enter a username",
                    txtPassword: "Password must be at least 6 characters long",
                    "courseName[]": "Please enter course name",
                    "percentage[]": "Please enter a valid percentage",
                    "yearOfPassing[]": "Please enter a valid year"
                },
                errorPlacement: function (error, element) {
                    error.insertAfter(element);
                }
            });

            // Fix: Ensure dynamic rows are added properly
            $(document).on("click", "#btnAddQualification", function () {
                var newRow = `<tr>
                    <td><input type="text" name="courseName[]" required/></td>
                    <td><input type="text" name="percentage[]" required/></td>
                    <td><input type="text" name="yearOfPassing[]" required/></td>
                    <td><button type="button" class="btn-remove">Remove</button></td>
                </tr>`;
                $("#qualificationTable").append(newRow); // Append below the last entered row
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
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox><br>

            <label>Last Name:</label>
            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox><br>

            <label>Age:</label>
            <asp:TextBox ID="txtAge" runat="server"></asp:TextBox><br>

            <label>DOB:</label>
            <asp:TextBox ID="txtDOB" runat="server" TextMode="Date"></asp:TextBox><br>

            <label>Gender:</label>
            <asp:DropDownList ID="ddlGender" runat="server">
                <asp:ListItem Text="Male" Value="Male"/>
                <asp:ListItem Text="Female" Value="Female"/>
                <asp:ListItem Text="Other" Value="Other"/>
            </asp:DropDownList><br>

            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br>

            <label>Phone:</label>
            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox><br>

            <label>Username:</label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox><br>

            <label>Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br>

            <h3>Qualification Details</h3>
            <table border="1" width="100%">
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
                        <td><input type="text" name="courseName[]" required/></td>
                        <td><input type="text" name="percentage[]" required/></td>
                        <td><input type="text" name="yearOfPassing[]" required/></td>
                        <td><button type="button" id="btnAddQualification">Add</button></td>
                    </tr>
                </tbody>
            </table>

            <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click"/>
        </div>
    </form>
</body>
</html>
