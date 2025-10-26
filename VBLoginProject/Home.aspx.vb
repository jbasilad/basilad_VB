Public Class Home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' 🔒 Redirect user to Login page if not logged in
        If Session("fullname") Is Nothing Then
            Response.Redirect("Login.aspx")
        Else
            ' ✅ Display logged-in user's name and email
            lblUser.Text = "This is, " & Session("fullname").ToString() & "!"

        End If
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As EventArgs) Handles btnLogout.Click
        ' 🚪 Clear session and redirect to login
        Session.Abandon()
        Response.Redirect("Login.aspx")
    End Sub
End Class
