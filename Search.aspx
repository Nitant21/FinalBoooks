<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 318px">
    <form id="form2" runat="server">
    <div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Select Area"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Select Category"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Select Title"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server" Text="Select Author"></asp:Label>
        </div>
        <div>
        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Selected="True"></asp:ListItem>
            <asp:ListItem>Western Suburbs</asp:ListItem>
            <asp:ListItem>Central Suburbs</asp:ListItem>
            <asp:ListItem>South Mumbai</asp:ListItem>
            <asp:ListItem>Thane</asp:ListItem>
            <asp:ListItem>Navi Mumbai</asp:ListItem>
            </asp:DropDownList>&nbsp;
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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>
        
        <div>
            <asp:ListBox ID="ListBox1" runat="server" Width="500px"></asp:ListBox>
        </div>
    </div>
    </form>
</body>
</html>
