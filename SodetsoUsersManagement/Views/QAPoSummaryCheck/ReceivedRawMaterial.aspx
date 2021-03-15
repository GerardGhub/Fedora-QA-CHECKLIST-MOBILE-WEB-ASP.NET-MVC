<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SodetsoUsersManagement.Models.UsersListModel>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     <%: ViewBag.PageTitle =" Feedmill Raw Materials Partial Receiving" %> 
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
                                    <th>Category</th>
                                       <th>Qty.&nbsp;Ordered</th>
                                          <th>Supplier</th>
                                          <th>Good</th>
                                         <th>Reject</th>
                                       <th>Expiry</th>
                                      <th style="text-align:center;">Status</th>
                                      <th style="text-align:center;" id="<%: Session["Position"] %>">Cancel</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% foreach (var item in Model)
                               {%>
                            <tr>
                                <td>
                                  <%--  <% if (item.Image == null)
                                       { %>
                                    <img src="../../assets/img/avatar.png" alt="<%: @Html.DisplayFor(m => item.Firstname) %>" height="70" width="70" />

                                    <%}
                                       else
                                       { %>

                                    <%      
                                           {
                                               var base64 = Convert.ToBase64String(item.Image);
                                               var imgSrc = String.Format("data:image/jpg;base64,{0}", base64);
                                    %>

                                    <img src="<%: @imgSrc %>" alt="<%: @Html.DisplayFor(m => item.Firstname) %>" height="70" width="70" /><%} %>
                                    <%} %>--%>
                                    <%: @Html.DisplayFor(m => item.po_number) %>
                                </td>

                                <td><%: Html.DisplayFor(m => item.item_code) %></td>
                                <td><%: Html.DisplayFor(m => item.item_description) %></td>
                                <td><%: Html.DisplayFor(m => item.Category) %></td>
                                <td id="agent_commission_model"><b><%: Html.DisplayFor(m => item.qty_ordered) %></b></td>
                                     <td><%: Html.DisplayFor(m => item.vendor_name) %></td>
                                <td id="agent_commission_model"><b><%: Html.DisplayFor(m => item.Password) %></b></td>
                                <td id="agent_commission_model"><b><%: Html.DisplayFor(m => item.qty_reject) %></b></td>
                                 <td><%: Html.DisplayFor(m => item.expiry_date) %></td>
                                <td style="text-align:center;">
                                    <% if (item.IsActive == 1) 
                                    { %>                                    
                                        <%--<span class="label label-primary">Active</span>--%>

                                        <a href="##DeactivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-success">Active</span></a>
                                        
                                        <!-- Deactvate User Modal -->
                                        <div class="modal fade" id="#DeactivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title"> Deactivate User</h4>
                                                    </div>
                                                    <% using (Html.BeginForm("DeactivateActivateRawMaterials", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register", enctype = "multipart/form-data" }))
                                                    { %>
                                                        <div class="modal-body">
                                                           Are you sure you want to deactivate the Raw Material <strong><%: Html.DisplayFor(m => item.item_description) %> <%--<%: Html.DisplayFor(m => item.Middlename) %> <%: Html.DisplayFor(m => item.Lastname) %>--%></strong>?
                                                           
                                                            <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                                           <input type="hidden" name="Operation" value="Deactivate" />
                                                        </div>
                                                        <div class="modal-footer clearfix"> 
                                      <%--                       <button type="submit" class="btn btn-primary"> Yes</button>         --%>                
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
                                    <a href="##ActivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-warning">Inactive</span></a>

                                    <!-- Activate User Modal -->
                                    <div class="modal fade" id="#ActivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title"> Activate User</h4>
                                                </div>
                                                <% using (Html.BeginForm("DeactivateActivateRawMaterials", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register", enctype = "multipart/form-data" }))
                                                { %>
                                                    <div class="modal-body">
                                                        Are you sure you want to Activate the User <strong><%: Html.DisplayFor(m => item.item_description) %> <%--<%: Html.DisplayFor(m => item.Middlename) %> <%: Html.DisplayFor(m => item.Lastname) %>--%></strong>?
                                                           
                                                        <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                                        <input type="hidden" name="Operation" value="Activate" />
                                                    </div>
                                                    <div class="modal-footer clearfix"> 
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

                             <td style="text-align: center;" id="<%: Session["Position"] %>">
                                    <a class="btn btn-xs btn-primary" href="/QAPoSummaryCheck/PartialReceivingCancel/<%: Html.DisplayFor(m => item.po_sum_id) %>"><i class="fa fa-edit"></i></a>
                     

                                
                                    
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
            <!-- /.box  keydown keyup -->
        </div>
    </div>

    <script>
        //$(function () {
        //    $("#partial, #remaining,#total,#clickme").on("keydown keyup click mouseclick", sum);
        //    function sum() {

        //        $("#total").val(Number($("#remaining").val()) + Number($("#partial").val()));


        //    }
        //});


// 1,557,564,534




        function numberWithCommas(number) {
            var parts = number.toString().split(".");
            parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            return parts.join(".");
        }
        $(document).ready(function () {
            $("#agent_commission_model b").each(function () {
                var num = $(this).text();
                var commaNum = numberWithCommas(num);
                $(this).text(commaNum);
            });
        });

    </script>


        <style>
                .Senior.Automation{
            display:none;
        }
    </style>

</asp:Content>
