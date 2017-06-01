using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Logistic
{
    public partial class partner_home_Bill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindDataList();
            }
        }
        public void BindDataList()
        {
            DataTable dt1 = new DataManager().CountTotalBillByPartner(Convert.ToInt32(Session["PartnerId"]));
            if (dt1.Rows.Count > 0)
            {

                lblTotalGenerateBill.Text = dt1.Rows[0]["TotalBill"].ToString();

            }
            else
            {
                lblTotalGenerateBill.Text = "0";

            }
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            DataTable dt2 = new DataManager().CountTodayBillByPartner(Convert.ToInt32(Session["PartnerId"]), date);
            if (dt2.Rows.Count > 0)
            {

                lblTodayGenerateBill.Text = dt2.Rows[0]["TodayBill"].ToString();

            }
            else
            {
                lblTodayGenerateBill.Text = "0";

            }

            DataTable dt3 = new DataManager().CountInvoicebyStatusAndPartner("Pending", Convert.ToInt32(Session["PartnerId"]));
            if (dt3.Rows.Count > 0)
            {

                lblTotalPending.Text = dt3.Rows[0]["Status"].ToString();

            }
            else
            {
                lblTotalPending.Text = "0";

            }
            DataTable dt4 = new DataManager().CountInvoicebyStatusAndPartner("Reject", Convert.ToInt32(Session["PartnerId"]));
            if (dt4.Rows.Count > 0)
            {

                lblTotalBillRejection.Text = dt4.Rows[0]["Status"].ToString();

            }
            else
            {
                lblTotalBillRejection.Text = "0";

            }
            DataTable dt5 = new DataManager().CountInvoicebyStatusAndPartner("Accept", Convert.ToInt32(Session["PartnerId"]));
            if (dt5.Rows.Count > 0)
            {

                lblTotalBillAccept.Text = dt5.Rows[0]["Status"].ToString();

            }
            else
            {
                lblTotalBillAccept.Text = "0";

            }
        }
    }
}