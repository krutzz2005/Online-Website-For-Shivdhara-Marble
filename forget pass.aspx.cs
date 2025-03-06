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
    public partial class forget_pass : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        string str = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_login(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            con.Open();
            string v = "SELECT pass  FROM  regi where (username = '" + t1.Text + "') AND (que = '" + que.Text + "') AND (hint = '" + t2.Text + "')";
            cmd = new SqlCommand(v, con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Label1.Visible = true;
                t2.Visible = true;
                t2.Text = dr[0].ToString();
                l3.Text = "Your password";
                t1.Text = "";
                t2.Text = "";
                Response.Redirect("password.aspx");
            }
            else
            {
                // Response.Write("<script>window.alert('plz enter correct information')</script>");
                l3.Visible = true;
                l3.Text = "plz enter correct information";
                t1.Text = "";
                t2.Text = "";
                que.Text = "";

            }
            con.Close();

        }
        protected void btn_reset(object sender, EventArgs e)
        {
            t1.Text = "";
            t2.Text = "";
            que.Text = "";
        }
    }
        
        
       
}