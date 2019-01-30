using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        GetRecord(string.IsNullOrEmpty(DropDownList1.SelectedValue) ? null : DropDownList1.SelectedValue,
            string.IsNullOrEmpty(DropDownList2.SelectedValue) ? null : DropDownList2.SelectedValue,
            string.IsNullOrEmpty(TextBox1.Text) ? null : TextBox1.Text,
            string.IsNullOrEmpty(TextBox2.Text) ? null : TextBox2.Text);
        //if (DropDownList1.Text != "Choose Area")
        //{
        //    if (DropDownList2.Text != "Choose Category")
        //    {
        //        GetRecord(DropDownList1.Text, DropDownList2.Text, "Harry Potter", "JKR");
        //    }
        //    else
        //    {
        //        Response.Write("Please choose Category");
        //    }
        //}
        //else
        //{
        //    Response.Write("Please choose Area");
        //}
    }
    public void GetRecord(string Area = null, string Category = null, string Title = null, string Author = null)
    {

        //string connection = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=amit;Integrated Security=True;Pooling=False";
        //string cmdText = "select * from UserInfo where Area=" + ctiy + "and" + "Brand=" + brand;

        SqlConnection cn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn1;
        cmd.CommandType = CommandType.Text;
        //cmd.CommandText = "select * from Books b join UserInfo u on b.User_id = u.User_id where " +
        //    "(@category IS NULL OR Category = @category) AND (@area IS NULL OR Area = @area) " +
        //    "AND (@title IS NULL OR Title = @title) AND (@author IS NULL OR Author = @author);";
        cmd.CommandText = "select * from Books b join UserInfo u ON b.User_id = u.User_id " +
            "join BookAuth ba ON b.Book_id = ba.Book_id join Authors a ON ba.Author_id = a.Author_id " +
            "where (@category IS NULL OR Category = @category) AND (@Area IS NULL OR Area = @area) " +
            "AND (@title IS NULL OR Title = @title) AND (@author IS NULL OR a.Name = @author);";

        cmd.Parameters.AddWithValue("@Area", (object)Area ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@category", (object)Category ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@title", (object)Title ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@author", (object)Author ?? DBNull.Value);

        cn1.Open();
        SqlDataReader drEmps = cmd.ExecuteReader();
        if (!drEmps.HasRows)
        {
            Response.Write("No records found! Please search again.");
        }
        else
        {
            while (drEmps.Read())
            {
                //ListBox1.Items.Add(new ListItem(drEmps["Title"].ToString()));
                ListBox1.Items.Add(drEmps["Title"].ToString() + "   " + drEmps["Author"].ToString());

            }
        }

        drEmps.Close();
        cn1.Close();
    }
}

