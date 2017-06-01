using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Logistic
{
    public partial class admin_pages_invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblId.Text = Request.QueryString["Id"];
                filldata();
            }
        }
        public void filldata()
        {
            DataTable dt = new DataManager().SelectInvoice(Convert.ToInt32(lblId.Text));
            if (dt.Rows.Count != 0)
            {
               DateTime Date = DateTime.Parse(dt.Rows[0]["Invoice_date"].ToString());
               lblDate.Text = Convert.ToDateTime(Date).ToString("dd/MMM/yy");
               lblSRNNo.Text = dt.Rows[0]["SRNNo"].ToString();
               lblNameOfAccount.Text = dt.Rows[0]["NameOfAccount"].ToString();
               lblInvoicePeriod.Text = dt.Rows[0]["InvoicePeriod"].ToString();
               lblTotalAmount.Text = dt.Rows[0]["InvoiceAmount"].ToString();
               lblConsignementID.Text = dt.Rows[0]["ConsignementID"].ToString();
               lblAddress.Text = dt.Rows[0]["Address1"].ToString();
               lblPhone.Text = dt.Rows[0]["Contact1"].ToString();
               lblGrandTotal.Text = dt.Rows[0]["InvoiceAmount"].ToString();
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Response.Redirect("pages-invoice-print.aspx?Id=" + lblId.Text);
        }
    }
}