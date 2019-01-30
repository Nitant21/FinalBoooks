<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DemoForget.aspx.cs" Inherits="DemoForget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;

        }
        .auto-style2 {
            width: 165px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
	        <div class="row">
		        <div class="col-sm-4">
                     <asp:Label ID="Label3" runat="server" Text="Enter Registered Email Address :"></asp:Label>
                    <div class="form-group pass_show"> 
                         <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </div> 
                    <div class="form-group pass_show"> 
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get Password" />
                    </div> 
                    <div class="form-group pass_show">
                        <asp:Label ID="Label2" runat="server" Text="."></asp:Label>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Correct Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Email Address Required" ForeColor="Red"></asp:RequiredFieldValidator>
                
                    </div>
            	</div>  
	        </div>
        </div>
       
       
    </form>
</body>
</html>