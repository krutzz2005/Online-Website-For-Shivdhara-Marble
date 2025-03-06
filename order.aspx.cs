using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.IO;

namespace marble
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adp;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            btnSubmit.Enabled = false;
           

            string str = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            con = new SqlConnection(str);

            con.Open();
            int i;
            cmd = new SqlCommand("select max(id) from order13", con);
            String a = Convert.ToString(cmd.ExecuteScalar());
            if (a == "")
                i = 1;
            else
                i = Convert.ToInt32(a) + 1;
            TextBox5.Text = i.ToString();
            con.Close();
            detail();
            Label5.Text = "<h3>" + Request.QueryString["tot"] + "</h3>";
            Literal1.Text = "<h3>" + Request.QueryString["tot"] + "</h3>";
            if (!IsPostBack)
            {
                con.Open();
                String sid = Session["uid"].ToString();
                Session.Timeout = 60;
                String s1 = "select * from addtocart where unm='" + sid + "'";
                // SqlDataAdapter da1 = new SqlDataAdapter(s1, con);
                SqlDataAdapter da1 = new SqlDataAdapter(s1, con);
                DataTable dt = new DataTable();
                da1.Fill(dt);

                int tot_row = Int32.Parse(dt.Rows.Count.ToString());
                int x = 0;

                while (x < tot_row)
                {
                    Literal2.Text = Literal2.Text + "<tr><td>" + dt.Rows[x]["p_nm"] + "</td><td>" + dt.Rows[x]["qty"] + "</td><td>" + dt.Rows[x]["total"] + "</td></tr>";

                    x++;
                }
                con.Close();
            }
        }
        protected void delete1()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("delete from addtocart", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

        }
        protected void detail()
        {
            if (Session["uid"] != null)
            {
                con.Open();
                String nm = Session["uid"].ToString();
                String ss = "select * from regi where username='" + nm + "'";
                SqlDataAdapter da = new SqlDataAdapter(ss, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                TextBox1.Text = dt.Rows[0][8].ToString();
                TextBox2.Text = dt.Rows[0][9].ToString();
                TextBox3.Text = dt.Rows[0][7].ToString();
                TextBox4.Text = dt.Rows[0][5].ToString();
                con.Close();
            }
            else
            {
                Response.Redirect("view addtocart.aspx");
            }
        }
        protected void print()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from order13", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            String n = dt.Rows[0][0].ToString();
            Response.Write("<script>alert('OrderId :')</script>");
            con.Close();
        }
        protected void btn1(object sender, EventArgs e)
        {
             try
            {
                adp = new SqlDataAdapter ("select max(id) from [order13]", con);
                DataSet ds = new DataSet();

                con.Open();
                adp.Fill(ds);
                con.Close();

                int ano;

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    var result = ds.Tables[0].Rows[0][0];
                    if (result == DBNull.Value || string.IsNullOrEmpty(result.ToString()))
                    {
                        ano = 1;
                    }
                    else
                    {
                        ano = Int32.Parse(result.ToString()) + 1;
                    }
                }
                else
                {
                    ano = 1;
                }

                 int id = 101;
                String sss = Session["uid"].ToString();
                if (sss != null)
                {
                    con.Open();
                    //String dat = "24/02/2005";
                    //String dat = DateTime.Now.ToShortDateString().ToString();
                    string dat = DateTime.Now.ToString("yyyy-MM-dd");


                    String status = "Pending";
                    id++;

                    String ss = "insert into order13 values(" + TextBox5.Text + ",'" + TextBox1.Text + "','" + TextBox2.Text + "'," + TextBox3.Text + ", '" + TextBox4.Text + "','" + Literal2.Text + "', '" + Label5.Text + "','" + status + "','" + dat + "')";
                    //String ss = "insert into Order1 values("+id+",'" + TextBox1.Text + "','" + TextBox2.Text + "'," + TextBox3.Text + ",'" + TextBox4.Text + "','" + Literal2.Text + "','" +  Literal1.Text + "','"+status+ "','" + dat + "')";

                    SqlDataAdapter da = new SqlDataAdapter(ss, con);

                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();
                    Response.Redirect("orderstatus.aspx");
                    con.Close();
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
                print();
                delete1();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
            }
        }
        
    

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            Image1.Visible = true;
            QRCoder.QRCodeGenerator obj = new QRCoder.QRCodeGenerator();
            var data = obj.CreateQrCode(Literal1.Text, QRCoder.QRCodeGenerator.ECCLevel.H);
            var code = new QRCoder.QRCode(data);

            using (Bitmap bitmap = code.GetGraphic(50))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    bitmap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    byte[] byteImage = ms.ToArray();
                    string base64String = Convert.ToBase64String(byteImage);
                    Image1.ImageUrl = "data:image/png;base64," + base64String;
                }
            }
            Label2.Visible = false;
            Label3.Visible = false;
            btnSubmit.Enabled = true;
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Image1.Visible = false;

            Label3.Visible = true;
            btnSubmit.Enabled = true;
        }
    }
}
