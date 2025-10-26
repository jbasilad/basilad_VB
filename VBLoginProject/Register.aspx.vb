Imports MySql.Data.MySqlClient

Public Class Register
    Inherits System.Web.UI.Page

    Dim conn As New MySqlConnection("server=localhost;userid=root;password=cinematicket;database=basilad_db;SslMode=none;AllowPublicKeyRetrieval=True")

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        lblMsg.Text = ""

        ' Validation: All fields must be filled
        If txtFullName.Text.Trim() = "" OrElse txtEmail.Text.Trim() = "" OrElse
           txtAge.Text.Trim() = "" OrElse txtPassword.Text.Trim() = "" OrElse
           txtConfirmPassword.Text.Trim() = "" Then
            lblMsg.Text = "⚠ Please fill out all fields."
            Exit Sub
        End If

        ' Confirm Password check
        If txtPassword.Text.Trim() <> txtConfirmPassword.Text.Trim() Then
            lblMsg.Text = "❌ Passwords do not match!"
            Exit Sub
        End If

        Try
            conn.Open()

            ' Optional: Check if email already exists
            Dim checkCmd As New MySqlCommand("SELECT COUNT(*) FROM users WHERE email=@e", conn)
            checkCmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim())
            Dim exists As Integer = Convert.ToInt32(checkCmd.ExecuteScalar())
            If exists > 0 Then
                lblMsg.Text = "❌ Email already registered!"
                Exit Sub
            End If

            ' Insert user into database (plain text password)
            Dim cmd As New MySqlCommand("INSERT INTO users (fullname, email, age, password) VALUES (@f, @e, @a, @p)", conn)
            cmd.Parameters.AddWithValue("@f", txtFullName.Text.Trim())
            cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim())
            cmd.Parameters.AddWithValue("@a", txtAge.Text.Trim())
            cmd.Parameters.AddWithValue("@p", txtPassword.Text.Trim())
            cmd.ExecuteNonQuery()

            lblMsg.Text = "✅ Registered successfully! Redirecting to login..."
            conn.Close()

            ' Redirect after 2 seconds
            Response.AddHeader("REFRESH", "2;URL=Login.aspx")

        Catch ex As MySqlException
            lblMsg.Text = "Error: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub
End Class
