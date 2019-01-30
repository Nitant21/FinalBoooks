using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string uid = Session["user_id"].ToString();
            Label3.Text = uid;
        }
    }

    protected void Change_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "Update UserInfo set Password = @password where User_id='" + Label3.Text + "';";
        cmd.Parameters.AddWithValue("@password", txt_npass.Text);
        //con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Password changed successfully!')</script>");


        Response.Redirect("Login.aspx");
    }
}