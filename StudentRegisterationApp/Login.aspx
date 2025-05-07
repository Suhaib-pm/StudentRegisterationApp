<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentRegisterationApp.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center;">
            <h2>Login</h2>

            <label>Username:</label>
            <asp:TextBox ID="txtLoginUsername" runat="server"></asp:TextBox><br><br>

            <label>Password:</label>
            <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password"></asp:TextBox><br><br>

            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
        </div>
    </form>
</body>
</html>
