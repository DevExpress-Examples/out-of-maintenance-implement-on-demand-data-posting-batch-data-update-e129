<%-- BeginRegion Page setup --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BatchUpdate" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors"  TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v8.1" Namespace="DevExpress.Web.ASPxPager" TagPrefix="dxwp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Implement on-demand data posting (batch data update)</title>
</head>
<body>
    <form id="form1" runat="server">
    
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="ObjectDataSource1" KeyFieldName="Id" Width="300px" OnCustomCallback="grid_CustomCallback">
        <%-- BeginRegion Grid Columns --%>
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <NewButton Visible="True" />
                <EditButton Visible="True"/>
                <DeleteButton Visible="True"/>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataColumn FieldName="Id" VisibleIndex="1">
                <EditFormSettings Visible="false" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Name" VisibleIndex="2">
                <EditFormSettings ColumnSpan="2" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Quantity" VisibleIndex="3">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Price" VisibleIndex="4">
                <PropertiesTextEdit DisplayFormatString="c"></PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Total" VisibleIndex="5">
                <EditFormSettings Visible="false" />
                <PropertiesTextEdit DisplayFormatString="c"></PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <%-- EndRegion --%>
        <Settings ShowFooter="true"/>
         <TotalSummary>
             <dxwgv:ASPxSummaryItem FieldName="Id" SummaryType="Count" />
             <dxwgv:ASPxSummaryItem FieldName="Total" SummaryType="Sum" DisplayFormat="c" />
         </TotalSummary>
        <Templates>
            <EditForm>
                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors"/>
                <input type="button" value="Post and add new row" onclick='grid.PerformCallback("Update");' />
            </EditForm>
        </Templates>
        <SettingsEditing EditFormColumnCount="2" />
    </dxwgv:ASPxGridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
            SelectMethod="GetItems" TypeName="InvoiceItemsProvider" UpdateMethod="Update" InsertMethod="Insert" DeleteMethod="Delete" ></asp:ObjectDataSource>
      <input type="button" value="Post All Data" onclick='grid.PerformCallback("BatchUpdate");' />
    </form>
</body>
</html>
