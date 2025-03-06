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
    public partial class WebForm10 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

            string str = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            con = new SqlConnection(str);

            // Check if the user is logged in
            if (Session["uid"] != null)
            {
                string userId = Session["uid"].ToString();  // Get logged-in user's ID

                // Set the SelectCommand with a WHERE clause to filter by user ID
                SqlDataSource1.SelectCommand = "SELECT * FROM [order13] WHERE [cname] = @cname";

                // Set the parameter for user ID
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("cname", userId);

                // Bind GridView to the filtered data
                GridView1.DataBind();
            }
            else
            {
                // Handle case where the user is not logged in
                lblMessage.Text = "Please log in to view your orders.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            // Get the order ID from the CommandArgument property
            Button btn = (Button)sender;
            string orderId = btn.CommandArgument;

            // Ensure the user is logged in and matches the order
            if (Session["uid"] != null)
            {
                string userId = Session["uid"].ToString();

                // Verify that the order belongs to the current user
                string checkUserQuery = "SELECT COUNT(*) FROM [order13] WHERE [id] = @id AND [cname] = @cname";

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
                {
                    using (SqlCommand cmd = new SqlCommand(checkUserQuery, conn))
                    {
                        // Add parameters to the SQL query
                        cmd.Parameters.AddWithValue("@id", orderId);
                        cmd.Parameters.AddWithValue("@cname", userId);

                        conn.Open();
                        int count = (int)cmd.ExecuteScalar();

                        if (count > 0)
                        {
                            // Proceed with the return process if the order belongs to the current user
                            string updateReturnStatusQuery = "UPDATE [order13] SET [status] = @status WHERE [cname] = @cname";

                            using (SqlCommand updateCmd = new SqlCommand(updateReturnStatusQuery, conn))
                            {
                                updateCmd.Parameters.AddWithValue("@status", "Returned");
                                updateCmd.Parameters.AddWithValue("@cname", orderId);
                                updateCmd.ExecuteNonQuery();

                                lblMessage.Text = "Order returned successfully.";
                                lblMessage.ForeColor = System.Drawing.Color.Green;
                                lblMessage.Visible = true;

                                // Refresh GridView
                                GridView1.DataBind();
                            }
                        }
                        else
                        {
                            // Handle error if the order doesn't belong to the logged-in user
                            lblMessage.Text = "You cannot return an order that doesn't belong to you.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Visible = true;
                        }
                    }
                }
            }
            else
            {
                // Handle case where the user is not logged in
                lblMessage.Text = "Please log in to return your orders.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
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