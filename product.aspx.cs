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
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drp_productctegory();
            }
        }
        public void drp_productctegory()
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("select * from m_category", con);
            Mid.DataSource = cmd.ExecuteReader();
            Mid.DataTextField = "cat_nm";
            Mid.DataValueField = "cat_nm";
            Mid.DataBind();
            Mid.Items.Insert(0, "product category");

        }

        protected void productcategory_selectedindex(object sender, EventArgs e)
        {
            string strquery = "";
            string selectproduct = Mid.SelectedItem.Text;

            if (selectproduct == "product category")
            {
                strquery = "";

            }
            else
            {

                strquery = selectproduct;

            }


            SqlDataAdapter sda = new SqlDataAdapter("select * from product  where main_cnm='" + strquery + "' ", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            try
            {
                if (selectproduct == dt.Rows[0][4].ToString())
                {

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('product found')</script>");
            }
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();

        }

    }
}