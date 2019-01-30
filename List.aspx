<%@ Page Language="C#" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

    
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
          <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=AuthorList]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>

<body style="background-image:url(images/33.jpg);background-size:cover;">
    <form id="form1" runat="server">
        <div class="auto-style3 wow fadeInDown" style="border-radius: 15px;">
            <h1 class="wow bounceIn delay-1s">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ENTER BOOK DETAILS</h1>
            <p class="wow bounceIn delay-1s">&nbsp;</p>
            <asp:Label class="wow bounceIn delay-2s" ID="Label8" runat="server"><b>User ID</b></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h3><asp:Label ID="lbl_userid" runat="server"></asp:Label>&nbsp; </h3>




            <br />
            <asp:Label CssClass="wow bounceIn delay-3s" ID="Label9" runat="server"><b>Book Name/Title</b></asp:Label>
            <br />


            <asp:TextBox CssClass="wow fadeInUp delay-3s" placeholder="Enter the Name/Title" ID="txt_title" runat="server" Height="40px" Width="470px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <br />
            <br />
            <asp:Label class="wow bounceIn delay-3s" ID="Label10" runat="server" Text="&lt;b&gt;Category&lt;/b&gt;"></asp:Label>
            
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" Height="28px" Width="470px">
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
            </asp:DropDownList><br />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please select atleast one category" ForeColor="Red"></asp:RequiredFieldValidator>

            <br />

            <br />
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label11" runat="server" Text="<b>Author</b>"></asp:Label>
                    -:</td>
                <td>
                    <asp:ListBox ID="AuthorList" runat="server" SelectionMode="Multiple"></asp:ListBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="txt_auth" runat="server" Height=" 40px" Width="470px"></asp:TextBox>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%--<asp:Button ID="btn_Add_Auth" runat="server" OnClick="btn_Add_Auth_Click" Text="Add Author" />--%>
                </td>
            </tr>

            <br />

            <asp:Label class="wow bounceIn delay-3s" ID="Label12" runat="server"><b>No. Of Pages</b></asp:Label>
            <br />

            &nbsp;<asp:TextBox CssClass="wow fadeInUp delay-3s" ID="txt_no_of_pages" placeholder="Enter the No.Of Page " runat="server" Height="40px" Width="470px"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <br />
            <asp:Label class="wow bounceIn delay-3s" ID="Label13" runat="server"><b>Publication</b></asp:Label>
            <br />
            &nbsp;<asp:TextBox CssClass="wow fadeInUp delay-3s" ID="txt_publication" placeholder="Enter the Publication " runat="server" Height="40px" Width="470px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <br />
           <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_publication" ErrorMessage="Please specify Publication " ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
           <br />

            <asp:Label class="wow bounceIn delay-3s" ID="Label14" runat="server"><b>Enter The Original Price</b></asp:Label>
            <br />
            &nbsp;<asp:TextBox CssClass="wow fadeInUp delay-3s" ID="txt_oprice" placeholder="Enter the Original Price" runat="server" Height="40px" Width="470px"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <br />
            <asp:Label class="wow bounceIn delay-3s" ID="Label15" runat="server"><b>Enter the Selling Price</b></asp:Label>
            <br />
            &nbsp;<asp:TextBox CssClass="wow fadeInUp delay-3s" ID="txt_sprice" placeholder="Enter the Selling Price" runat="server" Height="40px" Width="470px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_sprice" ErrorMessage="Specify Selling Price" ForeColor="Red"></asp:RequiredFieldValidator>

            <br />

            <br />
            <asp:Label class="wow bounceIn delay-3s" ID="Label16" runat="server"><b>Exchange</b></asp:Label>
            <br />
            <asp:RadioButtonList ID="rb_exchange" runat="server">
                <asp:ListItem Value="0">No</asp:ListItem>
                <asp:ListItem Value="1">Yes</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            &nbsp;
            <asp:RadioButtonList ID="rbstatus" runat="server">
                        <asp:ListItem Value="1">Available</asp:ListItem>
                    </asp:RadioButtonList>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="rb_exchange" ErrorMessage="Book Status Required" ForeColor="Red"></asp:RequiredFieldValidator>

            <br />

            <br />

            <asp:Label class="wow fadeIn delay-3s" ID="Label17" runat="server"><b>Image</b></asp:Label>
            <br />
            <asp:FileUpload ID="fileupload1" runat="server" />
                        
     
           <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="fileupload1" ErrorMessage="Please upload a book image" ForeColor="Red"></asp:RequiredFieldValidator>

             <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

             <asp:Button ID="btnUploadFile" runat="server" OnClick="btnUploadFile_Click" Text="Upload" />
           
        </div>


    </form>

    
</body>
</html>
