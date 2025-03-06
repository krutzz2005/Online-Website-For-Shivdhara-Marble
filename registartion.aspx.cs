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
    public partial class registartion : System.Web.UI.Page
    {
        string gn = "";
        SqlConnection con;
        SqlCommand cmd;

        string str = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            con.Open();

            int i;
            cmd = new SqlCommand("select max(reg_id) from regi", con);
            String a = Convert.ToString(cmd.ExecuteScalar());
            if (a == "")
                i = 1;
            else
                i = Convert.ToInt32(a) + 1;
            TextBox1.Text = i.ToString();

            con.Close();
        }
        protected void rb1_CheckedChanged(object sender, EventArgs e)
        {
            gn = "Male";
        }
        protected void rb2_CheckedChanged(object sender, EventArgs e)
        {
            gn = "Female";
        }
        protected void rb3_CheckedChanged(object sender, EventArgs e)
        {
            gn = "other";
        }

        protected void RegisterUser(object sender, EventArgs e)
        {

            string captchaInput = txtCaptcha.Value;
            string captchaGenerated = captchaText.InnerText;


            if (captchaInput != captchaGenerated)
            {

                return;
            }
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {


            con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[regi]
           ([reg_id]
           ,[title]
           ,[fnm]
           ,[lnm]
           ,[gender]
           ,[address]
           ,[city]
           ,[phon]
           ,[username]
           ,[gmail]
           ,[pass]
           ,[confir]
           ,[que]
           ,[hint])
     VALUES
           
           ('" + TextBox1.Text + "','" + t1.Text + "','" + fnm.Text + "','" + lnm.Text + "','" + gn + "','" + add1.Text + "','" + c1.Text + "','" + cn1.Text + "','" + unm.Text + "','" + g1.Text + "','" + p1.Text + "','" + cp1.Text + "','" + que.Text + "','" + ans.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Succesfully run')</script>");
            Response.Redirect("~/login.aspx");
        }


    }
}