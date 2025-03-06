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
    public partial class return_order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if 'id' is passed in the query string
            if (Request.QueryString["id"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                LoadOrderDetails(id);
            }
            else
            {
                // Handle the case where no 'id' is passed
                Response.Write("<script>alert('Order ID is missing in the query string.');</script>");
            }
        }

        private void LoadOrderDetails(int id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection cn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM [dbo].[order13] WHERE id = @id";

                using (SqlCommand cmd = new SqlCommand(query, cn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            OrderId.Text = reader["id"].ToString();
                            // proid.Text = reader["p_id"].ToString();
                            ReturnDate.Text = DateTime.Now.ToString("yyyy-MM-dd"); // Set today's date as the return date
                        }
                        else
                        {
                            // Handle case when no order is found
                            Response.Write("<script>alert('Order not found.');</script>");
                        }
                    }
                }
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Retrieve values from the form
            int returnQty = Convert.ToInt32(ReturnQty.Text);
            string returnId = ReturnId.Text;
            string orderId = OrderId.Text;
            DateTime returnDate = DateTime.Parse(ReturnDate.Text);
            string reason = Reason.Text;

            // Connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL query to insert data into return_order table
                string insertQuery = "INSERT INTO return_order (return_id, id, return_date, reason, qty) VALUES (@return_id, @id, @return_date, @reason, @qty)";

                using (SqlCommand insertCmd = new SqlCommand(insertQuery, connection))
                {
                    insertCmd.Parameters.AddWithValue("@return_id", returnId);
                    insertCmd.Parameters.AddWithValue("@id", orderId);
                    insertCmd.Parameters.AddWithValue("@return_date", returnDate);
                    insertCmd.Parameters.AddWithValue("@reason", reason);
                    insertCmd.Parameters.AddWithValue("@qty", returnQty);

                    try
                    {
                        connection.Open();
                        insertCmd.ExecuteNonQuery();

                        // Get the current stock for the product
                        string stockQuery = "SELECT stock FROM [dbo].[product] WHERE p_id = @p_id";
                        using (SqlCommand stockCmd = new SqlCommand(stockQuery, connection))
                        {
                            stockCmd.Parameters.AddWithValue("@p_id", proid.Text);

                            // Retrieve current stock from product table
                            int currentStock = 0;
                            using (SqlDataReader dr = stockCmd.ExecuteReader())
                            {
                                if (dr.Read())
                                {
                                    currentStock = Convert.ToInt32(dr["stock"]);
                                }
                            }

                            // Calculate the new stock value after the return
                            int newStock = currentStock + returnQty;

                            // Update the stock in the product table
                            string updateStockQuery = "UPDATE [dbo].[product] SET stock = @stock WHERE p_id = @p_id";
                            using (SqlCommand updateStockCmd = new SqlCommand(updateStockQuery, connection))
                            {
                                updateStockCmd.Parameters.AddWithValue("@stock", newStock);
                                updateStockCmd.Parameters.AddWithValue("@p_id", proid.Text);
                                updateStockCmd.ExecuteNonQuery();
                            }
                        }

                        // Display a success message
                        Response.Write("<script>alert('Return submitted successfully!');</script>");
                    }
                    catch (Exception ex)
                    {
                        // Handle errors gracefully
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                }
            }
        }
    }
}
