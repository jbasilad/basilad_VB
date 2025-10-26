Imports MySql.Data.MySqlClient

Public Class Login
    Inherits System.Web.UI.Page

    Dim conn As New MySqlConnection("server=localhost;userid=root;password=cinematicket;database=basilad_db;SslMode=none;AllowPublicKeyRetrieval=True")

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblMsg.Text = ""

        ' ✅ Redirect to Home only if logged in AND not already on Home page
        If Not IsPostBack AndAlso Session("username") IsNot Nothing Then
            Response.Redirect("Home.aspx", False)
        End If
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        lblMsg.Text = ""

        If txtEmail.Text.Trim() = "" OrElse txtPassword.Text.Trim() = "" Then
            lblMsg.Text = "⚠ Please enter your email and password!"
            Exit Sub
        End If

        Try
            conn.Open()
            Dim cmd As New MySqlCommand("SELECT * FROM users WHERE email=@e AND password=@p", conn)
            cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim())
            cmd.Parameters.AddWithValue("@p", txtPassword.Text.Trim())

            Dim dr As MySqlDataReader = cmd.ExecuteReader()

            If dr.HasRows Then
                dr.Read()
                Session("fullname") = dr("fullname").ToString()
                Session("email") = dr("email").ToString()
                Response.Redirect("Home.aspx", False)
            Else
                lblMsg.Text = "❌ Invalid email or password!"
            End If

            dr.Close()
            conn.Close()
        Catch ex As Exception
            lblMsg.Text = "❌ Error: " & ex.Message
        End Try
    End Sub
End Class
