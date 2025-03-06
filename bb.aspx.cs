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
    public partial class bb : System.Web.UI.Page
    {
        
        string str = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string orderId = Request.QueryString["order_id"];
                if (!string.IsNullOrEmpty(orderId))
                {
                    try
                    {
                        LoadBillDetails(orderId);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "print", "print();", true);
                    }
                    catch (Exception ex)
                    {
                        // Log or display the error
                        lblError.Text = "Error loading the bill: " + ex.Message;
                    }
                }
            }
        }

        private void LoadBillDetails(string orderId)
        {
            unm.Text = Session["uid"].ToString();

            // Fetch user details
            try
            {
                using (SqlConnection conn = new SqlConnection(str))
                {
                    conn.Open();
                    string query = "SELECT phon, address FROM [dbo].[regi] WHERE username = @username";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", unm.Text); // Username passed from the session

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                mono.Text = reader["phon"].ToString(); // Mobile number
                                add.Text = reader["address"].ToString(); // Address
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error fetching user details: " + ex.Message;
                return;
            }

            // Fetch order details and calculate total bill
            decimal totalBill = 0; // Total bill amount
            try
            {
                using (SqlConnection conn = new SqlConnection(str))
                {
                    conn.Open();
                    string query = "SELECT p_nm, p_price, qty FROM [dbo].[order1] WHERE order_id = @orderId";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@orderId", orderId); // Order ID passed in the query string

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string productName = reader["p_nm"].ToString(); // Product name
                                int quantity = Convert.ToInt32(reader["qty"]); // Quantity
                                decimal price = Convert.ToDecimal(reader["p_price"]); // Price per product
                                decimal discountPercentage = 8; // Example discount percentage
                                decimal gstPercentage = 18; // Example GST percentage

                                // Calculate discount and GST
                                decimal discountAmount = (discountPercentage / 100) * price; // Discount amount
                                decimal priceAfterDiscount = price - discountAmount; // Price after discount
                                decimal gstAmount = (gstPercentage / 100) * price; // GST amount
                                decimal totalPrice = (priceAfterDiscount + gstAmount) * quantity; // Total price for this product

                                // Add to total bill
                                totalBill += totalPrice;

                                // Create a new row in the bill table
                                TableRow row = new TableRow();
                                row.Cells.Add(new TableCell { Text = productName });
                                row.Cells.Add(new TableCell { Text = quantity.ToString() });
                                row.Cells.Add(new TableCell { Text = price.ToString("C") });
                                row.Cells.Add(new TableCell { Text = discountAmount.ToString("C") });
                                row.Cells.Add(new TableCell { Text = gstAmount.ToString("C") });
                                tblProducts.Controls.Add(row); // Add to the table

                                // Insert each product into the bill database
                                InsertBillDetails(unm.Text, mono.Text, add.Text, orderId, productName, quantity, price, gstAmount, discountAmount);
                            }
                        }
                    }
                }

                lblTotal.Text = totalBill.ToString("C"); // Show total bill
                lblOrderId.Text = orderId; // Show order ID
                lblDate.Text = DateTime.Now.ToString("MM/dd/yyyy"); // Show current date
            }
            catch (Exception ex)
            {
                lblError.Text = "Error fetching order details: " + ex.Message; // Display error if occurs
            }
        }

        private void InsertBillDetails(string username, string mobileNo, string address, string orderId, string productName, int quantity, decimal price, decimal gst, decimal discount)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(str))
                {
                    conn.Open();
                    string query = "INSERT INTO bill (username, phon, address, order_id, p_nm, qty, p_price, gst, discount, total) VALUES (@username, @phon, @address, @order_id, @p_nm, @qty, @p_price, @gst, @discount, @total)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@phon", mobileNo);
                        cmd.Parameters.AddWithValue("@address", address);
                        cmd.Parameters.AddWithValue("@order_id", orderId);
                        cmd.Parameters.AddWithValue("@p_nm", productName);
                        cmd.Parameters.AddWithValue("@qty", quantity);
                        cmd.Parameters.AddWithValue("@p_price", price);
                        cmd.Parameters.AddWithValue("@gst", gst);
                        cmd.Parameters.AddWithValue("@discount", discount);
                        cmd.Parameters.AddWithValue("@total", (price - discount + gst) * quantity);

                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error inserting bill details: " + ex.Message; // Display error if occurs
            }
        }
    }
}
