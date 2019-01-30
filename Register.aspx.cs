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

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txt_u_name.Attributes.Add("onblur", "checkIDAvailability()");
        //txt.Attributes["onBlur"] = "IsAccNumberValid(" & txtAccountNumber.ClientID & ")";
        txt_u_name.Attributes["onblur"] = checkUserName(txt_u_name.ClientID);
        if (!IsPostBack)
        {

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";

        SqlCommand cmdInsert = new SqlCommand();
        cmdInsert.Connection = cn;
        cmdInsert.CommandType = CommandType.StoredProcedure;
        cmdInsert.CommandText = "RegisterUser";

        cmdInsert.Parameters.AddWithValue("@User_id", txt_u_name.Text);
        cmdInsert.Parameters.AddWithValue("@Name", txt_name.Text);
        cmdInsert.Parameters.AddWithValue("@Email", txt_email.Text);
        cmdInsert.Parameters.AddWithValue("@Mobileno", txt_mobno.Text);
        cmdInsert.Parameters.AddWithValue("@Password", txt_pwd.Text);
        cmdInsert.Parameters.AddWithValue("@Address", txt_address.Text);
        cmdInsert.Parameters.AddWithValue("@Area", DropDownList1.SelectedValue);


        cn.Open();
        int res = cmdInsert.ExecuteNonQuery();
        cn.Close();

        Response.Write("<script>alert('Registered Successfully!')</script>");

        if (res == 1)
        {
            string message = "ThankYou for signing in " +
           " Our  Portal  helps you to sell your books that you no longer wish to refer or use." +
           "You can also buy an used book if you prefer spending less bucks on the books you want to refer." +
           "ENJOY READING!!!";
            string Name = txt_name.Text;



            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("ubsportal2019@gmail.com", "Sourabh100@");
            MailMessage msgobj = new MailMessage();
            msgobj.To.Add(txt_email.Text);
            msgobj.From = new MailAddress("ubsportal2019@gmail.com");
            msgobj.Subject = "Registration Successful";
            msgobj.Body = String.Format("Hello " + Name + "!!!" + "\n" + message);


            client.Send(msgobj);

            Response.Write("msg was send successfully");
            Response.Redirect("Login.aspx");
        }
        else
        {
            Label11.Text = "Enter valid Info";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    [System.Web.Services.WebMethod(EnableSession = true)]
    public static string checkUserName(string IDVal)
    {
        string result = string.Empty;
        //Get your connection string here
        // string conString = System.Configuration.ConfigurationManager.ConnectionStrings["AdventureWorks2008R2ConnectionString2"].ConnectionString;
        string ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";

        //Change your query here
        string qry = "Select User_id from UserInfo Where User_id =@User_id";
        SqlDataAdapter da = new SqlDataAdapter(qry, ConnectionString);
        //Pass the value to paramter
        da.SelectCommand.Parameters.AddWithValue("@User_id", IDVal.Trim());
        DataSet ds = new DataSet();
        da.Fill(ds, "IDTable");
        //Check if dataset is having any value
        if (ds.Tables["IDTable"].Rows.Count > 0)
        {
            // User Name Not Available
            result = "ID already in use";
        }
        else
        {
            //User_Name is available
            result = "ID is available, you can use it";
        }
        //Return the result
        return result;
    }
}