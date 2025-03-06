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
    public partial class bill : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["orderId"] != null)
                {
                    string orderId = Request.QueryString["orderId"];
                    LoadBill(orderId);
                }
                else
                {
                    lblOrderId.Text = "Invalid Order ID.";
                }
            }
            con = new SqlConnection(str);
            con.Open();

            int i;
            cmd = new SqlCommand("select max(id) from order13", con);
            String a = Convert.ToString(cmd.ExecuteScalar());
            if (a == "")
                i = 1;
            else
                i = Convert.ToInt32(a) + 1;
            lblOrderId.Text = i.ToString();

            con.Close();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Button1.Visible = false;
        // Trigger the print functionality
        ScriptManager.RegisterStartupScript(this, this.GetType(), "print", "print();", true);
        }
        private void LoadBill(string orderId)
        {
            try
            {

                using (SqlConnection con = new SqlConnection(str))
                {
                    con.Open();

                    // Retrieve order details
                    string query = "SELECT cname, o_date, status FROM order13 WHERE id = @id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@id", orderId);
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            lblOrderId.Text = orderId;
                            lblCustomerName.Text = reader["cname"].ToString();
                            lblOrderDate.Text = Convert.ToDateTime(reader["o_date"]).ToString("yyyy-MM-dd");
                            lblStatus.Text = reader["status"].ToString();
                        }
                        reader.Close();
                    }

                    // Retrieve purchased items
                    string orderItemsQuery = "SELECT sel_pro, total FROM order13 WHERE id = @id";
                    using (SqlCommand cmd = new SqlCommand(orderItemsQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@id", orderId);
                        SqlDataReader itemReader = cmd.ExecuteReader();

                        if (itemReader.HasRows)
                        {
                            rptBill.DataSource = itemReader;
                            rptBill.DataBind();
                        }
                        itemReader.Close();
                    }

                    // Calculate total amount
                    string totalQuery = "SELECT SUM(total) FROM order13 WHERE id = @id";
                    using (SqlCommand cmd = new SqlCommand(totalQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@id", orderId);
                        object totalAmount = cmd.ExecuteScalar();
                      //  lblGrandTotal.Text = "₹ " + (totalAmount != DBNull.Value ? totalAmount.ToString() : "0");
                    }
                }
            }
            catch (Exception ex)
            {
                lblOrderId.Text = "Error loading bill: " + ex.Message;
            }
        }
    }

}