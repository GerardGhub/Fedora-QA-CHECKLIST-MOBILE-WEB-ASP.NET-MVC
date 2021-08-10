<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
        <div class="pull-left image">
            <img src="/Content/img/x.jpg" class="img-circle" alt="User Image" />
        </div>
        <div class="pull-left info">
            <p><%: Session["Firstname"] %></p>

            <a href="#"><i class="fa fa-circle text-success"></i>Online</a>
        </div>
    </div>

    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu">
        <li class="active">
            <a href="/Home/Index">
                <i class="fa fa-dashboard"></i><span>Dashboard</span>
            </a>
        </li>
        <li class="treeview" id="<%: Session["Position"] %>">
            <a href="#">
                <i class="fa fa-users"></i>
                <span>Users Management</span>
                <i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
                <li><a href="/UsersManagement/AddUser"><i class="fa fa-angle-double-right"></i>Add User</a></li>
                <li><a href="/UsersManagement/UsersList"><i class="fa fa-angle-double-right"></i>Users List <%--<b style="background-color:red;color:white;border-radius:50px;">&nbsp;<%: Model.UsersList %>&nbsp;</b>--%></a></li>
                <li><a href="/UsersManagement/ActiveUsers"><i class="fa fa-angle-double-right"></i>Active Users <%--<b style="background-color:red; color:white; border-radius:50px;">&nbsp;<%: Model.ActiveUsers %>&nbsp;</b>--%></a></li>
                <li><a href="/UsersManagement/InactiveUsers"><i class="fa fa-angle-double-right"></i>Inactive Users <%--<b style="background-color:red; color:white; border-radius:50px;">&nbsp;<%:Model.InActiveUsers%>&nbsp;</b>--%></a></li>
                <li><a href="/UsersManagement/ArchivedUsers"><i class="fa fa-angle-double-right"></i>Archived Users <%--<b style="background-color:red; color:white; border-radius:20px;">&nbsp;<%:Model.ArchivedUsers %>&nbsp;</b--%>></a></li>
            </ul>
        </li>
<%--           <li class="treeview, <%: Session["Position"] %>">
            <a href="#">
                <i class="fa fa-tags"></i>
                <span>PO Summary CheckList</span>
                <i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
                <li><a href="/UsersManagement/AddUser"><i class="fa fa-angle-double-right"></i>Add User</a></li>
                <li><a href="/UsersManagement/UsersList"><i class="fa fa-angle-double-right"></i>Users List</a></li>
                <li><a href="/UsersManagement/ActiveUsers"><i class="fa fa-angle-double-right"></i>Active Users</a></li>
                <li><a href="/UsersManagement/InactiveUsers"><i class="fa fa-angle-double-right"></i>Inactive Users</a></li>
                <li><a href="/UsersManagement/ArchivedUsers"><i class="fa fa-angle-double-right"></i>Archived Users</a></li>
            </ul>
        </li>
        <li class="treeview, <%: Session["Position"] %>">
            <a href="#">
                <i class="fa fa-truck"></i>
                <span>Supplier Evaluations</span>
                <i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
                <li><a href="/UsersManagement/AddUser"><i class="fa fa-angle-double-right"></i>Add User</a></li>
                <li><a href="/UsersManagement/UsersList"><i class="fa fa-angle-double-right"></i>Users List</a></li>
                <li><a href="/UsersManagement/ActiveUsers"><i class="fa fa-angle-double-right"></i>Active Users</a></li>
                <li><a href="/UsersManagement/InactiveUsers"><i class="fa fa-angle-double-right"></i>Inactive Users</a></li>
                <li><a href="/UsersManagement/ArchivedUsers"><i class="fa fa-angle-double-right"></i>Archived Users</a></li>
            </ul>
        </li>--%>
        <li>
            <a type="button" class="btn btn-default delete-event"  data-dismiss="modal" data-url="#" data-confirmation="Are you sure you want to logout?" data-confirmation-title="QC CheckList">
     
                
                <%--     <a href="/Home/SignOut">--%>
                <i class="fa fa-power-off"></i><span>Logout</span>

            </a>
        </li>
       
    </ul>


      


</section>
