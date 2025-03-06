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
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection con;
        String tot = "";
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            string str = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            con = new SqlConnection(str);
            con.Open();
            String unm1 = Session["uid"].ToString();
            String v = "select sum(total) from addtocart where unm='" + unm1 + "'";
            SqlDataAdapter da = new SqlDataAdapter(v, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            Label2.Text = "<h3>" + dt.Rows[0][0].ToString() + "</h3>";
            tot = dt.Rows[0][0].ToString();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("order.aspx?tot=" + tot);
        }
    }
}