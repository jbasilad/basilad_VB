<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: white;
            width: 500px;
            margin: 100px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #333;
        }

        .welcome {
            margin: 20px 0;
            font-size: 18px;
            color: #555;
        }

        .btn {
            background-color: #0078D7;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #005EA6;
        }

        .info {
            margin-top: 15px;
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Welcome</h2>
            <asp:Label ID="lblUser" runat="server" CssClass="welcome"></asp:Label><br />
            <asp:Label ID="lblEmail" runat="server" CssClass="info"></asp:Label><br /><br />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn" />
        </div>
    </form>
</body>
</html>
