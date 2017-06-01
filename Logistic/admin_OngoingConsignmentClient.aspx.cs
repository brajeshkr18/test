using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Logistic
{
    public partial class admin_OngoingConsignmentClient : System.Web.UI.Page
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
            
            DataTable dt = new DataManager().SelectConsignmentbyStatus("Pending");
            if (dt.Rows.Count != 0)
            {
                ddlConsignementID.DataSource = dt;
                ddlConsignementID.DataTextField = "ConsignementID";
                ddlConsignementID.DataValueField = "ConsignementID";
                ddlConsignementID.DataBind();
                ddlConsignementID.Items.Insert(0, new ListItem("--Select ConsignementID--", "0"));



            }
            else
            {
                DataTable dt1 = new DataTable();
                ddlConsignementID.DataSource = dt1;
                ddlConsignementID.DataBind();
                ddlConsignementID.Items.Insert(0, new ListItem("--No ConsignementID--", "0"));


            }
            DataTable dt3 = new DataManager().SelectState(0);
            if (dt3.Rows.Count != 0)
            {
                ddlConsigner.DataSource = dt3;
                ddlConsigner.DataTextField = "stateName";
                ddlConsigner.DataValueField = "Id";
                ddlConsigner.DataBind();
                ddlConsigner.Items.Insert(0, new ListItem("--Select Consigner--", "0"));

            }
            else
            {
                DataTable dt1 = new DataTable();
                ddlConsigner.DataSource = dt1;
                ddlConsigner.DataBind();
                ddlConsigner.Items.Insert(0, new ListItem("--No Consigner--", "0"));


            }
            Clear();
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
            Response.Redirect("admin_home.aspx");
        }
        public void Clear()
        {
            txtBookingDate.Value = "";
            txtConsigneeId.Value = "";
            ddlConsigner.SelectedIndex = 0;
            txtDeliveryDate.Value = "";
            txtDeliveryRem.Value = "";
            txtDeliveryStatus.Value = "";
            txtFrom.Value = "";
            txtMobileNo.Value = "";
            txtReceiverName.Value = "";
            txtTo.Value = "";

        }
        protected void ddlConsignementID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlConsignementID.SelectedIndex > 0)
            {
                DataTable dt = new DataManager().SelectConsignmentByConsignementID1(ddlConsignementID.SelectedValue);
                if (dt.Rows.Count > 0)
                {
                    txtBookingDate.Value = dt.Rows[0]["Date"].ToString();
                    txtConsigneeId.Value = dt.Rows[0]["ConsigneeName"].ToString();
                    ddlConsigner.DataTextField = dt.Rows[0]["ConsignerId"].ToString();
                    txtDeliveryDate.Value = dt.Rows[0]["DateofDeliver"].ToString();
                    txtDeliveryStatus.Value = dt.Rows[0]["Status"].ToString();
                    txtFrom.Value = dt.Rows[0]["Address1"].ToString();
                    txtTo.Value = dt.Rows[0]["Address2"].ToString();
                    txtDeliveryRem.Value = dt.Rows[0]["Delivery_Remark"].ToString();
                    txtReceiverName.Value = dt.Rows[0]["Receivers_Name"].ToString();
                    txtMobileNo.Value = dt.Rows[0]["ContactNo2"].ToString();
                }
                else
                {
                    Clear();
                }
            }
        }
    }
}