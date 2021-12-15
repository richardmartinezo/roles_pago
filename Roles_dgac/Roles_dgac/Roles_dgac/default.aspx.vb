Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text
Imports System
Imports System.Data

Imports System.Data.Odbc
Imports System.Net
Imports System.Threading
Imports System.Reflection
Imports System.Net.Mail
Imports System.IO

Public Class _default
    Inherits System.Web.UI.Page
    Private Shared TripleDES As New TripleDESCryptoServiceProvider
    Private Shared MD5 As New MD5CryptoServiceProvider
    Private Const key As String = "dacrtser533ww123"
#Region " Region de Codigo para el encriptacion encrypt y desencrypt"
    Public Shared Function MD5Hash(ByVal value As String) As Byte()

        Dim byteArray() As Byte = ASCIIEncoding.ASCII.GetBytes(value)
        Return MD5.ComputeHash(byteArray)

    End Function

    Public Shared Function Encrypt(ByVal stringToEncrypt As String) As String

        Try

            ' Definição da chave e da cifra (que neste caso é Electronic
            ' Codebook, ou seja, encriptação individual para cada bloco)
            TripleDES.Key = _default.MD5Hash(key)
            TripleDES.Mode = CipherMode.ECB

            ' Converte a string para bytes e encripta
            Dim Buffer As Byte() = ASCIIEncoding.ASCII.GetBytes(stringToEncrypt)
            Return Convert.ToBase64String(TripleDES.CreateEncryptor().TransformFinalBlock(Buffer, 0, Buffer.Length))

        Catch ex As Exception

            Return String.Empty

        End Try
    End Function

    Public Shared Function Decrypt(ByVal encryptedString As String) As String

        Try

            ' Definição da chave e da cifra
            TripleDES.Key = MD5Hash(key)
            TripleDES.Mode = CipherMode.ECB

            ' Converte a string encriptada para bytes e decripta
            Dim Buffer As Byte() = Convert.FromBase64String(encryptedString)
            Return ASCIIEncoding.ASCII.GetString(TripleDES.CreateDecryptor().TransformFinalBlock(Buffer, 0, Buffer.Length))

        Catch ex As Exception

            Return String.Empty

        End Try

    End Function


