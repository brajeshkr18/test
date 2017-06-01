using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Logistic
{
    public partial class postload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
                BindDataList();
            }
        }
        public void BindDataList()
        { 
           
            DataTable dt2 = new DataManager().SelectVehicleType(0);
            if (dt2.Rows.Count != 0)
            {
                ddlType.DataSource = dt2;
                ddlType.DataTextField = "Type";
                ddlType.DataValueField = "Id";
                ddlType.DataBind();
                ddlType.Items.Insert(0, new ListItem("--Select Vehicle Type--", "0"));



            }
            else
            {
                DataTable dt1 = new DataTable();
                ddlType.DataSource = dt1;
                ddlType.DataBind();
                ddlType.Items.Insert(0, new ListItem("--No Vehicle Type--", "0"));


            }
            Clear();

        }       
        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            if (new DataManager().InsertUpdateLoadRequest(0, 0, txtFrom.Value.ToString(), txtTo.Value.ToString(), Convert.ToInt32(ddlType.SelectedValue), ddlTop.SelectedValue, ddlWeight.SelectedValue, txtFreight.Value.ToString(), txtComments.Value.ToString(), "Pending", 0, ddlCity.SelectedValue, "Web Site", txtClient.Value.ToString(), txtMobile.Value.ToString()) > 0)
            {
                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Your Details Submitted Successfully...!!!!');", true);
                Clear();
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Not Success...!!!!');", true);
            }
        }
        public void Clear()
        {
            txtClient.Value = "";
            txtComments.Value = "";
            txtFreight.Value = "";
            txtMobile.Value = "";
            ddlWeight.SelectedIndex = 0;
            ddlType.SelectedIndex = 0;
            ddlTop.SelectedIndex = 0;
            txtTo.Value = "";
            txtFrom.Value = "";
            ddlCity.SelectedIndex = 0;
        }
    }
}