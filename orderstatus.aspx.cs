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
    public partial class WebForm6 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnBill_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string orderId = btn.CommandArgument;

            // Redirect to bill.aspx with Order ID
            Response.Redirect("bill.aspx?orderId=" + orderId);
        }
        protected void btnReturn_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("return_order.aspx?id=" + e.CommandArgument.ToString());
        }

    }
}