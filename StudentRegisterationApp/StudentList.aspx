<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="StudentRegisterationApp.StudentList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center;">
            <h2>Your Personal Details</h2>
            <p><strong>Student ID:</strong> <asp:Label ID="Label1" runat="server" Text="" /></p>
            <p><strong>First Name:</strong> <asp:Label ID="Label2" runat="server" Text="" /></p>
            <p><strong>Last Name:</strong> <asp:Label ID="Label3" runat="server" Text="" /></p>
            <p><strong>Age:</strong> <asp:Label ID="Label4" runat="server" Text="" /></p>
            <p><strong>Email:</strong> <asp:Label ID="Label5" runat="server" Text="" /></p>
            <p><strong>Phone:</strong> <asp:Label ID="Label6" runat="server" Text="" /></p>

            <h3>Your Qualifications</h3>
            <div align="center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                              BorderWidth="1px" CellPadding="4" GridLines="Both">
                    <Columns>
                        <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                        <asp:BoundField DataField="Percentage" HeaderText="Percentage" />
                        <asp:BoundField DataField="YearOfPassing" HeaderText="Year of Passing" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
