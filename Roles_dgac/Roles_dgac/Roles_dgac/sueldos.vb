Public Class sueldos
    Public Shared total_ing As Double
 

    Private Sub ingresos_valor_SummaryCalculated(sender As Object, e As DevExpress.XtraReports.UI.TextFormatEventArgs) Handles ingresos_valor.SummaryCalculated
        Dim i = 1
        On Error Resume Next
        total_ing = Convert.ToDouble(e.Value)
    End Sub

 
End Class