# Implement on-demand data posting (batch data update)
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e129)**
<!-- run online end -->


<p><strong>UPDATED:</strong><br /><br />Starting with version 13.2, the ASPxGridView control offers the basic "Batch Editing Mode" functionality that allows accomplishing a similar task with less effort and does not require so much extra code. See the <a href="https://community.devexpress.com/blogs/aspnet/archive/2013/12/16/asp-net-webforms-amp-mvc-gridview-batch-edit-what-39-s-new-in-13-2.aspx">ASP.NET WebForms & MVC: GridView Batch Edit </a> blog post to learn more about this new functionality.<br /><br />Starting with version 14.1, the ASPxGridView control offers advanced "Batch Editing Mode" programming options.<br /><br />You can find a standalone DB-independent solution in our Code Examples base at:<br /><a href="https://www.devexpress.com/Support/Center/p/E5045">ASPxGridView - A simple Batch Editing implementation</a><br /><br />If you have version v14.1+ available, consider using the built-in functionality instead of the approach detailed below.<br />If you need further assistance with this functionality, please create a new ticket in our Support Center.<br /><br />If you don't want database transactions to take place after each end-user action, you can implement on-demand data posting mechanism. <br /> This means, that all data changes will not be immediately sent to the database, but instead will be accumulated within the current user session. <br /> When needed, end-users can press the Post All Data button to send changes to the database.</p>
<p>This approach can make your web site much more responsive, if users need to add or update multiple records during a session.</p>
<p><strong>See Also:</strong><br /> <a href="https://www.devexpress.com/Support/Center/p/E2314">How to update a Boolean field using the ASPxGridView selection</a><br /> <a href="https://www.devexpress.com/Support/Center/p/E2333">How to perform ASPxGridView instant updating using different editors in the DataItem template</a></p>

<br/>


