using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


public partial class CS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * from pic", conn))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvImages.DataSource = dt;
                    gvImages.DataBind();
                }
            }
        }
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;
            string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Data"]);
            (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
        }
    }

       protected void Upload(object sender, EventArgs e)
    {
        byte[] bytes;
        using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
        {
            bytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
        }
        string con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(con))
        {
            string sql = "INSERT INTO pic VALUES(@Name, @ContentType, @Data)";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@Name", Path.GetFileName(FileUpload1.PostedFile.FileName));
                cmd.Parameters.AddWithValue("@ContentType", FileUpload1.PostedFile.ContentType);
                cmd.Parameters.AddWithValue("@Data", bytes);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        //Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void gvImages_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}