#Region "Using"
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Web.SessionState
Imports System.ComponentModel
#End Region
Partial Public Class BatchUpdate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        'Add new row on the first load
        If Not IsPostBack AndAlso Not IsCallback Then
            grid.AddNewRow()
        End If
    End Sub
    Protected Sub grid_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
        If e.Parameters = "Update" Then
            DoUpdateAndAddNewRow()
        End If
        If e.Parameters = "BatchUpdate" Then
            DoBatchUpdate()
        End If
    End Sub
    Private Sub DoUpdateAndAddNewRow()
        If Not grid.IsEditing Then
            Return
        End If
        grid.UpdateEdit()
        grid.AddNewRow()
    End Sub
    Private Sub DoBatchUpdate()
        Dim provider As New InvoiceItemsProvider()
        For Each item As InvoiceItem In provider.GetItems()
            '!!! do database update here !!!
        Next item
    End Sub
End Class

