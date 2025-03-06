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
    public partial class WebForm4 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        string str = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        string gen = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            gen = "MALE";
        }
        protected void rb2_CheckedChanged(object sender, EventArgs e)
        {
            gen = "female";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[feedback]
           ([name]
           ,[gender]
           ,[contact_no]
           ,[gmail]
           ,[msg])
     VALUES
('" + t1.Text + "','" + gen + "','" + cn1.Text + "','" + g1.Text + "','" + ms1.Text + "')", con);



            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Thanks for feedback..........')</script>");
        }
    }
}