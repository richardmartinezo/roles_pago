Public Class descuentos
    Public Shared total_des As Double

    Private Sub XrLabel6_SummaryCalculated(sender As Object, e As DevExpress.XtraReports.UI.TextFormatEventArgs) Handles descuentos_valor.SummaryCalculated
        On Error Resume Next

        total_des = Convert.ToDouble(e.Value)
    End Sub

    Private Sub descuentos_valor_SummaryGetResult(sender As Object, e As DevExpress.XtraReports.UI.SummaryGetResultEventArgs) Handles descuentos_valor.SummaryGetResult

    End Sub

    Private Sub descuentos_valor_AfterPrint(sender As Object, e As EventArgs) Handles descuentos_valor.AfterPrint
        
    End Sub
End Class