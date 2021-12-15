Imports Roles_dgac.sueldos
Imports Roles_dgac.reportes
Imports Roles_dgac.descuentos
Imports DevExpress.XtraReports.UI

Public Class reportes


    Private Sub XrSubreport1_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs) Handles XrSubreport1.BeforePrint
        Dim subReport As sueldos = TryCast(DirectCast(sender, XRSubreport).ReportSource, sueldos)

        subReport.tiporubro.Value = "I"
        subReport.año.Value = Me.Parameters("año").Value
        subReport.mes.Value = Me.Parameters("mes").Value
        subReport.cedula.Value = Me.Parameters("cedula").Value
        subReport.TIPO_NOMINA.Value = Me.Parameters("TIPO_NOMINA").Value
       
    End Sub

    Private Sub XrSubreport2_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs) Handles XrSubreport2.BeforePrint
        Dim subReport As descuentos = TryCast(DirectCast(sender, XRSubreport).ReportSource, descuentos)

        subReport.tiporubro.Value = "D"
        subReport.año.Value = Me.Parameters("año").Value
        subReport.mes.Value = Me.Parameters("mes").Value
        subReport.cedula.Value = Me.Parameters("cedula").Value
        subReport.TIPO_NOMINA.Value = Me.Parameters("TIPO_NOMINA").Value
        'Me.TOTGEN.Text = "106"
    End Sub

    Private Sub Detail_AfterPrint(sender As Object, e As EventArgs) Handles Detail.AfterPrint

    End Sub

    Private Sub ReportHeaderBand1_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs) Handles ReportHeaderBand1.BeforePrint
        'Dim i
        'i = XrSubreport1.ReportSource.FindControl("ingresos_valor", True)
        'Me.TOTGEN.Text = "104"
    End Sub

    Private Sub reportes_AfterPrint(sender As Object, e As EventArgs) Handles MyBase.AfterPrint
        Dim i
        'Me.TOTGEN.Text = total_ing
        'aqui esta el valor
        'Dim subReport As sueldos = TryCast(DirectCast(sender, XRSubreport).ReportSource, sueldos)
        'i = subReport.total_ing
        'Me.TOTGEN.Text = total_ing
        'Me.TOTGEN.Text = "103"
    End Sub

    Private Sub XrSubreport1_AfterPrint(sender As Object, e As EventArgs) Handles XrSubreport1.AfterPrint
        'Dim i
        'i = XrSubreport1.ReportSource.FindControl("ingresos_valor", True)
        'Dim subReport As sueldos = TryCast(DirectCast(sender, XRSubreport).ReportSource, sueldos)
        'aqui imprime
        ' Me.TOTGEN.Text = total_ing
    End Sub

    Private Sub Detail_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs) Handles Detail.BeforePrint
        'imprime antes Me.TOTGEN.Text = total_ing
    End Sub

    Private Sub PageFooterBand1_AfterPrint(sender As Object, e As EventArgs) Handles PageFooterBand1.AfterPrint
        'Me.TOTGEN.Text = total_ing
        'Me.TOTGEN.Text = total_ing
    End Sub

    Private Sub PageFooterBand1_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs) Handles PageFooterBand1.BeforePrint
        ' Me.TOTGEN.Text = total_ing
    End Sub

    Private Sub reportes_PrintProgress(sender As Object, e As DevExpress.XtraPrinting.PrintProgressEventArgs) Handles MyBase.PrintProgress
        'Me.TOTGEN.Text = total_ing
    End Sub

    Private Sub TOTGEN_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs) Handles TOTGEN.BeforePrint
        'Me.TOTGEN.Text = total_ing
    End Sub

    Private Sub TOTGEN_AfterPrint(sender As Object, e As EventArgs) Handles TOTGEN.AfterPrint
        'Me.TOTGEN.Text = total_ing
    End Sub

    Private Sub TOTGEN_PrintOnPage(sender As Object, e As PrintOnPageEventArgs) Handles TOTGEN.PrintOnPage
        Me.TOTGEN.Text = total_ing - total_des
        'Me.TOTGEN_CODE.Text = Me.TOTGEN.Text


    End Sub

    Private Sub TOT_DESCUENTOS_PrintOnPage(sender As Object, e As PrintOnPageEventArgs) Handles TOT_DESCUENTOS.PrintOnPage
        Me.TOT_DESCUENTOS.Text = total_des
    End Sub

    Private Sub TOT_INGRESOS_PrintOnPage(sender As Object, e As PrintOnPageEventArgs) Handles TOT_INGRESOS.PrintOnPage
        Me.TOT_INGRESOS.Text = total_ing
    End Sub

    Private Sub XrLabel9_PrintOnPage(sender As Object, e As PrintOnPageEventArgs) Handles XrLabel9.PrintOnPage
        On Error Resume Next
        Dim nmes = Convert.ToInt16(Me.XrLabel9.Text)
        Me.XrLabel9.Text = (MonthName(nmes, False)).ToUpper
    End Sub

    Private Sub TOTGEN_CODE_PrintOnPage(sender As Object, e As PrintOnPageEventArgs) Handles TOTGEN_CODE.PrintOnPage

        Dim total_code As Double = total_ing - total_des
        Dim cedula As String = Me.Parameters("cedula").Value.ToString()
        If cedula.Length = 0 Then
        Else
            Me.TOTGEN_CODE.Text = Me.Parameters("cedula").Value.ToString().Substring(5) & CInt(total_code)
        End If


    End Sub
End Class