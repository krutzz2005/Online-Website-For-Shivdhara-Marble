using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace marble
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd;
        SqlConnection con;
        string str = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            if (Session["uid"] != null)
            {
                int id = int.Parse(Request.QueryString["p_id"].ToString());
                con.Open();
                String sel = "select * from product where p_id=" + id + "";
                da = new SqlDataAdapter(sel, con);
                da.Fill(ds, "product");
                dt = ds.Tables[0];
                Label2.Text = dt.Rows[0][1].ToString();
                Label4.Text = dt.Rows[0][2].ToString();
                Label6.Text = dt.Rows[0][3].ToString();
                Label8.Text = dt.Rows[0][5].ToString();
                Image1.ImageUrl = "~/images/" + dt.Rows[0][7].ToString();
                con.Close();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            int qty, sto, ans = 0;
            qty = Convert.ToInt32(TextBox6.Text);
            sto = Convert.ToInt32(Label8.Text);
            ans = sto - qty;

            if (qty > sto)
            {
                // Show stock out message if quantity exceeds available stock
                Response.Write("<script>alert('Stock Out! The quantity you entered exceeds the available stock.');</script>");
                return;
            }

            if (Session["uid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                con.Open();

                string unm = Session["uid"].ToString();
                string odate = DateTime.Now.ToString();
                int id = int.Parse(Request.QueryString["p_id"].ToString());
                Int32 total = Convert.ToInt32(TextBox6.Text) * Convert.ToInt32(Label6.Text);

                string query = "insert into addtocart values('" + unm + "'," + Label2.Text + ",'" + Label4.Text + "','" + Image1.ImageUrl + "'," + Label6.Text + ",'" + Label8.Text + "'," + TextBox6.Text + "," + total + ")";
                da = new SqlDataAdapter(query, con);
                da.Fill(ds);
                cmd = new SqlCommand("update product set stock='" + ans + "' where p_id=" + id + "", con);
                cmd.ExecuteNonQuery();

                Response.Redirect("view addtocart.aspx");
                con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            using (SqlConnection con = new SqlConnection(str))
            {
                con.Open();

                // Get the current stock for the product
                SqlCommand cmd = new SqlCommand("SELECT stock FROM [dbo].[product] WHERE p_id = @p_id", con);
                cmd.Parameters.AddWithValue("@p_id", Label2.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                int stock1 = 0;
                if (dr.Read())
                {
                    stock1 = Convert.ToInt32(dr[0]);
                }
                dr.Close();

                int qty = Convert.ToInt32(TextBox6.Text);

                if (qty > stock1)
                {
                    // Show stock out message if quantity exceeds available stock
                    Response.Write("<script>alert('Stock Out! The quantity you entered exceeds the available stock.');</script>");
                    return;
                }

                string status = "pending";
                if (Session["uid"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    string unm = Session["uid"].ToString();

                    // Get the next order ID
                    cmd = new SqlCommand("SELECT MAX(order_id) FROM [dbo].[order1]", con);
                    string a = Convert.ToString(cmd.ExecuteScalar());
                    int i = string.IsNullOrEmpty(a) ? 1 : Convert.ToInt32(a) + 1;
                    int oid = i;

                    int price = Convert.ToInt32(Label6.Text);
                    int total = price * qty;

                    // Insert the order
                    cmd = new SqlCommand(@"INSERT INTO [dbo].[order1]
                        ([order_id], [username], [p_id], [p_nm], [p_price], [qty], [total], [order_date], [status])
                        VALUES (@order_id, @username, @p_id, @p_nm, @p_price, @qty, @total, @order_date, @status)", con);

                    cmd.Parameters.AddWithValue("@order_id", oid);
                    cmd.Parameters.AddWithValue("@username", unm);
                    cmd.Parameters.AddWithValue("@p_id", Label2.Text);
                    cmd.Parameters.AddWithValue("@p_nm", Label4.Text);
                    cmd.Parameters.AddWithValue("@p_price", price);
                    cmd.Parameters.AddWithValue("@qty", qty);
                    cmd.Parameters.AddWithValue("@total", total);
                    cmd.Parameters.AddWithValue("@order_date", dt);
                    cmd.Parameters.AddWithValue("@status", status);

                    cmd.ExecuteNonQuery();

                    // Update the stock after placing the order
                    int newQty = stock1 - qty;
                    cmd = new SqlCommand("UPDATE [dbo].[product] SET stock = @stock WHERE p_id = @p_id", con);
                    cmd.Parameters.AddWithValue("@stock", newQty);
                    cmd.Parameters.AddWithValue("@p_id", Label2.Text);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Order successfully placed');</script>");
                    Response.Redirect("or.aspx");
                }
            }
        }
    }
}
