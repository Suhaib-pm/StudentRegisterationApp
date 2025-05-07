<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="StudentRegisterationApp.StudentList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Your Details</h2>
            <asp:Panel ID="pnlStudentDetails" runat="server">
                <p><strong>ID:</strong> <asp:Label ID="lblStudentId" runat="server" /></p>
                <p><strong>First Name:</strong> <asp:Label ID="lblFirstName" runat="server" /></p>
                <p><strong>Last Name:</strong> <asp:Label ID="lblLastName" runat="server" /></p>
                <p><strong>Age:</strong> <asp:Label ID="lblAge" runat="server" /></p>
                <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
                <p><strong>Phone:</strong> <asp:Label ID="lblPhone" runat="server" /></p>
            </asp:Panel>

            <h3>Your Qualifications</h3>
            <asp:GridView ID="gvQualifications" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="CourseName" HeaderText="Course Name"/>
                    <asp:BoundField DataField="Percentage" HeaderText="Percentage"/>
                    <asp:BoundField DataField="YearOfPassing" HeaderText="Year of Passing"/>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
