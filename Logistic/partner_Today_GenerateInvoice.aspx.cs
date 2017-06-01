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
    public partial class partner_Today_GenerateInvoice : System.Web.UI.Page
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
            string today = DateTime.Now.ToString("yyyy-MM-dd");
            DataTable data = new DataManager().SelectInvoicebyPartnerIdToday(Convert.ToInt32(Session["PartnerId"]), "Pending", today);
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

        }
        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            btnsubmit.Text = "Submit";
            Clear();
            MultiView1.ActiveViewIndex = 0;
            DateTime today = DateTime.Today;
            txtDate.Value = today.ToString("dd/MM/yyyy");
        }
        public void Clear()
        {
            txtAmount.Value = "0.0";
            txtDate.Value = "";
            ddlConsigner.SelectedIndex = 0;
            txtPeriod.Value = "";
            txtSRNNo.Text = "";
            ddlCity.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
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
            else if (e.CommandName == "Print")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Response.Redirect("admin_pages-invoice.aspx?Id=" + id);
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
                txtSRNNo.Text = dt.Rows[0]["SRNNo"].ToString();
                ddlConsigner.SelectedValue = dt.Rows[0]["ConsignerId"].ToString();
                txtPeriod.Value = dt.Rows[0]["InvoicePeriod"].ToString();
                txtAmount.Value = dt.Rows[0]["InvoiceAmount"].ToString();
                ddlStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
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
                if (new DataManager().InsertUpdateInvoice(Convert.ToInt32(lblId.Text), 1, txtSRNNo.Text.ToString(), ddlCity.SelectedValue, Convert.ToInt32(ddlConsigner.SelectedValue), txtPeriod.Value.ToString(), Convert.ToDecimal(txtAmount.Value), ddlStatus.SelectedValue, Convert.ToInt32(Session["PartnerId"]), "", "") > 0)
                {
                    Clear();
                    btnsubmit.Text = "Submit";
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
            else
            {
                if (new DataManager().InsertUpdateInvoice(0, 0, txtSRNNo.Text.ToString(), ddlCity.SelectedValue, Convert.ToInt32(ddlConsigner.SelectedValue), txtPeriod.Value.ToString(), Convert.ToDecimal(txtAmount.Value), ddlStatus.SelectedValue, Convert.ToInt32(Session["PartnerId"]), "", "") > 0)
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
        }
        private void SearchText()
        {
            string today = DateTime.Now.ToString("yyyy-MM-dd");
            DataTable dt = new DataManager().SelectInvoicebyPartnerIdToday(Convert.ToInt32(Session["PartnerId"]), "Pending", today);
            DataView dv = new DataView(dt);
            string SearchExpression = null;
            if (!String.IsNullOrEmpty(txtSearch.Text))
            {
                SearchExpression = string.Format("{0} '%{1}%'",
                gridState.SortExpression, txtSearch.Text);


            }

            dv.RowFilter = "SRNNo LIKE " + SearchExpression + "OR InvoiceAmount like" + SearchExpression + "";

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
        protected void txtSRNNo_TextChanged(object sender, EventArgs e)
        {
            DataTable dt = new DataManager().SelectConsignmentBySRNNo(txtSRNNo.Text);
            if (dt.Rows.Count > 0)
            {
                ddlConsigner.SelectedValue = dt.Rows[0]["ConsignerId"].ToString();
                txtAmount.Value = dt.Rows[0]["TotalAmount"].ToString();
            }
            else
            {
                ddlConsigner.SelectedIndex = 0;
                txtAmount.Value = "";
            }
        }
      
    }
}