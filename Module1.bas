Attribute VB_Name = "Module1"
Sub ShowHide()
    With ActiveSheet.Shapes("SolverParams")
        If .Visible = False Then
            .Visible = True
        Else
            .Visible = False
        End If
    End With
End Sub

Sub SwitchLogLinear()
    With ActiveSheet.ChartObjects("RelGrowthRates").Chart()
        If .Axes(xlValue).ScaleType = xlScaleLogarithmic Then
            .Axes(xlValue).ScaleType = xlScaleLinear
            .ChartTitle.Text = "Relative Growth Rates"
        Else
            .Axes(xlValue).ScaleType = xlScaleLogarithmic
            .ChartTitle.Text = "Relative Growth Rates (Logarithmic Scale)"
        End If
    End With
End Sub

Sub ShowINTCFreq()
    ActiveSheet.Shapes.Range(Array("INTCFreq")).Visible = msoTrue
    ActiveSheet.Shapes.Range(Array("AMDFreq")).Visible = msoFalse
    ActiveSheet.Shapes.Range(Array("NVDAFreq")).Visible = msoFalse
End Sub

Sub ShowAMDFreq()
    ActiveSheet.Shapes.Range(Array("AMDFreq")).Visible = msoTrue
    ActiveSheet.Shapes.Range(Array("INTCFreq")).Visible = msoFalse
    ActiveSheet.Shapes.Range(Array("NVDAFreq")).Visible = msoFalse
End Sub

Sub ShowNVDAFreq()
    ActiveSheet.Shapes.Range(Array("NVDAFreq")).Visible = msoTrue
    ActiveSheet.Shapes.Range(Array("AMDFreq")).Visible = msoFalse
    ActiveSheet.Shapes.Range(Array("INTCFreq")).Visible = msoFalse
End Sub
