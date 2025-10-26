<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Register.aspx.vb" Inherits="VBLoginProject.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Register | VB Login System</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            font-family: "Poppins", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        form {
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 40px 45px;
            width: 350px;
            text-align: center;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.3);
            z-index: 2;
        }

        h2 {
            color: #fff;
            font-size: 26px;
            font-weight: 700;
            margin-bottom: 25px;
            text-shadow: 0 0 5px rgba(255,255,255,0.6);
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="number"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border: none;
            border-radius: 10px;
            outline: none;
            background: rgba(255, 255, 255, 0.5);
            color: #000;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        input:focus {
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 0 10px rgba(0, 150, 255, 0.5);
        }

        ::placeholder {
            color: #333;
        }

        .btn {
            background: linear-gradient(90deg, #00bfff, #0072ff);
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 30px;
            padding: 12px 20px;
            width: 160px;
            margin-top: 20px;
            font-size: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 0 10px rgba(0, 191, 255, 0.5);
        }

        .btn:hover {
            background: linear-gradient(90deg, #0099ff, #00c6ff);
            box-shadow: 0 0 20px rgba(0, 191, 255, 0.7);
            transform: scale(1.05);
        }

        .msg {
            color: #ff4444;
            font-size: 13px;
            margin-top: 8px;
        }

        a {
            display: block;
            margin-top: 20px;
            color: #ffffff;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            transition: 0.3s;
        }

        a:hover {
            color: #000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Register</h2>

        <asp:TextBox ID="txtFullName" runat="server" placeholder="Full Name"></asp:TextBox><br />
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Email"></asp:TextBox><br />
        <asp:TextBox ID="txtAge" runat="server" TextMode="Number" placeholder="Age"></asp:TextBox><br />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox><br />
        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox><br />

        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" /><br />
        <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label><br />

        <a href="Login.aspx">Already have an account?</a>
    </form>
</body>
</html>
