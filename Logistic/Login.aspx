<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Logistic.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <!-- Basic -->
        <title>Core Logistic</title>
		<meta charset="UTF-8">

		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="Porto Admin - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>
</head>
<body>

<style style="text/css">
body {
  background-image: url("assets/images/slide01.jpg");
  background-position: 50% 50%;
  background-repeat: repeat;
}
</style>


    <form id="form1" runat="server">
   <!-- start: page -->
		<section class="body-sign">
			<div class="center-sign">
				<a href="index.aspx" class="logo pull-left" style="margin-top:26px">
				<img src="assets/images/logo.png" height="60" alt="Porto Admin" />
				</a>
				<div class="panel panel-sign">               
					<div class="panel-title-sign mt-xl text-right">
                    
						<h2 class="title text-uppercase text-bold m-none">

                      
                        <asp:DropDownList ID="ddlType" class="form-control" runat="server">
                                                        <asp:ListItem>-Login Type-</asp:ListItem>
                                                        <asp:ListItem>Client</asp:ListItem>
                                                        <asp:ListItem>Employee</asp:ListItem>
                                                        <asp:ListItem>Partner</asp:ListItem>
                                                        <asp:ListItem>Admin</asp:ListItem>
                                                     </asp:DropDownList>
                                                      <i class="fa fa-user mr-xs"></i> Sign In</h2>
					</div>
					<div class="panel-body">
				
							<div class="form-group mb-lg">
								<label>Username</label>
								<div class="input-group input-group-icon">
                                    <input id="txtUserId" runat="server" type="text" class="form-control input-lg" placeholder="Username">
									<span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-user"></i>
										</span>
									</span>
								</div>
							</div>

							<div class="form-group mb-lg">
								<div class="clearfix">
									<label class="pull-left">Password</label>
									<%--<a href="pages-recover-password.html" class="pull-right">Lost Password?</a>--%>
								</div>
								<div class="input-group input-group-icon">
                                <input id="txtPassword" runat="server" type="password" class="form-control input-lg" placeholder="********">
									<span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-lock"></i>
										</span>
									</span>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-8">
									<div class="checkbox-custom checkbox-default">
										<%--<input id="RememberMe" name="rememberme" type="checkbox"/>
										<label for="RememberMe">Remember Me</label>--%>
									</div>
								</div>
								<div class="col-sm-4 text-right">
                                     <asp:LinkButton ID="LinkButton1" class="btn btn-primary hidden-xs" runat="server" onclick="btnLogin_Click">Sign In </asp:LinkButton>
                                     <asp:LinkButton ID="btnLogin" class="btn btn-primary btn-block btn-lg visible-xs mt-lg" runat="server" onclick="btnLogin_Click">Sign In </asp:LinkButton>
								</div>
							</div>

							

							<%--<p class="text-center">Don't have an account yet? <a href="pages-signup.html">Sign Up!</a>

						
					--%></div>
				</div>

				<p style="color:black;">&copy; Copyright 2017. All Rights Reserved.</p>
			</div>
		</section>
		<!-- end: page -->

		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>
    </form>
</body>
</html>
