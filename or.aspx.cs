using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace marble
{
    public partial class WebForm9 : System.Web.UI.Page
    {
       string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        string nm = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["uid"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                     nm = Session["uid"].ToString();
                  
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand(@"select *from [dbo].[order1]  where username='" + nm + "'", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
           
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            int orderId = Convert.ToInt32(GridView1.DataKeys[e.AffectedRows].Value);

            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string deleteQuery = "DELETE FROM [dbo].[order1] WHERE order_id = @orderId";

                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@orderId", orderId);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }

            // Rebind the data after deletion
            GridView1.DataBind();
        }

        protected void linkbtn_Click(object sender, EventArgs e)
        {
            if(Session["uid"]!=null){
            
        }

       
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            if (Session["uid"] != null)
            {
                nm = Session["uid"].ToString();
                SqlDataAdapter da = new SqlDataAdapter(@"select odr.order_id as oid,odr.pro_nm as pnm,odr.price as Price,odr.qty as Qty,odr.total as Total,odr.order_date as odate,odr.status as Status from [dbo].[order] odr inner join [dbo].[product] pdt on pdt.pro_id=odr.pro_id where odr.u_name='" + nm + "' and odr.order_id like '" + TextBox1.Text + "'", con);

                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {

                    Response.Write("<script>alert('plz enter valid id')</script>");
                }

            }

        }
        protected void btnBill_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string orderId = btn.CommandArgument;

            // Redirect to bill.aspx with Order ID
            Response.Redirect("bb.aspx?orderId=" + orderId);
        }

      
    }
}
