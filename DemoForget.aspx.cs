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

public partial class DemoForget : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select Email , Password from UserInfo  where Email = @Email1";
            cmd.Parameters.AddWithValue("@Email1", TextBox1.Text);
            cn.Open();
            SqlDataReader da = cmd.ExecuteReader();

            if (da.Read())
            {
                string Email4 = da["Email"].ToString();
                string password4 = da["Password"].ToString();

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("ubsportal2019@gmail.com", "Sourabh100@");
                MailMessage msgobj = new MailMessage();
                msgobj.To.Add(TextBox1.Text);
                msgobj.From = new MailAddress("ubsportal2019@gmail.com");
                msgobj.Subject = " Password";
                msgobj.Body = String.Format("Hello Your Email Address and Password is \n Email " + Email4 + " \n Password : " + password4);
                //msgobj.Body = "hello man";

                client.Send(msgobj);
                Label2.Text = "Password send on " + TextBox1.Text;
                Response.Write("msg was send successfully");
            }
            else
            {
                Label2.Text = TextBox1.Text + "  not registered Email Address";
            }


            ////SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            ////client.EnableSsl = true;
            ////client.DeliveryMethod = SmtpDeliveryMethod.Network;
            ////client.UseDefaultCredentials = false;
            ////client.Credentials = new NetworkCredential("sourabhsmahadik@gmail.com", "Sourabh100@");
            ////MailMessage msgobj = new MailMessage();
            ////msgobj.To.Add(TextBox1.Text);
            ////msgobj.From = new MailAddress("sourabhsmahadik@gmail.com");
            ////msgobj.Subject = " ";
            ////msgobj.Body = TextBox1.Text + " registered successfully to CDAC-INGENIOUS ";
            ////client.Send(msgobj);
            ////Response.Write("Mail send successfully");
        }

        catch (Exception ex)
        {
            Response.Write("Registration Failed" + ex.Message);
        }

    }
}