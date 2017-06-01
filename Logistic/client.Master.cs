using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Logistic
{
    public partial class client : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            else
            {
               lblclient.Text = "Welcome" + ", " + Session["ClientName"].ToString();

            }
        }
        //protected void btnLogOut_Click(object sender, EventArgs e)
        //{
        //    Session["Name"] = "";
        //    Response.Redirect("Login.aspx");
        //}
    }
}