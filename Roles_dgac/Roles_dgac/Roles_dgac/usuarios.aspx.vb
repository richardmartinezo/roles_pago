Public Class usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("autorizacionPASSWORD") = False Then
            Response.Redirect("default.aspx")
        End If
        If Not Session("administrador") Then
            Response.Redirect("default.aspx")
        End If

    End Sub

    Protected Sub SqlDataSource1_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Updated

    End Sub

    Protected Sub ASPxButton2_Click(sender As Object, e As EventArgs) Handles ASPxButton2.Click
        Session.Clear()
        Response.Redirect("default.aspx")
    End Sub
End Class