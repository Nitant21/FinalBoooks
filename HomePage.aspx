<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" MasterPageFile="~/BookStore.master"%>

<asp:Content ID="content1" ContentPlaceHolderID="contentBody" runat="server">

    
    <div class="" style="background-image:url(images/3.jpg);background-size:cover">
    
    <nav class="navbar  navbar-inverse"  >
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="HomePage.aspx">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact</a></li>
                     <%--<li id="Li1" runat="server"><a href="Register.aspx"><span class="glyphicon glyphicon-user">SignUp</span></a></li>
                    <li id="Li2" runat="server"><a href="Login.aspx"><span class="glyphicon glyphicon-log-in ">Login</span> </a></li>--%>
               
                    
                </ul>
                
                <ul id="menu" class="nav navbar-nav navbar-right" >
                    <%--<li> <input type="text" name="search" placeholder="Search.." ></li>
                    <li id="li_moderator" runat="server"><a href="~/">Moderator</a></li>--%>
                    <li id="signuppage" runat="server"><a href="Register.aspx"><span class="glyphicon glyphicon-user">SignUp</span></a></li>
                    <li id="loginpage" runat="server"><a href="Login.aspx"><span class="glyphicon glyphicon-log-in ">Login</span> </a></li>
                </ul>
            </div>
        </div>
    </nav>
   
        <div align="center">
            <div>
             <table class="wow fadeInUp delay-2s" align ="center" >
            <tr style="background-color:darksalmon" >
           
                <td>
                <asp:Label ID="Label1" runat="server" Text="Select Area" Font-Bold="False" ForeColor="Black"></asp:Label></td>
<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
           <td> <asp:Label ID="Label2" runat="server" Text="Select Category" ForeColor="Black"></asp:Label></td>
<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
          <td>  <asp:Label ID="Label3" runat="server" Text="Select Title"></asp:Label></td>
<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
          <td>  <asp:Label ID="Label4" runat="server" Text="Select Author"></asp:Label></td>
       </tr>
<tr style="background-color:#ffcccc">
    <td >
        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Selected="True"></asp:ListItem>
            <asp:ListItem>Western Suburbs</asp:ListItem>
            <asp:ListItem>Central Suburbs</asp:ListItem>
            <asp:ListItem>South Mumbai</asp:ListItem>
            <asp:ListItem>Thane</asp:ListItem>
            <asp:ListItem>Navi Mumbai</asp:ListItem>
            </asp:DropDownList>
        </td>
    <td>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem Selected="True"></asp:ListItem>
            <asp:ListItem>Fiction</asp:ListItem>
            <asp:ListItem>Educational</asp:ListItem>
            <asp:ListItem>Children</asp:ListItem>
            <asp:ListItem>Philosophy</asp:ListItem>
            <asp:ListItem>Business & Management</asp:ListItem>
            <asp:ListItem>Biography</asp:ListItem>
            <asp:ListItem>Money & Investment</asp:ListItem>
            <asp:ListItem>Competitive Examinations</asp:ListItem>
            <asp:ListItem>Computers, Mobile, Digital</asp:ListItem>
            <asp:ListItem>Religion & Spirituality</asp:ListItem>
            <asp:ListItem>Self Help</asp:ListItem>
            <asp:ListItem>Miscellaneous</asp:ListItem>
            </asp:DropDownList>
        </td>
       <!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
    <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
    <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
<!--&nbsp;&nbsp;&nbsp;&nbsp;-->
    <td class="auto-style1">
        <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="Button1_Click" BackColor="#990000" BorderColor="#993300" BorderStyle="Inset" BorderWidth="2px" ForeColor="White" Height="50px" Width="110px" />
  </td> 

</tr>    
</table>
               </div>
            <div>
                 <br />
 
                 <asp:Button ID="Button2" runat="server" Text="Add A Book" OnClick="Button2_Click1" BackColor="#B76C4C" BorderColor="#990000" BorderStyle="Outset" BorderWidth="5px" ForeColor="White" Height="52px" Width="174px" />



            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="My Profile" BackColor="#B76C4C" BorderColor="#990000" BorderStyle="Inset" BorderWidth="5px" ForeColor="White" Height="52px" Width="174px" />



            </div>
        
            <br />
        
            
        
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None" EmptyDataText="No Records Found!" ShowHeaderWhenEmpty="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" Width="884px" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="127px" Width="136px" ImageUrl='<%# Bind("Pic") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Selling_price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="View Details" BackColor="#AFC3D0" BorderColor="#159F5C" BorderStyle="Inset" BorderWidth="2px" Font-Bold="False" Font-Italic="False" Font-Names="Castellar" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="43px" Width="151px" />
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="BookId">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Book_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>

        
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;   


            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />


        </div>
  


     <style type="text/css">


        tr:hover {background-color: #f5f5f5;}
        tr:nth-child(odd) {background-color: #f2f2f2;}
        
        table th
        {
            padding: 5px;
            border: 1px solid #ccc;
            background-color:darkslategray;
        }
        table th
        {
            background-color:darkgray;
            color: #333;
            font-weight: bold;
        }
        table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
         .auto-style1 {
             width: 88px;
         }
        </style>
</div>

</asp:Content>


