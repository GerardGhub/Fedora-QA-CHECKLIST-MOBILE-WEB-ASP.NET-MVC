<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<SodetsoUsersManagement.Models.DashboardModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: ViewBag.PageTitle = "Dashboard" %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-lg-3 col-xs-6 <%: Session["Position"] %>">
            <!-- small box -->
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h4><%: Model.UsersList %>
                                    </h4>
                    <p>
                        Users List
                                   
                    </p>
                </div>


                <div class="icon">
                    <i class="fa fa-users"></i>
                </div>
                <a href="#/UsersManagement/UsersList" class="small-box-footer">View <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6 <%: Session["Position"] %>">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h4><%: Model.ActiveUsers %></h4>
                    <p>
                        Active Users
                                   
                    </p>
                </div>
                <div class="icon">
                    <i class="fa fa-check-square-o"></i>
                </div>
                <a href="/UsersManagement/ActiveUsers" class="small-box-footer">View <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6 <%: Session["Position"] %>">
            <!-- small box -->
            <div class="small-box bg-yellow">
                <div class="inner">
                    <h4><%: Model.ReceivedRawMaterials %>
                                    </h4>
                    <p>
                  NULL
                                   
                    </p>
                </div>
                <div class="icon">
                    <i class="fa fa-minus-square-o"></i>
                </div>
                <a href="#/QAPoSummaryCheck/ReceivedRawMaterial" class="small-box-footer">View <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <!-- ./col -->
    <!-- ./col -->
  <div class="col-lg-3 col-xs-6 <%: Session["Position"] %>">
            <!-- small box -->
            <div class="small-box bg-red">
                <div class="inner">
                    <h4><%: Model.RejectRawMaterials %>
                                    </h4>
                    <b><p>
                       Rejections Raw Materials
                                   
                    </p></b>
                </div>
                <div class="icon">
              
                    <i class="fa fa-trash-o"></i>
                </div>
                <a href="#/QAPoSummaryCheck/RejectFinalMaterial" class="small-box-footer">View <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <!-- ./col -->
    </div>
    <!-- /.row -->

    <!-- top row -->
    <div class="row">
        <div class="col-xs-12 connectedSortable">
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- 2nd Row muna this -->
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h4><%: Model.VendorList %>
                                    </h4>
                    <b><p>
                       Cancelled Raw Materials
             
                    </p></b>
                </div>
                <div class="icon">
                    <i class="fa fa-list"></i>
                </div>
                <a href="/QAPoSummaryCheck/CancelRawMats" class="small-box-footer">View <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h4><%: Model.PoSummaryList %></h4>
                   <b> <p>
                   Micro Materials PO Summary 
                                   
                    </p></b>
                </div>
                <div class="icon">
                    <i class="fa fa-check-square-o"></i>
                </div>
                <a href="/QAPoSummaryCheck/PoList" class="small-box-footer">View <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-yellow">
                <div class="inner">
              <h4><%: Model.ReceivedRawMaterials %>
                                    </h4>
                    <b><p>
                     Raw Material's Receiving
                                   
                    </p></b>
                </div>
                <div class="icon">
                    <i class="fa fa-minus-square-o"></i>
                </div>
                <a href="/QAPoSummaryCheck/ReceivedRawMaterial" class="small-box-footer">View <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>



        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-red">
                <div class="inner">
                    <h4><%: Model.MacroRawMaterials %>
                                    </h4>
                    <p>
                         Macro Materials PO Summary
                    </p>
                </div>
                <div class="icon">
                    <i class="fa fa-check-square-o"></i>
                </div>
                <a href="/MacroMaterials/MacroRawMaterials" class="small-box-footer">View <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <!-- ./col -->
    </div>
    <!-- /.row -->



<div id="main_confirmation" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Confirmation</h4>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
            </div>
        </div>
    </div>
</div>





    <!-- top row -->
    <div class="row">
        <div class="col-xs-12 connectedSortable">
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
    <style>
                .Senior.Automation{
            display:none;
        }

        #QAStaff {
        
            display:none;
        }
    </style>

    <script>
        showConfirmation = function (title, message, success, cancel) {
            title = title ? title : 'Are you sure?';
            var modal = $("#main_confirmation");
            modal.find(".modal-title").html(title).end()
                .find(".modal-body").html(message).end()
                .modal({ backdrop: 'static', keyboard: false })
                .on('hidden.bs.modal', function () {
                    modal.unbind();
                });
            if (success) {
                modal.one('click', '.modal-footer .btn-primary', success);
            }
            if (cancel) {
                modal.one('click', '.modal-header .close, .modal-footer .btn-default', cancel);
            }
        };

        $(document).on("click", ".delete-event, .delete-all-event", function (event) {
            event.preventDefault();
            var self = $(this);
            var url = $(this).data('url');
            var success = function () {
                //alert('href="/Home/SignOut"');
                location.href = "/Home/SignOut";
         
            }
            var cancel = function () {
                //alert('Cancel');
            };
            if (self.data('confirmation')) {
                var title = self.data('confirmation-title') ? self.data('confirmation-title') : undefined;
                var message = self.data('confirmation');
                showConfirmation(title, message, success, cancel);
            } else {
                success();
            }
        });

    </script>

</asp:Content>
