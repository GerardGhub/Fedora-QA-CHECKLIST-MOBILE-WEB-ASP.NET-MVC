<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<SodetsoUsersManagement.Models.EditPoSummaryModel>" %>
<%--<%@ Page Title="" Lang<%--uage="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: ViewBag.PageTitle = "Edit Feedmill Po Summary Checklist Report" %>
  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <%--<input type="date" />--%>

     <!-- row -->
    <div class="row">
        <div class="col-md-6">
            <% if (TempData["Success"] != null)
               { %>
            <div class="alert alert-success alert-dismissable">
                <i class="fa fa-check"></i>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <b>Alert!</b> Success.
       
            </div>
            <% } %>
        </div>
    </div>

    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">Update CheckList Form</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <% using (Html.BeginForm("UpdatePoSummary", null, FormMethod.Post, new { role = "form", id = "FormUser", enctype = "multipart/form-data" }))
                   { %>

                <div class="box-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1">PR Number</label>
                                <%: Html.TextBoxFor(model => model.pr_number, new { @class = "form-control", @placeholder="Enter PR Number", @required = "true"}) %>
                                <%: Html.ValidationMessageFor(model => model.pr_number, "", new { @class = "text-danger" }) %>
                                <input type="hidden" class="form-control" name="po_sum_id" id="po_sum_id" value="<%: Model.po_sum_id %>" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">PR Date</label>
                                <%: Html.TextBoxFor(model => model.pr_date, new { @class = "form-control", @placeholder="Enter PR Date"}) %>
                            </div>
                           <div class="form-group">
                                <label for="exampleInputEmail1">PO Number</label>
                                <%: Html.TextBoxFor(model => model.po_number, new { @class = "form-control", @placeholder="Enter PO Number"}) %>
                            </div>

                             <div class="form-group">
                                <label>PO Date</label>
                                <%: Html.TextBoxFor(model => model.po_date, new { @class = "form-control", @placeholder="Enter PO Date"}) %>
                            </div>
                            <div class="form-group">
                                <label>Import in FEDORA Date</label>
                           <%--     <%: Html.DropDownListFor(model => model.Gender,
                                    new SelectList(Model.sex, "GenderID", "Description"), 
                                    new {@class="form-control"})
                                %>--%>
                                          <%--            <%: Html.TextBoxFor(model => model.import_date, new { @class = "form-control", @placeholder="Enter Import Date"}) %>--%>
                            </div>

                               <div class="form-group">
                                <label for="exampleInputEmail1">Item_Code</label>
                                <%: Html.TextBoxFor(model => model.item_code, new { @class = "form-control", @placeholder="Enter Item Code"}) %>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Item Description</label>
                                <%: Html.TextBoxFor(model => model.item_description, new { @class = "form-control", @placeholder="Enter Description", @required = "true"}) %>
                   <%--             <%: Html.ValidationMessageFor(model => model.item_description, "", new { @class = "text-danger" }) %>--%>
                            </div>
                           
                                                                <div class="form-group">
                                <label for="exampleInputEmail1">Quantity Billed</label>
                                <%: Html.TextBoxFor(model => model.qty_billed, new { @class = "form-control", @placeholder="Enter Quantity Billed", @required = "true"}) %>
                          <%--    //  <%: Html.ValidationMessageFor(model => model.qty_void, "", new { @class = "text-danger" }) %>--%>
                            </div>
                                            <div class="form-group">
                                <label for="exampleInputEmail1">Unit of Measure</label>
                                <%: Html.TextBoxFor(model => model.qty_uom, new { @class = "form-control", @placeholder="Enter Unit of Measures", @required = "true"}) %>
                          <%--    //  <%: Html.ValidationMessageFor(model => model.qty_void, "", new { @class = "text-danger" }) %>--%>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Quantity Ordered</label>
                                <%: Html.TextBoxFor(model => model.qty_ordered, new { @class = "form-control", @placeholder="Enter No. Quantity Order"}) %>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Quantity Delivered</label>
                                <%: Html.TextBoxFor(model => model.item_description, new { @class = "form-control", @placeholder="Enter No. Quantity Delivered", @required = "true"}) %>
                     <%--           <%: Html.ValidationMessageFor(model => model.item_description, "", new { @class = "text-danger" }) %>--%>
                            </div>
                             <div class="form-group">
                                <label for="exampleInputEmail1">No. Quantity Good</label>
                                <%: Html.TextBoxFor(model => model.qty_good, new { @class = "form-control", @placeholder="Enter No. of Quantity Goods", @required = "true"}) %>
      <%--                          <%: Html.ValidationMessageFor(model => model.qty_good, "", new { @class = "text-danger" }) %>--%>
                            </div>

                             <div class="form-group">
                                <label for="exampleInputEmail1">No. Quantity Reject</label>
                                <%: Html.TextBoxFor(model => model.qty_reject, new { @class = "form-control", @placeholder="Enter No. of Quantity Reject", @required = "true"}) %>
  <%--                              <%: Html.ValidationMessageFor(model => model.qty_reject, "", new { @class = "text-danger" }) %>--%>
                            </div>
                              <div class="form-group">
                                <label for="exampleInputEmail1">No. Quantity Void</label>
                                <%: Html.TextBoxFor(model => model.qty_void, new { @class = "form-control", @placeholder="Enter No. of Quantity Void", @required = "true"}) %>
                          <%--    //  <%: Html.ValidationMessageFor(model => model.qty_void, "", new { @class = "text-danger" }) %>--%>
                            </div>
                              <div class="form-group">
                                <label for="exampleInputEmail1">No. Quantity Waiting</label>
                                <%: Html.TextBoxFor(model => model.qty_waiting, new { @class = "form-control", @placeholder="Incoming Number to be Delivered", @required = "true"}) %>
                          <%--    //  <%: Html.ValidationMessageFor(model => model.qty_void, "", new { @class = "text-danger" }) %>--%>
                            </div>
                  

                   
                                        <div class="form-group">
                                <label for="exampleInputEmail1">Expiration Date</label>
                   <%--             <%: Html.TextBoxFor(model => model.import_date, new { @class = "form-control"}) %>--%>
                          <%--                  <input type="date" name="expiration_details" value="<%: Html.DisplayFor(model => model.expiration_details) %>" class="form-control" />--%>
                        
                                            
                                            <%--    //  <%: Html.ValidationMessageFor(model => model.qty_void, "", new { @class = "text-danger" }) %>--%>
                            </div>
                                            <div class="form-group">
                                <label for="exampleInputEmail1">Unit of Measure</label>
                                <%: Html.TextBoxFor(model => model.qty_uom, new { @class = "form-control", @placeholder="Enter Unit of Measures", @required = "true"}) %>
<%--                          <%: Html.ValidationMessageFor(model => model.qty_uom, "", new { @class = "text-danger" }) %>--%>
                            </div>


                                                <div class="form-group">
                                <label for="exampleInputEmail1">Vendor Name</label>
                                <%: Html.TextBoxFor(model => model.vendor_name, new { @class = "form-control", @placeholder="Enter Vendor Name", @required = "true"}) %>
          <%--                <%: Html.ValidationMessageFor(model => model.vendor_name, "", new { @class = "text-danger" }) %>--%>
                            </div>




                            <div class="form-group">
                                <label for="exampleInputFile">File input</label>
                                <input type="file" id="ImageData" name="ImageData">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer" align="right">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
                <% } %>
            </div>
            <!-- /.box -->

        </div>
        <!--/.col (left) -->

    </div>
    <!-- /.row -->
  

    


</asp:Content>
