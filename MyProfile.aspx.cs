using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class New : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["user_id"] == null)
                    Response.Redirect("Login.aspx");
                string uid = Session["user_id"].ToString();
            }
            catch (NullReferenceException e1)
            {
                Response.Write("<script>alert('Please Login!')</script>");
            }
            
            DataSet ds = getDs();
            Session["ds"] = ds;
            DataList1.DataSource = ds.Tables["user"];
            DataList1.DataBind();

        }
    }

    private DataSet getDs()
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select User_id,Name, Mobileno, Email, Address, Area from UserInfo where User_id=@uid";
        
        try
        {
            if (Session["user_id"] == null)
                Response.Redirect("Login.aspx");
            cmd.Parameters.AddWithValue("@uid", Session["user_id"].ToString());
        }
        catch (NullReferenceException e1)
        {
            Response.Write("<script>alert('Please Login!')</script>");
        }

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;

        DataSet ds = new DataSet();
        da.Fill(ds, "user");

        DataColumn[] arrCols = new DataColumn[1];
        arrCols[0] = ds.Tables["user"].Columns["User_id"];
        ds.Tables["user"].PrimaryKey = arrCols;


        con.Close();
        return ds;
    }

    protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
    {
        
        DataSet ds = (DataSet)Session["ds"];
            DataList1.EditItemIndex = e.Item.ItemIndex;
            DataList1.DataSource = ds.Tables["user"];
            DataList1.DataBind();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangePassword.aspx");
        
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Session.Remove("user_id");
        Session.Remove("id");
        Session.Remove("ds");
        Session.Abandon();
        
        Response.Redirect("HomePage.aspx");
        Response.Write("<script>alert('Logged out successfully!')</script>");
    }

    //protected void Button6_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection();
    //    con.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;

    //    cmd.CommandType = CommandType.Text;
    //    cmd.CommandText = "Delete from UserInfo where User_id=4"/* + "'uid'"*/;
    //    //cmd.Parameters.AddWithValue("@password", txt_npass.Text);
       
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    Response.Write("<script>alert('Removed successfully!')</script>");
    //    Response.Redirect("Login.aspx");
    //}

    protected void btnUploads_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyUploads.aspx");
    }



    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }

    protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        DataSet ds = (DataSet)Session["ds"];
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        //string uid = Session["user_id"].ToString();
       // lbl_uid.Text = Session["user_id"].ToString();
        //Label lbl_uid = (Label)Session["user_id"];
        
        Label lb = (Label)DataList1.Items[e.Item.ItemIndex].FindControl("lbl_uid");
        lb.Text = Session["user_id"].ToString();
        TextBox tb = (TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txt_name");
        TextBox tb1 = (TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txt_mbno");
        TextBox tb2 = (TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txt_email");
        TextBox tb3 = (TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txt_addr");
        DropDownList dl = (DropDownList)DataList1.Items[e.Item.ItemIndex].FindControl("DropDownList1");

        DataRow row = ds.Tables["user"].Rows.Find(lb.Text);
        if (row != null)
        {
            row["Name"] = tb.Text;
            row["Email"] = tb2.Text;
            row["Mobileno"] = tb1.Text;
            row["Address"] = tb3.Text;
            row["Area"] = dl.SelectedValue;

        }
        DataList1.EditItemIndex = -1;
        DataList1.DataSource = ds.Tables["user"];
        DataList1.DataBind();

        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "Update UserInfo set Name = @tb, Email=@tb2, Mobileno =@tb1, Address=@tb3, Area=@dl where User_id=@lb";
        // cmd.Parameters.AddWithValue("@us_id", Session["user_id"].ToString());

        cmd.Parameters.Add(new SqlParameter { ParameterName = "@lb", SourceColumn = "User_id", SourceVersion = DataRowVersion.Original });
        cmd.Parameters.Add(new SqlParameter { ParameterName = "@tb", SourceColumn = "Name", SourceVersion = DataRowVersion.Current });
        cmd.Parameters.Add(new SqlParameter { ParameterName = "@tb2", SourceColumn = "Email", SourceVersion = DataRowVersion.Current });
        cmd.Parameters.Add(new SqlParameter { ParameterName = "@tb1", SourceColumn = "Mobileno", SourceVersion = DataRowVersion.Current });
        cmd.Parameters.Add(new SqlParameter { ParameterName = "@tb3", SourceColumn = "Address", SourceVersion = DataRowVersion.Current });
        cmd.Parameters.Add(new SqlParameter { ParameterName = "@dl", SourceColumn = "Area", SourceVersion = DataRowVersion.Current });

        SqlDataAdapter da = new SqlDataAdapter();
        //con.Open();
        da.UpdateCommand = cmd;
        da.Update(ds, "user");

        con.Close();


    }


    protected void Button8_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "Select Book_id from Books where User_id = @uid";
        cmd.Parameters.AddWithValue("@uid", Session["user_id"].ToString());
        SqlDataReader drEmps = cmd.ExecuteReader();
        List<int> book_id = new List<int>();
        while (drEmps.Read())
        {
            book_id.Add((int)drEmps["Book_id"]);
        }
        drEmps.Close();

        foreach (int id in book_id)
        {
            cmd = con.CreateCommand();
            cmd.CommandText = "Delete from BookAuth where Book_id = '" + id + "'; Delete from Feedback where User_id = @uid or Book_id = '" + id + "'";
            cmd.Parameters.AddWithValue("@uid", Session["user_id"].ToString());
            cmd.ExecuteNonQuery();
        }
        cmd.CommandText = "Delete from Books where User_id = @uid; Delete from UserInfo where User_id = @uid;";
        cmd.ExecuteNonQuery();
        con.Close();
        Session.Abandon();
        Response.Redirect("HomePage.aspx");
    }
}