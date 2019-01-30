using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class HomePage : System.Web.UI.Page
{
    //string ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";
    protected void Page_Load(object sender, EventArgs e)
    {
        //string con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        //using (SqlConnection conn = new SqlConnection(con))
        //{

        //    using (SqlDataAdapter sda = new SqlDataAdapter("select Title,Original_price,Pic from Books", conn))
        //    {
        //        DataTable dt = new DataTable();
        //        sda.Fill(dt);
        //        DataList1.DataSource = dt;
        //        DataList1.DataBind();

        //    }

        //    //protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        //    //{
        //    //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    //    {
        //    //        DataRowView dr = (DataRowView)e.Row.DataItem;
        //    //        string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Data"]);
        //    //        (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
        //    //    }
        //    //}





        //}
        if (!IsPostBack)
        {

            if (Session["user_id"] != null)
            {
                signuppage.Visible = false;
                loginpage.Visible = false;
            }
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select Pic ,Title,Selling_price, Category, Book_id from Books where Status_book = 1";

            con.Open();

            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds, "Books");
            GridView1.DataSource = ds.Tables["Books"];
            GridView1.DataBind();


        }
        
    }
        
    



    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;
            string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Pic"]);
            (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
           
        }

    }





    protected void Button1_Click(object sender, EventArgs e)
    {
        GetRecord(string.IsNullOrEmpty(DropDownList1.SelectedValue) ? null : DropDownList1.SelectedValue,
            string.IsNullOrEmpty(DropDownList2.SelectedValue) ? null : DropDownList2.SelectedValue,
            string.IsNullOrEmpty(TextBox1.Text) ? null : TextBox1.Text,
            string.IsNullOrEmpty(TextBox2.Text) ? null : TextBox2.Text);
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
        cmd.CommandText = "select distinct Title, Category, Selling_price, b.Book_id, CAST(Pic AS varbinary(max)) AS Pic " +
            "from Books b join UserInfo u ON b.User_id = u.User_id " +
            "join BookAuth ba ON b.Book_id = ba.Book_id join Authors a ON ba.Author_id = a.Author_id " +
            "where (@category IS NULL OR Category = @category) AND (@Area IS NULL OR Area = @area) " +
            "AND (@title IS NULL OR Title = @title) AND (@author IS NULL OR a.Name = @author) AND Status_book = 1;";

        cmd.Parameters.AddWithValue("@Area", (object)Area ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@category", (object)Category ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@title", (object)Title ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@author", (object)Author ?? DBNull.Value);

        cn1.Open();
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        DataSet ds = new DataSet();
        sda.Fill(ds, "Books");
        GridView1.DataSource = ds.Tables["Books"];
        GridView1.DataBind();
        cn1.Close();


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        Label lbl = (Label)gvr.FindControl("Label6");
        Session["id"] = lbl.Text;
        Response.Redirect("BookDetails.aspx");
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        
        Response.Redirect("List.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyProfile.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
      
    }


}






    
