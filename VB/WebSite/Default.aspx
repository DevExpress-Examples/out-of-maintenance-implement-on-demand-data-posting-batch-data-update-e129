<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="BatchUpdate" %>

<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Implement on-demand data posting (batch data update)</title>
    <script type="text/javascript">
        function UpdateRow() {
            grid.PerformCallback('Update');
        }
        function UpdateData() {
            grid.PerformCallback('BatchUpdate');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="ObjectDataSource1" KeyFieldName="Id" Width="300px" OnCustomCallback="grid_CustomCallback">
            <Columns>
                <dx:GridViewCommandColumn ShowNewButton="true" ShowEditButton="true" ShowDeleteButton="true" />
                <dx:GridViewDataColumn FieldName="Id">
                    <EditFormSettings Visible="false" />
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="Name">
                    <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="Quantity">
                </dx:GridViewDataColumn>
                <dx:GridViewDataTextColumn FieldName="Price">
                    <PropertiesTextEdit DisplayFormatString="c" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total">
                    <EditFormSettings Visible="false" />
                    <PropertiesTextEdit DisplayFormatString="c" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFooter="true" />
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="Id" SummaryType="Count" />
                <dx:ASPxSummaryItem FieldName="Total" SummaryType="Sum" DisplayFormat="c" />
            </TotalSummary>
            <Templates>
                <EditForm>
                    <dx:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" />
                    <input id="btnUpdate" type="button" value="Post and add new row" onclick="UpdateRow();" />
                </EditForm>
            </Templates>
            <SettingsEditing EditFormColumnCount="2" />
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetItems" TypeName="InvoiceItemsProvider"
            UpdateMethod="Update" InsertMethod="Insert" DeleteMethod="Delete" />
        <input type="button" value="Post All Data" onclick='UpdateData();' />
    </form>
</body>
</html>