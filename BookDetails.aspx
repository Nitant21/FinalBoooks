<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookDetails.aspx.cs" Inherits="BookDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 302px;
        }
        .auto-style2 {
            height: 367px;
            width: 614px;
        }
        .auto-style3 {
            height: 56px;
        }
        .auto-style4 {
            width: 771px;
            height: 31px;
        }
    </style>
</head>
<body style="background-image:url(images/14.jpg); background-size:cover" >
    <form id="form1" runat="server">
       
        
        <div style="height: 133px; width: 1082px; ">
            <h3 style="color:cornsilk"><asp:Label ID="Label9" runat="server" Text="Label" Height="25px" Width="107px"></asp:Label></h3>
            <br />
            <br />
            <asp:Label ID="lbl" runat="server" Text="Label" style="color:cornsilk" Height="25px" Width="107px"></asp:Label>
            <br />
            <br />
        </div>

        <table align ="center">
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" Height="310px" style="margin-top: 0px" Width="540px" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" align="center" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Pic") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Title">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Original_price">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Original_price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Selling_price">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Selling_price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No_of_pages">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("No_of_pages") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Publication">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Publication") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Exchange">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# (Convert.ToBoolean(Eval("Exchange"))? "Yes" : "No") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status_book">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# (Convert.ToBoolean(Eval("Status_book")) ? "Available" : "Sold") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
                </td> 
            </tr>
            <tr>
                <td colspan="2" style="padding:15px">
                    &nbsp;</td> 
            </tr>
            <tr>
                <td>
                    <h4 class="auto-style4"> &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label10" runat="server" Font-Size="XX-Large" Text="Authors-:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:Label ID="lbl2" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label></h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <h4>&nbsp;</h4>
                </td>
              
            </tr>
        </table>

        <table  border="2"  padding="10px" class="auto-style2"style="background-color:#f1c68e;border-color:black;border-style:solid"">
            <tr>
                <td colspan="2">
                    <h2 style="color:black;text-align:center;font-display:block" >
                     Owner Details:</h2>
                </td>
            </tr>
            
                    &nbsp;
           
            <tr>
               
                <td>
                     <h3 style="color:black">
                    Name :</h3>
                </td>
                <td class="auto-style1">
                     <h3 style="color:black">
                     <asp:Label ID="lblName" runat="server"></asp:Label></h3>
                </td>
            </tr>
            <tr>
                <td>
                    <h3 style="color:black">
                        Email Id :
                    </h3>
                </td>
                 <td class="auto-style1">
                    <h3 style="color:black">
                         <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </h3>
                </td>
            </tr>
            <tr>
                <td>
                    <h3 style="color:black">
                        Mobile No :
                    </h3>
                </td>
                 <td class="auto-style1">
                    <h3 style="color:black">
                         <asp:Label ID="lblMobileNo" runat="server"></asp:Label>
                    </h3>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="auto-style3">
                    <%-- <asp:Button ID="btnContact" runat="server" OnClick="btnContact_Click" Text="Contact Owner" BackColor=" #885411" BorderColor="#7B7167" BorderStyle="Inset" Height="38px" Width="140px" Font-Bold="True" />--%>
                </td>
            </tr>
        </table>
        
       
        
        
       
       
       
        <p style="color:cornsilk" >
            Post Feedback :</p>
        <asp:TextBox ID="txtFeed" runat="server" Height="126px" Width="726px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnPost" runat="server" OnClick="btnPost_Click" Text="Post" BackColor="#885411" BorderColor="Black" BorderStyle="Inset" Font-Bold="True" ForeColor="Black" Height="50px" Width="155px" />
           
        <p style="color:cornsilk">
            Reviews :</p>
        <p >
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" Width="187px">
                <AlternatingItemStyle BackColor="PaleGoldenrod" />
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <ItemTemplate>
                    &nbsp;<asp:Label ID="User_idLabel" runat="server" Text='<%# Eval("User_id") %>' />
                    &nbsp;: &nbsp;<asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                </ItemTemplate>
                <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [User_id], [Comment] FROM [Feedback] WHERE ([Book_id] = @Book_id)">
                <SelectParameters>
                    <asp:SessionParameter Name="Book_id" SessionField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
                 
           
    </form>
</body>
 
</html>
