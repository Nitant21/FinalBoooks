<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" type="text/css" href="Styles/RegisterPageStyleSheet.css"/>
   <link rel="stylesheet" type="text/css" href="Styles/animate.css"/>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css"/>

    <style type="text/css">
        hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 10px;
}
.registerbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}
        .auto-style3 {
           width: 550px;
    padding: 16px;
    border: 2px solid black;
    border-radius: 15px;
    background-color: azure;
    margin-left: auto;
    margin-right: auto;
    margin-bottom: auto;
    margin-top: auto;
        }
        </style>
</head>
<body style="background-image:url(images/BooksReg.jpg); background-size:cover">
    <form  id="form1" runat="server">
      <!--  <div class="regmainpage wow fadeInDown">-->
        <div class="auto-style3 wow fadeInDown" style="border-radius: 15px;">
            <h1 class="wow bounceIn delay-1s">Register</h1>
            <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

            <br />

            <asp:Label class="wow bounceIn delay-2s" ID="Label8" runat="server"><b>User ID</b></asp:Label>
            <br />
            &nbsp;
            <asp:TextBox  cssclass="wow bounceIn delay-1s" ID="txt_u_name" runat="server"  Height="40px" Width="486px"  onchange="checkIDAvailability()" ></asp:TextBox>

             <asp:Label ID="check_id" runat="server" ForeColor="Red"></asp:Label>

            &nbsp;&nbsp;<br />
            &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_u_name" ErrorMessage="Please specify username" ForeColor="Red"></asp:RequiredFieldValidator>



            <br />
            <asp:Label cssclass="wow bounceIn delay-3s" ID="Label2" runat="server"><b>Name</b></asp:Label>
            <br />
            <br />


            <asp:TextBox cssclass="wow fadeInUp delay-3s" ID="txt_name" runat="server" Height="40px" Width="486px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_name" ErrorMessage="Name not specified" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label class="wow bounceIn delay-3s" ID="Label3" runat="server"><b>Email</b></asp:Label>
            <br />
            <br />
            &nbsp;<asp:TextBox cssclass="wow fadeInUp delay-3s" ID="txt_email" runat="server"  Height="40px" Width="486px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_email" ErrorMessage="Please enter your Email Id" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="Please enter valid Email Id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <asp:Label class="wow bounceIn delay-3s" ID="Label4" runat="server"><b>Mobile No.</b></asp:Label>
            <br />
            <br />
            &nbsp;<asp:TextBox cssclass="wow fadeInUp delay-3s" ID="txt_mobno" runat="server" Height="40px" Width="486px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_mobno" ErrorMessage="Please enter your Mobile No." ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_mobno" ErrorMessage="Incorrect Mobile Number " ForeColor="Red" ValidationExpression="^[7-9]\d{9}$"></asp:RegularExpressionValidator>
            <br />

            <asp:Label class="wow fadeIn delay-3s" ID="Label6" runat="server"><b>Password</b></asp:Label>
            <br />
            <br />
            &nbsp;<asp:TextBox cssclass="wow fadeInUp delay-3s" ID="txt_pwd" runat="server" Height="40px" Width="486px" TextMode="Password"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server"  ControlToValidate="txt_pwd" ErrorMessage="Please enter password" ForeColor="Red" ></asp:RequiredFieldValidator>
            <asp:regularexpressionvalidator display="Dynamic" id="RegularExpressionValidator15" controltovalidate="txt_pwd" runat="server" errormessage="Password must be 8-10 characters long with at least one numeric,</br>one upper case character and one special character." forecolor="Red" validationexpression="^[a-zA-Z0-9'@&#.\s]{7,10}$" />

            <br />
            <asp:Label class="wow bounceIn delay-3s" ID="Label7" runat="server"><b>Confirm Password</b></asp:Label>
            <br />
            <br />
            <asp:TextBox cssclass="wow fadeInUp delay-3s" ID="txt_c_pwd" runat="server" Height="40px" Width="486px" TextMode="Password"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_c_pwd" ErrorMessage="Please  confirm your password " ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_pwd" ControlToValidate="txt_c_pwd" ErrorMessage="Password and Confirm Password Should Match" ForeColor="Red" ></asp:CompareValidator>
            <br />
            &nbsp;<asp:Label class="wow bounceIn delay-3s" ID="Label9" runat="server" Text="&lt;b&gt;Adress&lt;/b&gt;"></asp:Label>
            <br />
            <asp:TextBox cssclass="wow fadeInUp delay-3s" ID="txt_address" runat="server" TextMode="MultiLine" Height="47px" Width="197px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_address" ErrorMessage="Please specify your address" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label class="wow bounceIn delay-3s" ID="Label10" runat="server" Text="&lt;b&gt;Area&lt;/b&gt;"></asp:Label>
            <br />
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" Height="28px" Width="515px">
                 <asp:ListItem Selected="True"></asp:ListItem>
            <asp:ListItem>Western Suburbs</asp:ListItem>
            <asp:ListItem>Central Suburbs</asp:ListItem>
            <asp:ListItem>South Mumbai</asp:ListItem>
            <asp:ListItem>Thane</asp:ListItem>
            <asp:ListItem>Navi Mumbai</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList1" ErrorMessage=" Field Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <asp:Button cssclass="wow bounceIn delay-3s" ID="registerbtn" runat="server" OnClick="Button1_Click" Text="SignUp" BackColor="RoyalBlue" Font-Bold="True" Height="60px" Width="526px" />

            <hr />
            <div class="container signin">
                <p>
                    Already have an account?
                    <asp:Button ID="Button2" runat="server" Height="20px" OnClick="Button2_Click" Text="Login" BackColor="RoyalBlue" />
                </p>
            </div>
        </div>
                       
    </form>

         <script src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.2.js"></script>
    <script type="text/javascript">
         function checkIDAvailability() {
            $.ajax({
                type: "POST",
                url: "Register.aspx/checkUserName",
                data: "{IDVal: '" + $("#<% =txt_u_name.ClientID %>").val() + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: onSuccess,
                failure: function (AjaxResponse) {
                    document.getElementById("check_id").innerHTML = "Dfgdfg";
                }
            });
            function onSuccess(AjaxResponse) {
                document.getElementById("check_id").innerHTML = AjaxResponse.d;
            }
        }
         </script>
    



     <script src="js/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>
      </body>
</html>