#End Region
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPxButton2_Click(sender As Object, e As EventArgs) Handles ASPxButton2.Click
        Dim con As New SqlClient.SqlConnection
        Dim strCon As String = "Data Source=win-sqlserv-01;Initial Catalog=roles_dgac;User ID=adminsql;Password=sistema*-!;"
        con.ConnectionString = strCon
        con.Open()
        Session("administrador") = False
        Dim datablasdgac As New SqlDataAdapter("select * from funcionarios where CEDULA= '" & Me.Textuser.Text & "'", con)
        Dim dataset As New DataSet("datasetablas")
        datablasdgac.Fill(dataset)
        Dim tablasdgac As DataTable
        tablasdgac = dataset.Tables(0)
       
        If tablasdgac.Rows.Count = 0 Then
            ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "ASPxPopupControl2.Show();", True)
        Else
            Session("administrador") = tablasdgac.Rows(0)("administrador")
            Session("autorizacionPASSWORD") = False
            Session("cedula") = tablasdgac.Rows(0)("cedula")
            If IsDBNull(tablasdgac.Rows(0)("PASSWORD")) Then
                'EL USUARIO NO TIENE PASSWORD
                'El usuario tiene fecha de nacimiento registrada
                If tablasdgac.Rows(0)("FECHA_NACIMIENTO") <> "01/01/2015" Then
                    Try
                        If tablasdgac.Rows(0)("FECHA_NACIMIENTO") <> Convert.ToDateTime(Textpass.Text) Then
                            'el password por defaul no corresponde a la fecha de nacimiento
                            ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "ASPxPopupControl2.Show();", True)
                            Exit Sub
                        End If
                    Catch ex As Exception
                        ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "ASPxPopupControl2.Show();", True)

                    End Try

                End If
                Session("autorizacionPASSWORD") = True
                'Session("mail") = tablasdgac.Rows(0)("correos")
                ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "ASPxPopupControl1.Show();", True)
                Exit Sub
            Else
                Session("autorizacionPASSWORD") = True
                If Textpass.Text = Decrypt(tablasdgac.Rows(0)("PASSWORD")) Then
                    Session("autorizacion") = True
                    'Session("mail") = tablasdgac.Rows(0)("correos")
                    'If IsDBNull(Session("mail")) Then
                    '    Session("mail") = "nothing"
                    'End If
                    'mail(Session("mail"), "Acceso registrado al sistema de confidenciales fecha = " & Now() & " Dirección ip del computador cliente = " & GetLanIPAddress())

                    Response.Redirect("Roles_web.aspx")
                Else
                    ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "ASPxPopupControl2.Show();", True)

                End If


            End If

            'Session.Contents.RemoveAll()

            'Session("nombre_usuario") = tablasdgac.Rows(0)("sic_login_username")
            'Session("oid_usuario") = tablasdgac.Rows(0)("sic_login_oid")
            'Session("usuario_mail") = tablasdgac.Rows(0)("sic_login_email")
            'Session("oid_login_nivelacceso") = tablasdgac.Rows(0)("sic_login_nivelacceso").ToString.Trim
            'Session("tiempo_entrada") = Now()

            'If Session("oid_login_nivelacceso") = "A" Or Session("oid_login_nivelacceso") = "F" Or Session("oid_login_nivelacceso") = "R" Then
            'Session("autorizacion") = True
            'Response.Redirect("Dayli_digital.aspx")
            'End If

        End If
        con.Close()
        Me.Textuser.Text = ""
        Me.Textpass.Text = ""
    End Sub

    Protected Sub ASPxButton4_Click(sender As Object, e As EventArgs) Handles ASPxButton4.Click
        ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "ASPxPopupControl1.Hide();", True)
    End Sub

    Protected Sub UpdatePanel2_Unload(sender As Object, e As EventArgs)
        RegisterUpdatePanel(DirectCast(sender, UpdatePanel))
    End Sub

    Protected Sub RegisterUpdatePanel(ByVal panel As UpdatePanel)
        Dim sType = GetType(ScriptManager)
        Dim mInfo = sType.GetMethod("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel", BindingFlags.NonPublic Or BindingFlags.Instance)
        If mInfo IsNot Nothing Then
            mInfo.Invoke(ScriptManager.GetCurrent(Page), New Object() {panel})
        End If
    End Sub

    Protected Sub ASPxButton3_Click(sender As Object, e As EventArgs) Handles ASPxButton3.Click


        Dim strCon As String = "Data Source=win-sqlserv-01;Initial Catalog=roles_dgac;User ID=adminsql;Password=sistema*-!;"
        If (pass1.Text <> pass2.Text) Or (pass1.Text = "") Then
            pass2.Text = ""
            pass1.Text = ""
            ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "alert('Las contraseñas no coinciden, o ingreso no válido');", True)
            Exit Sub

        End If
        Dim strSQL As String
        Dim sqlCmd As SqlCommand
        Dim sqlConn As SqlConnection
        Dim nuevopass As String
        nuevopass = Encrypt(pass1.Text)

        strSQL = "update FUNCIONARIOS set PASSWORD = '" & nuevopass & "' where CEDULA = '" & Session("cedula") & "'"
        sqlConn = New SqlConnection(strCon)
        sqlCmd = New SqlCommand(strSQL, sqlConn)

        sqlConn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()

        mail(Session("mail"), "Registro en el sistema de confidenciales fecha = " & Now() & " Se ha creado una clave de acceso para su usuario =  " & pass1.Text & " Dirección ip del computador cliente = " & GetLanIPAddress())

        pass2.Text = ""
        pass1.Text = ""
        Textuser.Text = ""
        Textpass.Text = ""

        ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "alert('La nueva clave ha sido aceptada, por favor ingrese nuevamente');", True)
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ClientScript", "cbTest.PerformCallback();", True)

    End Sub

    Protected Sub UpdatePanel3_Unload(sender As Object, e As EventArgs) Handles UpdatePanel3.Unload, UpdatePanel2.Unload
        RegisterUpdatePanel(DirectCast(sender, UpdatePanel))
    End Sub


    Protected Sub ASPxCallback1_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles cbTestdac.Callback
        Dim i = 1
        cbTestdac.JSProperties("cpText") = "cerrar"
    End Sub

    Protected Sub mail(mailtext As String, mensaje As String)
        On Error Resume Next

        Dim mail As New MailMessage()
        mail.From = New MailAddress("no_reply@aviacioncivil.gob.ec") 'comprobantes.electronicos@aviacioncivil.gob.ec CEDGAC seadacweb@aviacioncivil.gob.ec dgac2122
        'mail.To.Add(mailtext)
        mail.To.Add(mailtext)

        mail.Subject = "Confidenciales acceso a su cuenta!" & Now()
        mail.Body = mensaje
        Dim smtp As New SmtpClient("172.20.16.16")
        smtp.Credentials = New System.Net.NetworkCredential("DGAC\no_reply", "dgac2351")

        'smtp.Send(mail)

        smtp.Send(mail)
     

    End Sub

    Public Function GetLanIPAddress() As [String]
        On Error Resume Next
        'The X-Forwarded-For (XFF) HTTP header field is a de facto standard for identifying the originating IP address of a 
        'client connecting to a web server through an HTTP proxy or load balancer
        Dim ip As [String] = HttpContext.Current.Request.ServerVariables("HTTP_X_FORWARDED_FOR")

        If String.IsNullOrEmpty(ip) Then
            ip = HttpContext.Current.Request.ServerVariables("REMOTE_ADDR")
        End If

        Return ip
    End Function

End Class