<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Start.aspx.cs" Inherits="StudentRegisterationApp.Home1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 50%; margin: auto; text-align: center;">
            <h2>Student Registration</h2>

            <p><asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="Home.aspx">Go to Registration Page</asp:HyperLink></p>
            <p><asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="Login.aspx">Go to Login</asp:HyperLink></p>
            <p><asp:HyperLink ID="lnkStudentList" runat="server" NavigateUrl="StudentList.aspx">View Registered Students</asp:HyperLink></p>
        </div>
    </form>
</body>
</html>
