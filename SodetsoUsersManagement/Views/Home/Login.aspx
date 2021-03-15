 <%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<SodetsoUsersManagement.Models.LoginModel>" %>

<!DOCTYPE html>
<html class="bg-light">
<head>
    <meta charset="UTF-8">
    <title>Login | Fedora QA</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- bootstrap 3.0.2 -->
    <link href="/Content/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- font Awesome -->
    <link href="/Content/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/Content/css/AdminLTE.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/css/mynewstyle.css" rel="stylesheet" type="text/css" />

</head>
<body class="bg-light">

    <div class="form-box" id="login-box">
        <div class="header" id="login-header" style="background-color:#3C8DBC; font-family: 'Kaushan Script', cursive;
    height: 60px;"> QA Fedora PO Checklist </div>

        <% using (Html.BeginForm("WebLogin", null, FormMethod.Post, new { role = "form", id = "FormUser", enctype = "multipart/form-data" }))
           { %>
        <div class="body bg-gray">
            <div class="form-group">
                <label for="exampleInputEmail1" class="lblUsername">Username</label>
                    <div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <%: Html.TextBoxFor(model => model.Email, new { @class = "form-control", @placeholder="Enter Username ", @required = "true", @autofocus="autofocus"}) %>
                <%: Html.ValidationMessageFor(model => model.Email, "", new { @class = "text-danger" }) %>
            </div>
                </div>


            <div class="form-group">
                <label for="exampleInputEmail1" class="lblPassword">Password</label>
                 <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <%: Html.PasswordFor(model => model.Password, new { @class = "form-control", @placeholder="Enter Password", @required = "true"}) %>
                <%: Html.ValidationMessageFor(model => model.Password, "", new { @class = "text-danger" }) %>
                    </div>
                </div>


            <div class="form-group">
                <input type="checkbox" name="remember_me" />
                Remember me
                   
            </div>
        </div>
        <div class="footer body bg-gray">
            <button type="submit" class="btn btn-block" style="background-color:#3C8DBC; color:white; font-size:20px; border-radius:10px; font-family:Georgia, serif">&nbsp;Log in</button>
     
        </div>
        <% } %>
    </div>


    <!-- jQuery 2.0.2 -->
    <script src="/Content/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/Content/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>

        Swal.fire(
            'Good job!',
            'You clicked the button!',
            'success'
        )
    </script>

</body>
</html>
