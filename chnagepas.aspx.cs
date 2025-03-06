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
    public partial class chnagepas : System.Web.UI.Page
    {
    
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string oldPassword = txtOldPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(oldPassword) || 
                string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirmPassword))
            {
                lblMessage.Text = "All fields are required.";
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "New password and Confirm password do not match.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // Check if username and old password exist
                string checkQuery = "SELECT COUNT(*) FROM regi WHERE username = @username AND pass = @OldPassword";
                using (SqlCommand cmdCheck = new SqlCommand(checkQuery, con))
                {
                    cmdCheck.Parameters.AddWithValue("@username", username);
                    cmdCheck.Parameters.AddWithValue("@OldPassword", oldPassword); // Ideally, hash the password

                    int userExists = (int)cmdCheck.ExecuteScalar();
                    if (userExists == 0)
                    {
                        lblMessage.Text = "Invalid username or old password.";
                        return;
                    }
                }

                // Update the password
                string updateQuery = "UPDATE regi SET pass = @NewPassword WHERE username = @Username";
                using (SqlCommand cmdUpdate = new SqlCommand(updateQuery, con))
                {
                    cmdUpdate.Parameters.AddWithValue("@NewPassword", newPassword); // Ideally, hash the password
                    cmdUpdate.Parameters.AddWithValue("@Username", username);

                    int rowsAffected = cmdUpdate.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Password updated successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        Response.Redirect("login.aspx");

                    }
                    else
                    {
                        lblMessage.Text = "Password update failed.";
                    }
                }
            }
        }
    }
}
