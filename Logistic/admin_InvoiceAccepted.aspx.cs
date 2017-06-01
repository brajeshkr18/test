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
    public partial class admin_InvoiceAccepted : System.Web.UI.Page
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
            DataTable data = new DataManager().SelectInvoicebyStatus("Accept");
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

            DataTable dt3 = new DataManager().SelectPartner(0);
            if (dt3.Rows.Count != 0)
            {
                ddlPartner.DataSource = dt3;
                ddlPartner.DataTextField = "PartnerName";
                ddlPartner.DataValueField = "Id";
                ddlPartner.DataBind();
                ddlPartner.Items.Insert(0, new ListItem("--Select Partner--", "0"));



            }
            else
            {
                DataTable dt1 = new DataTable();
                ddlPartner.DataSource = dt1;
                ddlPartner.DataBind();
                ddlPartner.Items.Insert(0, new ListItem("--No Partner--", "0"));


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
            ddlPartner.SelectedIndex = 0;
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
                txtRejectionRemark.Disabled = true;
                MultiView1.ActiveViewIndex = 0;
                ddlCity.SelectedValue = dt.Rows[0]["City"].ToString();
                txtDate.Value = dt.Rows[0]["Invoice_date"].ToString();
                txtSRNNo.Value = dt.Rows[0]["SRNNo"].ToString();
                txtNameOfAccount.Value = dt.Rows[0]["NameOfAccount"].ToString();
                txtPeriod.Value = dt.Rows[0]["InvoicePeriod"].ToString();
                txtAmount.Value = dt.Rows[0]["InvoiceAmount"].ToString();
                ddlStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
                ddlPartner.SelectedValue = dt.Rows[0]["PartnerId"].ToString();
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
            if (btnsubmit.Text == "Update")
            {
                if (new DataManager().UpdateInvoice(Convert.ToInt32(lblId.Text), ddlStatus.SelectedValue, txtDateOfReview.Value.ToString(), txtRejectionRemark.Value.ToString()) > 0)
                {
                    Clear();
                    MultiView1.ActiveViewIndex = 1;
                    BindDataList();

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Not Success...!!!!');", true);
                }


            }
            else if (btnsubmit.Text == "Back")
            {
                Clear();
                MultiView1.ActiveViewIndex = 1;
            }

        }
        private void SearchText()
        {
            DataTable dt = new DataManager().SelectInvoicebyStatus("Accept");
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
        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlStatus.SelectedValue == "Reject")
            {

                txtRejectionRemark.Disabled = false;

            }
            else
            {
                txtRejectionRemark.Disabled = true;
                txtRejectionRemark.Value = "";
                txtDateOfReview.Value = "";
            }
        }
       
    }
}