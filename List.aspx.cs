using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;

public partial class List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["user_id"] == null)
                    Response.Redirect("Login.aspx");
                lbl_userid.Text = Session["user_id"].ToString();
            }
            catch (NullReferenceException e1)
            {
                Response.Write("<script>alert('Please Login!')</script>");
            }
            

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Authors";

            cn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            AuthorList.DataSource = dr;
            AuthorList.DataTextField = "Name";
            AuthorList.DataValueField = "Name";
            AuthorList.DataBind();


            cn.Close();
        }
    }


    protected void btnUploadFile_Click(object sender, EventArgs e)
    {
        byte[] bytes;
        using (BinaryReader br = new BinaryReader(fileupload1.PostedFile.InputStream))
        {
            bytes = br.ReadBytes(fileupload1.PostedFile.ContentLength);
        }

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        
        SqlCommand cmdInsert = new SqlCommand();
        cmdInsert.Connection = cn;
        cmdInsert.CommandType = CommandType.Text;
        try
        {
            cmdInsert.CommandText = "insert into Books(User_id, Title, Category, No_of_pages, Publication, Original_price, Selling_price, Exchange, Status_book, Pic) values(@User_id,@Title, @Category,@No_of_pages,@Publication,@Original_price,@Selling_price,@Exchange,@Status_book,@Pic)";

            //cmdInsert.CommandType = CommandType.StoredProcedure;
            //cmdInsert.CommandText = "BookInsert";

            cmdInsert.Parameters.AddWithValue("@User_id", lbl_userid.Text);
            cmdInsert.Parameters.AddWithValue("@Title", txt_title.Text);

            cmdInsert.Parameters.AddWithValue("@Category", DropDownList1.SelectedValue);

            cmdInsert.Parameters.AddWithValue("@No_of_pages", txt_no_of_pages.Text);
            cmdInsert.Parameters.AddWithValue("@Publication", txt_publication.Text);

            cmdInsert.Parameters.AddWithValue("@Original_price", txt_oprice.Text);
            cmdInsert.Parameters.AddWithValue("@Selling_price", txt_sprice.Text);

            cmdInsert.Parameters.AddWithValue("@Exchange", rb_exchange.SelectedValue);
            cmdInsert.Parameters.AddWithValue("@Status_book", rbstatus.SelectedValue);

            cmdInsert.Parameters.AddWithValue("@Pic", bytes);
            //cmdInsert.Parameters.AddWithValue("@author", TextBox1.Text);


            cn.Open();
            cmdInsert.ExecuteNonQuery();
        }
        catch(SqlException ex)
        {
            if (ex.Number == 2627)
            {
                Response.Write("<script>alert('The book already exists! Please enter a new book.')</script>");
            }
        }

        string[] authors = txt_auth.Text.Split(',');
        List<string> auth_list = authors.ToList<string>();
        foreach (string author in authors)
        {
            try
            {
                cmdInsert = cn.CreateCommand();
                cmdInsert.CommandText = "insert into Authors(Name) values (@Name)";
                cmdInsert.Parameters.AddWithValue("@Name", author);
                cmdInsert.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627)
                {
                    auth_list.Remove(author);
                    //Response.Write("The author already exists!");
                    //throw new System.ArgumentException("The author already exists!");
                    Response.Write("<script>alert('The author already exists!')</script>");
                }
            }
        }
        
        

        SqlCommand cmd_book_auth = new SqlCommand();
        cmd_book_auth.Connection = cn;
        cmd_book_auth.CommandType = CommandType.Text;
        cmd_book_auth.CommandText = "select Book_id from Books where User_id = @User_id and Title = @Title";
        cmd_book_auth.Parameters.AddWithValue("@User_id", lbl_userid.Text);
        cmd_book_auth.Parameters.AddWithValue("@Title", txt_title.Text);

        SqlDataReader drEmps = cmd_book_auth.ExecuteReader();
        int book_id = 0;
        while (drEmps.Read())
        {
            book_id = (int)drEmps["Book_id"];
        }
        drEmps.Close();

        
        //List<string> author_list = new List<string>(authors);
        foreach(ListItem item in AuthorList.Items)
        {
            if(item.Selected == true)
            {
                auth_list.Add(item.ToString());
            }
        }

        List<int> author_id = new List<int>();
        //SqlDataReader drEmps1 = cmd_book_auth.ExecuteReader();
        foreach (string author in auth_list)
        {
            cmd_book_auth = cn.CreateCommand();
            cmd_book_auth.CommandText = "select Author_id from Authors where Name = @authName";
            cmd_book_auth.Parameters.AddWithValue("@authName", author);
            drEmps = cmd_book_auth.ExecuteReader();
            while(drEmps.Read())
            {
                author_id.Add((int)drEmps["Author_id"]);
            }
            drEmps.Close();

        }
        

        foreach(int author in author_id)
        {
            cmd_book_auth = cn.CreateCommand();
            cmd_book_auth.CommandText = "insert into BookAuth values(@Author_id, @Book_id)";

            cmd_book_auth.Parameters.AddWithValue("@Author_id", author);
            cmd_book_auth.Parameters.AddWithValue("@Book_id", book_id);

            cmd_book_auth.ExecuteNonQuery();
        }
        


        cn.Close();

        Response.Write("<script>alert('Book added successfully!')</script>");
        Response.Redirect("HomePage.aspx");

    }





    //protected void btn_Add_Auth_Click(object sender, EventArgs e)
    //{
    //    SqlConnection cn = new SqlConnection();
    //    cn.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";

    //    SqlCommand cmdInsert = new SqlCommand();
    //    cmdInsert.Connection = cn;
    //    cmdInsert.CommandType = CommandType.Text;

    //    cmdInsert.CommandText = "insert into Authors(Name) values (@Name)";

    //    string[] authors = txt_auth.Text.Split(',');
    //    foreach (string author in authors)
    //    {
    //        cmdInsert.Parameters.AddWithValue("@Name", author);
    //    }

    //    cn.Open();
    //    cmdInsert.ExecuteNonQuery();
    //    cn.Close();

    //}


    //[System.Web.Services.WebMethod(EnableSession = true)]
    //public static string checkUserName(string IDVal)
    //{
    //    string result = string.Empty;
    //    //Get your connection string here
    //    // string conString = System.Configuration.ConfigurationManager.ConnectionStrings["AdventureWorks2008R2ConnectionString2"].ConnectionString;
    //    string ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";

    //    //Change your query here
    //    string qry = "Select User_id from Books Where User_id =@User_id";
    //    SqlDataAdapter da = new SqlDataAdapter(qry, ConnectionString);
    //    //Pass the value to paramter
    //    da.SelectCommand.Parameters.AddWithValue("@User_id", IDVal.Trim());
    //    DataSet ds = new DataSet();
    //    da.Fill(ds, "IDTable");
    //    //Check if dataset is having any value
    //    if (ds.Tables["IDTable"].Rows.Count > 0)
    //    {
    //        // User Name Not Available
    //        result = "ID already in use";
    //    }
    //    else
    //    {
    //        //User_Name is available
    //        result = "ID is available, you can use it";
    //    }
    //    //Return the result
    //    return result;
    //}




}