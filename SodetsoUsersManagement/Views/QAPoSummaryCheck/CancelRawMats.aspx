<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SodetsoUsersManagement.Models.UsersListModel>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
<%: ViewBag.PageTitle ="Cancelled PO" %> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


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
                        <div class="col-xs-12">
                        <div class="box box-primary">

                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                        <table id="example1" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                        <th>Po&nbsp;No.</th>
                        <th>Item&nbsp;Code</th>
                        <th>Description</th>
                        <th>Supplier</th>
                        <th class="<%: Session["Position"] %>">Qty.&nbsp;Ordered</th>
                        <th>Qty.&nbsp;Cancel</th>
                        <th class="<%: Session["Position"] %>">Qty.&nbsp;Good</th>
                        <th>Date of Cancel</th>
                        <th>Remarks</th>
                        <th style="text-align:center">Return</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% foreach (var item in Model)
                        {%>
                        <tr>
                        <td>
                        <% if (item.Image == null)
                        { %>

                        <%}
                        else
                        { %>

                        <%      
                        {
                        var base64 = Convert.ToBase64String(item.Image);
                        var imgSrc = String.Format("data:image/jpg;base64,{0}", base64);
                        %>

                        <img src="<%: @imgSrc %>" alt="<%: @Html.DisplayFor(m => item.Firstname) %>" height="70" width="70" /><%} %>
                        <%} %>
                        <%: @Html.DisplayFor(m => item.po_number) %>
                        </td>

                        <td><%: Html.DisplayFor(m => item.item_code) %></td>
                        <td><%: Html.DisplayFor(m => item.item_description) %></td>
                        <td><%: Html.DisplayFor(m => item.vendor_name) %></td>
                        <td class="<%: Session["Position"] %>"><%: Html.DisplayFor(m => item.qty_ordered) %></td>
      




                        <% 
                      
                        if (item.qty_remarks == "0")

                        {%>  

                        <td id="agent_commission_models"><b><%: Html.DisplayFor(m => item.qty_ordered) %></b></td>

                        <% }
                        else
                        {  %>
                        <td id="agent_commission_model"><b><%: Html.DisplayFor(m => item.qty_remarks) %></b></td>

                        <%  } %>









                                <td class="<%: Session["Position"] %>"><%: Html.DisplayFor(m => item.qty_good) %></td>

                                 <td><%: Html.DisplayFor(m => item.cancel_date) %></td>
                                               <td><%: Html.DisplayFor(m => item.checklist_remarks) %></td>

                                <td style="text-align:center">

                                <% if (item.checklist_approval == "Cancel") 
                                { %>                                    
                                       

                                <a href="#Uncancel<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-danger">Confirm</span></a>
                                        
                                <!-- Deactvate User Modal -->
                                <div class="modal fade" id="Uncancel"<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content">
                                <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"> Deactivate User</h4>
                                </div>
                                <% using (Html.BeginForm("ReturnApprovePO", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register", enctype = "multipart/form-data" }))
                                { %>
                                <div class="modal-body">
                                Are you sure you want to UnCancel the Raw Material <strong><%: Html.DisplayFor(m => item.item_description) %> <%--<%: Html.DisplayFor(m => item.Middlename) %> <%: Html.DisplayFor(m => item.Lastname) %>--%></strong>?
                                                           
                                <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                <input type="text" name="Operation" value="Approved" />
                                </div>
                                <div class="modal-footer clearfix"> 
                                <button type="submit" class="btn btn-primary"> Yes</button>                         
                                <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button> 
                                </div>
                                <% }%>
                                </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                                </div>
                                <!-- /.Disable User modal -->

                                <% }
                                else
                                { %>
                                <a href="#CancelModal<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-danger">Return</span></a>

                                <!-- Activate User Modal -->
                                <div class="modal fade" id="CancelModal<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content">
                                <div class="modal-header btn-danger">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"> Cancel Raw Materials</h4>
                                </div>
                                <% using (Html.BeginForm("ReturnApprovePO", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register", enctype = "multipart/form-data" }))
                                { %>
                                <div class="modal-body" style="text-align:center">
                                Are you sure you want to return the Raw Materials <strong><%: Html.DisplayFor(m => item.item_description) %></strong> with <strong>PO Number <%: Html.DisplayFor(m => item.po_number) %></strong>?
                                                           
                                <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                <input type="hidden" name="Operation" value="Cancels" /><br />

                                <%--                                                           <input type="text" name="checklist_remarks" style="width:540px"  class="form-control"/>--%><%--dance 4/13/220
                                --%>
                                <select id="cars" name="checklist_remarks" class="form-control">
                                                  
                                <option value="FOR RECEIVING">FOR RECEIVING </option>
                                <option value="RE-OPEN PO">RE-OPEN PO</option>
                                <option value="WRONG CANCELLATION">WRONG CANCELLATION</option>
                              

                                </select>

                                <%--                    <%: Html.TextBoxFor(m => item.checklist_remarks new { @class = "form-control", @placeholder="Enter Item Description", @required = "true"}) %>--%>
                                </div>

                                                      
                                         
                                <div class="modal-footer clearfix"> 


                                <%--                                                        <input type="number"/>
                                <button>Clear</button>--%>

                                                        
                                                         
                                <button type="submit" class="btn btn-primary"> Yes</button>   
                                <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button> 
                                </div>
                                <% }%>

                                </div><!-- /.modal-content -->

                                </div><!-- /.modal-dialog -->
                                </div>
                                <!-- /.Activate User modal -->
                                <% } %> 




                          </td>
                            
                                 
     
                            </tr>
                            <% } %>
                        </tbody>
                        <tfoot>
                            <tr style="display:none;">
                                    <th>Po&nbsp;No.</th>
                                <th>Item&nbsp;Code</th>
                                <th>Qty.&nbsp;Ordered</th>
                                <th>Qty.&nbsp;Delivered</th>
                                <th>Qty.&nbsp;Remaining</th>
                                 <th>Good</th>
                                <th>Reject</th>
                                <th>Expiry</th>
                                <th>Status</th>
                                <th>*</th>
           <%--                     <th>*</th>--%>
                      
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </div>
        <style>
                .Senior.Automation{
            display:none;
        }
    </style>

</asp:Content>
