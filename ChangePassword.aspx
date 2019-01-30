<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 57px;
        }
        .auto-style3 {
            width: 124px;
        }
        </style>
</head>

  <body style="background-image:url(images/chan.jpg); background-size:cover">


    <form id="form1" runat="server">
       
        <br />
        <h1 style="color:white">Welcome <asp:Label ID="Label3" runat="server" Text="" BorderColor="#990000" ForeColor="White"></asp:Label> </h1>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="Old Password" ></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_opass" runat="server" BorderColor="#194d33" Height="25px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="New Password"  ></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_npass" runat="server" BorderColor="#194d33" Height="25px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="Change" runat="server" OnClick="Change_Click" Text="Change" Height="34px" Width="122px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
       
    </form>
</body>
</html>
