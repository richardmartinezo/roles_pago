Imports System.Reflection
Imports System.Data.SqlClient

Public Class Roles_web
    Inherits System.Web.UI.Page
    Public indice As Int16

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("autorizacionPASSWORD") = False Then
            Response.Redirect("default.aspx")
        End If
        On Error Resume Next
        'Session("cedula") = "11111"

        Dim con As New SqlClient.SqlConnection
        Dim strCon As String = "Data Source=win-sqlserv-01;Initial Catalog=roles_dgac;User ID=adminsql;Password=sistema*-!;"
        con.ConnectionString = strCon
        con.Open()
        Dim datablasdgac As New SqlDataAdapter("select * from funcionarios where CEDULA= '" & Session("cedula") & "'", con)
        Dim dataset As New DataSet("datasetablas")
        datablasdgac.Fill(dataset)
        Dim tablasdgac As DataTable
        tablasdgac = dataset.Tables(0)
        Session("EXT_TELEFONO") = tablasdgac.Rows(0)("EXT_TELEFONO")
        Session("ID_CIUDADES") = tablasdgac.Rows(0)("ID_CIUDADES")
        Session("PISO") = tablasdgac.Rows(0)("PISO")
        Session("CORREOS") = tablasdgac.Rows(0)("CORREOS")
        Session("DIR_DOMICILIO") = tablasdgac.Rows(0)("DIR_DOMICILIO")
        Session("E_MAILPERSONAL") = tablasdgac.Rows(0)("E_MAILPERSONAL")
        Session("N_CELULAR") = tablasdgac.Rows(0)("N_CELULAR")
        Session("N_CONVENCIONAL") = tablasdgac.Rows(0)("N_CONVENCIONAL")
        Session("N_VACUNAS") = tablasdgac.Rows(0)("N_VACUNAS")
        Session("MARCA_VACUNA") = tablasdgac.Rows(0)("MARCA_VACUNA")
        If (IsDBNull(Session("N_VACUNAS"))) Then
            Session("N_VACUNAS") = 0
        End If

       


        If Not Page.IsPostBack Then

            ASPxRadioButtonList_vacunas.Items.Clear()
            ASPxRadioButtonList_vacunas.Items.Add("0 Dosis / No Vacunado", 0)
            ASPxRadioButtonList_vacunas.Items.Add("1 Dosis", 1)
            If (Not Session("MARCA_VACUNA") = "CanSino") Then
                ASPxRadioButtonList_vacunas.Items.Add("2 Dosis", 2)
            End If
            Session("bloqueo") = 0

            If (Not (Session("EXT_TELEFONO") = vbNull)) Then
                ASPxComboBox1.Value = Integer.Parse(Session("ID_CIUDADES").ToString)
            End If
            If (Not (Session("ID_CIUDADES") = vbNull)) Then
                ASPxTextBox2.Text = Session("EXT_TELEFONO").ToString.Trim
            End If
            If (Not (Session("PISO") = vbNull)) Then
                ASPxTextBox4.Text = Session("PISO").ToString.Trim
            End If
            If (Not (Session("CORREOS") = vbNull)) Then
                ASPxTextBox3.Text = Session("CORREOS").ToString.Trim
            End If
            If (Not (Session("DIR_DOMICILIO") = vbNull)) Then
                ASPxTextBox_dirdom.Text = Session("DIR_DOMICILIO").ToString.Trim
            End If
            If (Not (Session("E_MAILPERSONAL") = vbNull)) Then
                ASPxTextBox_email.Text = Session("E_MAILPERSONAL").ToString.Trim
            End If
            If (Not (Session("N_CELULAR") = vbNull)) Then
                ASPxTextBox_celu.Text = Session("N_CELULAR").ToString.Trim
            End If
            If (Not (Session("N_CONVENCIONAL") = vbNull)) Then
                ASPxTextBox_telcon.Text = Session("N_CONVENCIONAL").ToString.Trim
            End If

            ASPxRadioButtonList_vacunas.SelectedIndex = Session("N_VACUNAS")

            If (Not (Session("MARCA_VACUNA") = vbNull)) Then
                ASPxComboBox_vacuna.Value = Session("MARCA_VACUNA")
            End If

        End If


        If IsDBNull(Session("administrador")) Then
            button_admin.Visible = False
        Else
            If Session("administrador") = True Then
                button_admin.Visible = True
            End If
        End If
        '
        Dim fechaActual As DateTime = DateTime.Now

        If combomes.Value = fechaActual.AddMonths(-1) Then
            Session("mes") = combomes.Value
        ElseIf combomes.SelectedIndex <> indice Then

        Else
            Session("mes") = fechaActual.AddMonths(-1)
        End If

        Session("año") = comboaño.Value

        Session("TIPO_NOMINA") = comborol.Text
        If Session("TIPO_NOMINA") = "" Then
            Exit Sub
        End If
        Dim r As New reportes
        r.CreateDocument()
        r.Parameters("año").Value = comboaño.Value
        r.Parameters("mes").Value = combomes.Value
        r.Parameters("cedula").Value = Session("cedula")
        r.Parameters("TIPO_NOMINA").Value = Session("TIPO_NOMINA")
        Me.ASPxDocumentViewer1.Report = r
        If Page.IsCallback Then
            Me.comborol.SelectedIndex = 1
        End If
        r.CreateDocument()
        Me.ASPxDocumentViewer1.Report = r

    End Sub

    Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click





        If (IsDBNull(Session("EXT_TELEFONO")) Or IsDBNull(Session("ID_CIUDADES")) Or IsDBNull(Session("PISO")) Or IsDBNull(Session("DIR_DOMICICLIO")) Or IsDBNull(Session("E_MAILPERSONAL"))) Then
            ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "ASPxPopupControl2.Show();", True)
        End If

    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.Parameters("@numero_documento").Value = Session("cedula")
        e.Command.Parameters("@año").Value = Session("año")
        e.Command.Parameters("@mes").Value = Session("mes")
    End Sub

    Protected Sub combomes_SelectedIndexChanged(sender As Object, e As EventArgs) Handles combomes.SelectedIndexChanged
        Dim i = 1
        indice = combomes.SelectedIndex - 1


    End Sub

    Protected Sub combomes_TextChanged(sender As Object, e As EventArgs) Handles combomes.TextChanged
        Dim i = 1
    End Sub

    Protected Sub comborol_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles comborol.Callback
        Me.comborol.DataBind()
        Session("mes") = Convert.ToInt16(e.Parameter)
        Me.comborol.SelectedIndex = 1
    End Sub

    Protected Sub button_admin_Click(sender As Object, e As EventArgs) Handles button_admin.Click
        Response.Redirect("usuarios.aspx")
    End Sub

    Protected Sub ASPxButton2_Click(sender As Object, e As EventArgs) Handles ASPxButton2.Click
        Session.Clear()
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub ASPxButton3_Click(sender As Object, e As EventArgs) Handles ASPxButton3.Click
        Dim i = 1
        i = 2
    End Sub

    Protected Sub UpdatePanel3_Unload(sender As Object, e As EventArgs) Handles UpdatePanel3.Unload
        RegisterUpdatePanel(DirectCast(sender, UpdatePanel))
    End Sub
    Protected Sub RegisterUpdatePanel(ByVal panel As UpdatePanel)
        Dim sType = GetType(ScriptManager)
        Dim mInfo = sType.GetMethod("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel", BindingFlags.NonPublic Or BindingFlags.Instance)
        If mInfo IsNot Nothing Then
            mInfo.Invoke(ScriptManager.GetCurrent(Page), New Object() {panel})
        End If
    End Sub

    Protected Sub ASPxButton7_Click(sender As Object, e As EventArgs) Handles ASPxButton7.Click
        Dim strCon As String = "Data Source=win-sqlserv-01;Initial Catalog=roles_dgac;User ID=adminsql;Password=sistema*-!;"
        Dim strSQL As String
        Dim sqlCmd As SqlCommand
        Dim sqlConn As SqlConnection
        If Session("cedula") = vbNull Then
            ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "alert('Error en la sessión de usuario, favor salir y entrar nuevamente en el sistema');", True)
            Exit Sub
        End If

        If ASPxComboBox1.Value = Nothing Then
            ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "alert('Por favor seleccione la Dependencia en la que labora!');", True)
            Exit Sub
        End If

        If Not IsNumeric(ASPxTextBox2.Text) Then
            ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "alert('La Extensión Telefónica debe ser un Número y debe ser ingresada');", True)
            Exit Sub
        End If

        If Not IsNumeric(ASPxTextBox4.Text) Then
            ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "alert('El Piso en el que trabaja debe ser un Número y debe ser ingresado');", True)
            Exit Sub
        End If

        If ASPxTextBox3.Value = Nothing Then
            ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "alert('Por favor ingrese el mail de contacto');", True)
            Exit Sub
        End If

        strSQL = "update FUNCIONARIOS set ID_CIUDADES = " & ASPxComboBox1.Value & " where CEDULA = '" & Session("cedula") & "'"
        sqlConn = New SqlConnection(strCon)
        sqlCmd = New SqlCommand(strSQL, sqlConn)
        sqlConn.Open()
        sqlCmd.ExecuteNonQuery()

        strSQL = "update FUNCIONARIOS set EXT_TELEFONO = " & Trim(ASPxTextBox2.Text) & " where CEDULA = '" & Session("cedula") & "'"
        sqlCmd = New SqlCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        strSQL = "update FUNCIONARIOS set PISO = " & Trim(ASPxTextBox4.Text) & "" & " where CEDULA = '" & Session("cedula") & "'"
        sqlCmd = New SqlCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        strSQL = "update FUNCIONARIOS set CORREOS = '" & Trim(ASPxTextBox3.Text) & "' where CEDULA = '" & Session("cedula") & "'"
        sqlCmd = New SqlCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        strSQL = "update FUNCIONARIOS set DIR_DOMICILIO = '" & Trim(ASPxTextBox_dirdom.Text) & "' where CEDULA = '" & Session("cedula") & "'"
        sqlCmd = New SqlCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        strSQL = "update FUNCIONARIOS set N_CELULAR = '" & Trim(ASPxTextBox_celu.Text) & "' where CEDULA = '" & Session("cedula") & "'"
        sqlCmd = New SqlCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        strSQL = "update FUNCIONARIOS set N_CONVENCIONAL = '" & Trim(ASPxTextBox_telcon.Text) & "' where CEDULA = '" & Session("cedula") & "'"
        sqlCmd = New SqlCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        strSQL = "update FUNCIONARIOS set E_MAILPERSONAL = '" & Trim(ASPxTextBox_email.Text) & "' where CEDULA = '" & Session("cedula") & "'"
        sqlCmd = New SqlCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        strSQL = "update FUNCIONARIOS set N_VACUNAS = " & ASPxRadioButtonList_vacunas.Value & " where CEDULA = '" & Session("cedula") & "'"
        sqlCmd = New SqlCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        strSQL = "update FUNCIONARIOS set MARCA_VACUNA = '" & ASPxComboBox_vacuna.Value & "' where CEDULA = '" & Session("cedula") & "'"
        sqlCmd = New SqlCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        sqlConn.Close()
        ScriptManager.RegisterClientScriptBlock(Me, Me.Page.GetType(), "dxsi_HidePopup", "alert('Datos de contacto guardados exitosamente!');", True)
    End Sub

    Protected Sub ASPxTextBox2_Load(sender As Object, e As EventArgs) Handles ASPxTextBox2.Load

    End Sub

    
    Protected Sub ASPxComboBox1_Load(sender As Object, e As EventArgs) Handles ASPxComboBox1.Load


    End Sub

    Protected Sub UpdatePanel4_Unload(sender As Object, e As EventArgs) Handles UpdatePanel4.Unload
        RegisterUpdatePanel(DirectCast(sender, UpdatePanel))
    End Sub

    
    Protected Sub ASPxButton9_Click(sender As Object, e As EventArgs) Handles ASPxButton9.Click

    End Sub

    Protected Sub ASPxComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ASPxComboBox1.SelectedIndexChanged

    End Sub

  
    Protected Sub ASPxComboBox_vacuna_SelectedIndexChanged(sender As DevExpress.Web.ASPxComboBox, e As EventArgs) Handles ASPxComboBox_vacuna.SelectedIndexChanged
        ASPxRadioButtonList_vacunas.Items.Clear()

        ASPxRadioButtonList_vacunas.Items.Add("0 Dosis / No Vacunado", 0)
        ASPxRadioButtonList_vacunas.Items.Add("1 Dosis", 1)
        If (Not sender.SelectedIndex = 4) Then
            ASPxRadioButtonList_vacunas.Items.Add("2 Dosis", 2)
        End If

    End Sub
End Class