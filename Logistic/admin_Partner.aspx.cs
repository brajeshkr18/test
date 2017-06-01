using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.IO;
using System.Drawing;

namespace Logistic
{
    public partial class admin_Partner : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 1;
                BindDataList();

            }
        }
        public void Clear()
        {
            ddlStatus.SelectedIndex = 0;
            txtEmail.Value = "";
            txtMobile.Value = "";
            txtName.Value = "";
            txtpassword.Value = "";
            txtAddress.Value = "";
            txtCity.Value = "";
            txtState.Value = "";
            txtUserId.Value = "";

        }
        public void BindDataList()
        {
            DataTable data = new DataManager().SelectPartner(0);
            if (data.Rows.Count != 0)
            {
                gridPoll.DataSource = Session["gridPartner"] = data;
                gridPoll.DataBind();
                GridView1.DataSource = data;
                GridView1.DataBind();
                btnExport.Enabled = true;

            }
            else
            {
                DataTable dt0 = new DataTable();
                gridPoll.DataSource = dt0;
                gridPoll.DataBind();
                GridView1.DataSource = dt0;
                GridView1.DataBind();
                btnExport.Enabled = false;
            }

        }
        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            btnsubmit.Text = "Submit";
            Clear();

            MultiView1.ActiveViewIndex = 0;
        }
        protected void gridPoll_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridPoll.PageIndex = e.NewPageIndex;
            gridPoll.DataSource = Session["gridPartner"];
            gridPoll.DataBind();
        }
        protected void gridPoll_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                DataTable dt = new DataManager().SelectPartner(id);
                if (dt.Rows.Count != 0)
                {
                    MultiView1.ActiveViewIndex = 0;
                    btnsubmit.Text = "Update";
                    txtEmail.Value = dt.Rows[0]["Email"].ToString();
                    txtUserId.Value = dt.Rows[0]["UserId"].ToString();
                    txtpassword.Value = dt.Rows[0]["Password"].ToString();
                    txtName.Value = dt.Rows[0]["PartnerName"].ToString();
                    txtMobile.Value = dt.Rows[0]["Mobile"].ToString();
                    txtCity.Value = dt.Rows[0]["City"].ToString();
                    txtState.Value = dt.Rows[0]["State"].ToString();
                    txtAddress.Value = dt.Rows[0]["Address"].ToString();
                    ddlStatus.SelectedValue = dt.Rows[0]["role"].ToString();
                    lblId.Text = dt.Rows[0]["Id"].ToString();
                }

            }
            else if (e.CommandName == "Delete1")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                new DataManager().DeletePartner(id);
                BindDataList();
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

                if (new DataManager().InsertUpdatePartner(Convert.ToInt32(lblId.Text), 1, txtName.Value.ToString(), txtMobile.Value.ToString(), txtEmail.Value.ToString(), txtCity.Value.ToString(), txtState.Value.ToString(), txtAddress.Value.ToString(), txtpassword.Value.ToString(), ddlStatus.SelectedValue.ToString(), txtUserId.Value.ToString()) > 0)
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
            else
            { 
                if (new DataManager().checkPartner(txtMobile.Value.ToString(), txtEmail.Value.ToString()) == 1)
                {
                    if (new DataManager().InsertUpdatePartner(0, 0, txtName.Value.ToString(), txtMobile.Value.ToString(), txtEmail.Value.ToString(), txtCity.Value.ToString(), txtState.Value.ToString(), txtAddress.Value.ToString(), txtpassword.Value.ToString(), ddlStatus.SelectedValue.ToString(), txtUserId.Value.ToString()) > 0)
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
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Already Exist');", true);

            }
            }
        }
        private void SearchText()
        {
            DataTable dt = new DataManager().SelectPartner(0);
            DataView dv = new DataView(dt);
            string SearchExpression = null;
            if (!String.IsNullOrEmpty(txtSearch.Text))
            {
                SearchExpression = string.Format("{0} '%{1}%'",
                gridPoll.SortExpression, txtSearch.Text);


            }
            dv.RowFilter = "PartnerName LIKE " + SearchExpression + " OR Email LIKE " + SearchExpression + " OR Mobile like" + SearchExpression + "OR City like" + SearchExpression + "";
            gridPoll.DataSource = dv;
            gridPoll.DataBind();

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
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindDataList();
        }
        protected void ExportToExcel(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=PartnerExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView1.AllowPaging = false;
                this.BindDataList();

                GridView1.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
    
}