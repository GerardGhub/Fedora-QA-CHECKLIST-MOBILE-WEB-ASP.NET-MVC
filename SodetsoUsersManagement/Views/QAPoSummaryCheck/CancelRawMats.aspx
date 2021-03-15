<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SodetsoUsersManagement.Models.UsersListModel>>" %>
<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     <%: ViewBag.PageTitle ="Cancelled Raw Materials Receiving" %> 
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
                            </tr>
                        </thead>
                        <tbody>
                            <% foreach (var item in Model)
                               {%>
                            <tr>
                                <td>
                                     <% if (item.Image == null)
                                       { %>
          <%--                          <img src="../../assets/img/avatar.png" alt="<%: @Html.DisplayFor(m => item.Firstname) %>" height="70" width="70" />--%>

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
                          <%--      <td><%: Html.DisplayFor(m => item.qty_remarks) %></td>--%>




                                                  <% 
                      
                      if (item.qty_remarks == "0")

                      {%>  
             <%--    <a href="#DeactivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-danger">Confirm</span></a>--%>
                                <td><b><%: Html.DisplayFor(m => item.qty_ordered) %></b></td>

                       <% }
                      else
                      {  %>
                                  <td id="agent_commission_model"><b><%: Html.DisplayFor(m => item.qty_remarks) %></b></td>
<%--   <a href="#DeactivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-danger">Bobo</span></a>--%>
                     <%  } %>









                                <td class="<%: Session["Position"] %>"><%: Html.DisplayFor(m => item.qty_good) %></td>

                                 <td><%: Html.DisplayFor(m => item.cancel_date) %></td>
                                               <td><%: Html.DisplayFor(m => item.checklist_remarks) %></td>

                          
                            
                                 
      <%--                          <td>
                                    <button class="btn btn-xs btn-danger" type="button" data-toggle="modal" data-target="#RemoveUser<%: Html.DisplayFor(m => item.po_sum_id) %>"><i class="fa fa-times fa fa-white"></i></button>
                                    
                                    <!-- Remove User Modal -->
                                        <div class="modal fade" id="RemoveUser<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title"> Remove Raw Materials</h4>
                                                    </div>
                                                    <% using (Html.BeginForm("RemoveRawMaterials", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register"}))
                                                    { %>
                                                        <div class="modal-body">
                                                           Are you sure you want to remove the Raw Material Po Summary <strong><%: Html.DisplayFor(m => item.item_description) %> </strong>?
                                                           
                                                            <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                                        </div>
                                                        <div class="modal-footer clearfix"> 
                                                             <button type="submit" class="btn btn-primary"> Yes</button>                         
                                                             <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button> 
                                                        </div>
                                                    <% }%>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.Remove User modal -->
                                </td>--%>
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
