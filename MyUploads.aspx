<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyUploads.aspx.cs" Inherits="MyUploads" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-right: 1px;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 112px;
        }
        .auto-style4 {
            width: 112px;
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
        }
    </style>
</head>
<body style="background-image:url(images/book10.jpg) ;opacity: 0.8;filter: alpha(opacity=80); background-size:cover">
    <form id="form1" runat="server">
         <div align ="center">
    <p style="height: 3px">
       
        <h1 style="color:white" >My Books</h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" Text="Go Back" />
             </p>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="Book_id" DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" CssClass="auto-style1" ForeColor="#FF9933" Width="234px">
            <AlternatingItemStyle BackColor="PaleGoldenrod" />
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <ItemTemplate>
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style3">Title: </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Black" Text='<%# Eval("Title") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Publication:</td>
                        <td>
                            <asp:Label ID="PublicationLabel" runat="server" Font-Size="Larger" ForeColor="Black" Text='<%# Eval("Publication") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Category:</td>
                        <td>
                            <asp:Label ID="CategoryLabel" runat="server" Font-Size="Larger" ForeColor="Black" Text='<%# Eval("Category") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Status_book:</td>
                        <td>
                            <asp:Label ID="Status_bookLabel" runat="server" Font-Size="Larger" ForeColor="Black" Text='<%# (Convert.ToBoolean(Eval("Status_book")) ? "Available" : "Sold") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Book_id:</td>
                        <td class="auto-style5">
                            <asp:Label ID="Book_idLabel" runat="server" Font-Size="Larger" ForeColor="Black" Text='<%# Eval("Book_id") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Button1" runat="server" BackColor="#FF9966" BorderColor="#FF6600" BorderStyle="Inset" Height="30px" OnClick="Button1_Click" Text="Mark as sold" Visible='<%# Eval("Status_book") %>' Width="150px" />
                        </td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
       </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [Title], [Publication], [Category], [Status_book], [Book_id] FROM [Books] WHERE ([User_id] = @User_id)">
            <SelectParameters>
                <asp:SessionParameter Name="User_id" SessionField="user_id" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>     
    </form>
</body>
</html>
