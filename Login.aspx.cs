using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if(!IsPostBack)
        {

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True";

        SqlCommand cmdInsert = new SqlCommand();
        cmdInsert.Connection = cn;
        cmdInsert.CommandType = CommandType.StoredProcedure;
        cmdInsert.CommandText = "LoginSelect";

        cmdInsert.Parameters.AddWithValue("@User_id", txt_uid.Text);
        cmdInsert.Parameters.AddWithValue("@Password", txt_pwd.Text);

        cn.Open();
        int res = (int)cmdInsert.ExecuteScalar();
        //int res = cmdInsert.ExecuteNonQuery();
        cn.Close();

        if (res == 1)
        {
            Session["user_id"] = txt_uid.Text;
            Response.Redirect("HomePage.aspx");
        }
        else
        {
            //Response.Write("invalid username & password");
            lblError.Text = "invalid username & password";
        }





    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //Response.Redirect("Register.aspx");
    }

    protected void btnForgotPassword_Click(object sender, EventArgs e)
    {
        int intId = 100;
        string strPopup = "<script language='javascript' ID='script1'>"

        // Passing intId to popup window.
        + "window.open('DemoForget.aspx?data=" + HttpUtility.UrlEncode(intId.ToString())

        + "','new window', 'top=90, left=200, width=300, height=100, dependant=no, location=0, alwaysRaised=no, menubar=no, resizeable=no, scrollbars=n, toolbar=no, status=no, center=yes')"

        + "</script>";
        ScriptManager.RegisterStartupScript((Page)HttpContext.Current.Handler, typeof(Page), "Script1", strPopup, false);

    }
}