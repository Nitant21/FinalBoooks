<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
     <style>
        @import url('https://fonts.googleapis.com/css?family=Nunito');
@import url('https://fonts.googleapis.com/css?family=Poiret+One');

body, html {
	height: 100%;
	background-repeat: no-repeat;    /*background-image: linear-gradient(rgb(12, 97, 33),rgb(104, 145, 162));*/
	background:black;
	position: relative;
   background-image:url("https://thecsspoint.com/wp-content/uploads/2018/12/01-44.jpg");
   background-size:cover;
}
#login-box {
	position: absolute;
	top: 0px;
	left: 50%;
	transform: translateX(-50%);
	width: 350px;
	margin: 0 auto;
	border: 1px solid black;
	background: rgba(48, 46, 45, 1);
	min-height: 250px;
	padding: 20px;
	z-index: 9999;
}
#login-box .logo .logo-caption {
	font-family: 'Poiret One', cursive;
	color: white;
	text-align: center;
	margin-bottom: 0px;
}
#login-box .logo .tweak {
	color: #ff5252;
}
#login-box .controls {
	padding-top: 30px;
}
#login-box .controls input {
	border-radius: 0px;
	background: rgb(98, 96, 96);
	border: 0px;
	color: white;
	font-family: 'Nunito', sans-serif;
}
#login-box .controls input:focus {
	box-shadow: none;
}
#login-box .controls input:first-child {
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
}
#login-box .controls input:last-child {
	border-bottom-left-radius: 2px;
	border-bottom-right-radius: 2px;
}
#login-box button.btn-custom {
	border-radius: 2px;
	margin-top: 8px;
	background:#ff5252;
	border-color: rgba(48, 46, 45, 1);
	color: white;
	font-family: 'Nunito', sans-serif;
}
#login-box button.btn-custom:hover{
	-webkit-transition: all 500ms ease;
	-moz-transition: all 500ms ease;
	-ms-transition: all 500ms ease;
	-o-transition: all 500ms ease;
	transition: all 500ms ease;
	background: rgba(48, 46, 45, 1);
	border-color: #ff5252;
}
#particles-js{
  	width: 100%;
  	height: 100%;
  	background-size: cover;
  	background-position: 50% 50%;
  	position: fixed;
  	top: 0px;
  	z-index:1;
}
    </style>


    </head>
<body>
    <h1 style="text-align:center" >Login Page</h1>
    <form id="form1" runat="server">
        <div>
            <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div id="login-box">
		<div class="logo">
			<img src="https://thecsspoint.com/wp-content/uploads/2018/12/01-44.jpg" class="img img-responsive img-circle center-block"/>
			<h1 class="logo-caption"><span class="tweak">L</span>ogin</h1>
		</div><!-- /.logo -->
		<div class="controls">
			<asp:TextBox ID="txt_uid" runat="server" placeholder="Username" class="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="txt_uid" ErrorMessage=" Please enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_pwd" runat="server" TextMode="Password" placeholder="Password" class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_pwd" ErrorMessage=" Please enter Password" ForeColor="Red"></asp:RequiredFieldValidator>

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" class="btn btn-default btn-block btn-custom" />
            <br /><br />
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label><br />
            <asp:Button ID="btnForgotPassword" runat="server" OnClick="btnForgotPassword_Click" Text="Forgot Password" /><br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">SignUp</asp:HyperLink>

            
		</div><!-- /.controls -->
	</div><!-- /#login-box -->
</div><!-- /.container -->
<div id="particles-js"></div>
<!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"></script>-->
        </div>
       
            
               
    </form>
</body>
</html>
