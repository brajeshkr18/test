using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Logistic
{
    public partial class partner : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PartnerName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            else
            {
                lblPartner.Text = "Welcome" + ", " + Session["PartnerName"].ToString();

            }
        }
        //protected void btnLogOut_Click(object sender, EventArgs e)
        //{
        //    Session["Name"] = "";
        //    Response.Redirect("Login.aspx");
        //}
    }
}