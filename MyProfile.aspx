<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="New" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 95%;
        }
        .auto-style3 {
            width: 138px;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 125px;
        }
        .auto-style6 {
            margin-left: 640px;
        }
    </style>
</head>
<body style="background-image:url(images/booksa.jpeg);background-size:cover" >
    <form id="form1" runat="server">
        <div align="center" >
            <h1>Profile Page</h1>
            <p>
                <asp:Button ID="btnUploads" runat="server" OnClick="btnUploads_Click" Text="My Uploads" BackColor="#E6CEB6" BorderStyle="Groove" Height="48px" Width="160px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
            <nav class="auto-style6">

                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Logout" BackColor="#E6CEB6" BorderColor="White" BorderStyle="Inset" Height="52px" Width="114px" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Go Back" BackColor="#E6CEB6" BorderStyle="Ridge" Height="52px" Width="114px" />

            </nav>
        <div align="center">
            
            <br />
            <br />
            <br />
            <br />
            
            <asp:DataList ID="DataList1" runat="server" OnEditCommand="DataList1_EditCommand" OnUpdateCommand="DataList1_UpdateCommand" Width="347px">
                <EditItemTemplate>
                    <table class="auto-style4" border="1" style="border-color:black">
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label12" runat="server" Text="User ID"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_uid" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label3" runat="server" Text="Mobile Number"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_mbno" runat="server" Text='<%# Bind("Mobileno") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label7" runat="server" Text="Email"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_email" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label8" runat="server" Text="Address"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_addr" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label6" runat="server" Text="Area"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem Selected="True"></asp:ListItem>
                                    <asp:ListItem>Western Suburbs</asp:ListItem>
                                    <asp:ListItem>Central Suburbs</asp:ListItem>
                                    <asp:ListItem>South Mumbai</asp:ListItem>
                                    <asp:ListItem>Thane</asp:ListItem>
                                    <asp:ListItem>Navi Mumbai</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Button ID="Button3" runat="server" Text="Update" CommandName="Update" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    &nbsp;
                    <br />
                    &nbsp; <br />
                    &nbsp;
                    <br />
                </EditItemTemplate>
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label9" runat="server" Text="Name" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_name" runat="server" Text='<%# Bind("Name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label10" runat="server" Text="Mobile Number" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_mbno" runat="server" Text='<%# Bind("Mobileno") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label4" runat="server" Text="Email" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Email" runat="server" Text='<%# Bind("Email") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label5" runat="server" Text="Address" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_address" runat="server" Text='<%# Bind("Address") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label11" runat="server" Text="Area" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_area" runat="server" Text='<%# Bind("Area") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Button ID="Button2" runat="server" CommandName="Edit" Text="Edit Profile" />
                            </td>
                            <td>
                                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Change Password" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Remove Account" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                    </table>
                    &nbsp;
                    <br />
                    &nbsp;
                    <br />
                    &nbsp;
                    <br />
                    &nbsp;
                    <br />
                    &nbsp;
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            
        </div>
        </div>
    </form>
</body>
</html>
