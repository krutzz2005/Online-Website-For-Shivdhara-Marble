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
    public partial class password : System.Web.UI.Page
    {
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(newPassword))
            {
                lblMessage.Text = "Username and password cannot be empty.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE regi SET pass = @pass WHERE username = @username";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@pass", newPassword); // Consider hashing this password

                    try
                    {
                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        
                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Password updated successfully!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            Response.Redirect("login.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "User not found.";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                    }
                }
            }
        }
    }
}
