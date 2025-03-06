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
     
    public partial class login : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        string str = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            con.Open();
            string username, pass;
            username = user.Text;
            pass = pass1.Text;
            string v = "select * from regi where username='" + username + "' and pass='" + pass + "' ";
            SqlDataAdapter da = new SqlDataAdapter(v, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count.Equals(1))
            {
                Session["uid"] = user.Text;
                Response.Redirect("home.aspx");


            }
            else
            {
                Response.Write("<script>alert('Error :- Username and Password are wrong.  OR  Registration Now')</script>");
            }

        }
    }

}