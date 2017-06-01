using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;

namespace Logistic
{
    public partial class partner_OldInvoice : System.Web.UI.Page
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
            DataTable data = new DataManager().SelectInvoicebyPartnerId(Convert.ToInt32(Session["PartnerId"]), "Pending");
            if (data.Rows.Count != 0)
            {
                gridState.DataSource = Session["gridInvoice"] = data;
                gridState.DataBind();

            }
            else
            {
                DataTable dt0 = new DataTable();
                gridState.DataSource = dt0;
                gridState.DataBind();
            }

        }
        public void Clear()
        {

            txtAmount.Value = "0.0";
            txtDate.Value = "";
            txtNameOfAccount.Value = "";
            txtPeriod.Value = "";
            txtSRNNo.Value = "";
            ddlCity.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;         
            txtRejectionRemark.Value = "";
            txtDateOfReview.Value = "";
        }
        protected void gridState_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridState.PageIndex = e.NewPageIndex;
            gridState.DataSource = Session["gridInvoice"];
            gridState.DataBind();
        }
        protected void gridState_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                filldata(id);
                btnsubmit.Text = "Update";

            }

            else if (e.CommandName == "View")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                filldata(id);
                btnsubmit.Text = "Back";
            }
            else if (e.CommandName == "Delete1")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                new DataManager().DeleteInvoice(id);
                BindDataList();
            }
        }
        public void filldata(int id)
        {
            DataTable dt = new DataManager().SelectInvoice(id);
            if (dt.Rows.Count != 0)
            {
                MultiView1.ActiveViewIndex = 0;
                ddlCity.SelectedValue = dt.Rows[0]["City"].ToString();
                txtDate.Value = dt.Rows[0]["Invoice_date"].ToString();
                txtSRNNo.Value = dt.Rows[0]["SRNNo"].ToString();
                txtNameOfAccount.Value = dt.Rows[0]["NameOfAccount"].ToString();
                txtPeriod.Value = dt.Rows[0]["InvoicePeriod"].ToString();
                txtAmount.Value = dt.Rows[0]["InvoiceAmount"].ToString();
                ddlStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
                txtDateOfReview.Value = dt.Rows[0]["DateOfReview"].ToString();
                txtRejectionRemark.Value = dt.Rows[0]["RejectionRemark"].ToString();
                lblId.Text = dt.Rows[0]["Id"].ToString();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
            MultiView1.ActiveViewIndex = 1;

        }
        protected void btnsubmit_Click1(object sender, EventArgs e)
        {   
                Clear();
                MultiView1.ActiveViewIndex = 1;
        }
        private void SearchText()
        {
            DataTable dt = new DataManager().SelectInvoicebyPartnerId(Convert.ToInt32(Session["PartnerId"]), "Pending");
            DataView dv = new DataView(dt);
            string SearchExpression = null;
            if (!String.IsNullOrEmpty(txtSearch.Text))
            {
                SearchExpression = string.Format("{0} '%{1}%'",
                gridState.SortExpression, txtSearch.Text);


            }

            dv.RowFilter = "SRNNo LIKE " + SearchExpression + " OR NameOfAccount LIKE " + SearchExpression + " OR InvoiceAmount like" + SearchExpression + "";

            gridState.DataSource = dv;
            gridState.DataBind();

        }
        public string Highlight(string InputTxt)
        {
            string Search_Str = txtSearch.Text.ToString();
            Regex RegExp = new Regex(Search_Str.Replace(" ", "|").Trim(),
            RegexOptions.IgnoreCase);
            return RegExp.Replace(InputTxt,
            new MatchEvaluator(ReplaceKeyWords));
            RegExp = null;

        }
        public string ReplaceKeyWords(Match m)
        {

            return "<span class=highlight>" + m.Value + "</span>";

        }
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

            if (txtSearch.Text == "")
            {
                BindDataList();
            }
            else
            {
                SearchText();
            }
        }
       
    }
}