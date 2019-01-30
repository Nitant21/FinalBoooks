using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyUploads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "update Books set Status_book = 0 where User_id = @User_id " +
            "and Book_id = @Book_id";

        Button btn = (Button)sender;
        Label book_id = (Label)btn.NamingContainer.FindControl("Book_idLabel");
        int bk_id = Convert.ToInt32(book_id.Text);
        

        cmd.Parameters.AddWithValue("@User_id", Session["user_id"].ToString());
        cmd.Parameters.AddWithValue("@Book_id", bk_id);

        

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        
        Response.Write("<script>alert('Status changed successfully!')</script>");
        
    }


    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("MyProfile.aspx");
    }
}