#region Using
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.SessionState;
using System.ComponentModel;
#endregion
public partial class BatchUpdate : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        //Add new row on the first load
        if(!IsPostBack && !IsCallback) {
            grid.AddNewRow();
        }
    }
    protected void grid_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e) {
        if(e.Parameters == "Update") DoUpdateAndAddNewRow();
        if(e.Parameters == "BatchUpdate") DoBatchUpdate();
    }
    void DoUpdateAndAddNewRow() {
        if(!grid.IsEditing) return;
        grid.UpdateEdit();
        grid.AddNewRow();
    }
    void DoBatchUpdate() {
        InvoiceItemsProvider provider = new InvoiceItemsProvider();
        foreach(InvoiceItem item in provider.GetItems()) {
            //!!! do database update here !!!
        }
    }
}

