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
    public partial class employee_Manager_Appraisal : System.Web.UI.Page
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
            DataTable data = new DataManager().SelectEmployeeAppraisalbyManagerId(Convert.ToInt32(Session["EmployeeId"]));
            if (data.Rows.Count != 0)
            {
                gridState.DataSource = Session["gridManagerApp"] = data;
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
            txtRemark1.Value = "";
            txtRemark2.Value = "";
            txtRemark3.Value = "";
            txtRemark4.Value = "";
            txtRemark5.Value = "";
            lbl_point1.Text = "";
            lbl_point2.Text = "";
            lbl_point3.Text = "";
            lbl_point4.Text = "";
            lbl_point5.Text = "";
            Rating1.CurrentRating = 0;
            Rating2.CurrentRating = 0;
            Rating3.CurrentRating = 0;
            Rating4.CurrentRating = 0;
            Rating5.CurrentRating = 0;
           
        }
        protected void gridState_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridState.PageIndex = e.NewPageIndex;
            gridState.DataSource = Session["gridManagerApp"];
            gridState.DataBind();
        }
        protected void gridState_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            if (e.CommandName == "View")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                filldata(id);
                btnsubmit.Text = "Back";
            }
            
        }
        public void filldata(int id)
        {
            DataTable dt = new DataManager().SelectEmployeeAppraisal(id);
            if (dt.Rows.Count != 0)
            {
                MultiView1.ActiveViewIndex = 0;
                lbl_point1.Text = dt.Rows[0]["Rating1"].ToString();
                Rating1.CurrentRating = Convert.ToInt32(lbl_point1.Text);
                txtRemark1.Value = dt.Rows[0]["Remark1"].ToString();

                lbl_point2.Text = dt.Rows[0]["Rating2"].ToString();
                Rating2.CurrentRating = Convert.ToInt32(lbl_point2.Text);
                txtRemark2.Value = dt.Rows[0]["Remark2"].ToString();

                lbl_point3.Text = dt.Rows[0]["Rating3"].ToString();
                Rating3.CurrentRating = Convert.ToInt32(lbl_point3.Text);
                txtRemark3.Value = dt.Rows[0]["Remark3"].ToString();

                lbl_point4.Text = dt.Rows[0]["Rating4"].ToString();
                Rating4.CurrentRating = Convert.ToInt32(lbl_point4.Text);
                txtRemark4.Value = dt.Rows[0]["Remark4"].ToString();

                lbl_point5.Text = dt.Rows[0]["Rating5"].ToString();
                Rating5.CurrentRating = Convert.ToInt32(lbl_point5.Text);
                txtRemark5.Value = dt.Rows[0]["Remark5"].ToString();
               
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
            
            if (btnsubmit.Text == "Back")
            {
                Clear();
                MultiView1.ActiveViewIndex = 1;
            }
            
        }
        private void SearchText()
        {
            DataTable dt = new DataManager().SelectEmployeeAppraisalbyManagerId(Convert.ToInt32(Session["EmployeeId"]));
            DataView dv = new DataView(dt);
            string SearchExpression = null;
            if (!String.IsNullOrEmpty(txtSearch.Text))
            {
                SearchExpression = string.Format("{0} '%{1}%'",
                gridState.SortExpression, txtSearch.Text);


            }
            dv.RowFilter = "Remark1 LIKE " + SearchExpression + " OR Remark2 LIKE " + SearchExpression + "";

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
        protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            lbl_point1.Text = e.Value.ToString();
        }
        protected void Rating2_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            lbl_point2.Text = e.Value.ToString();
        }
        protected void Rating3_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            lbl_point3.Text = e.Value.ToString();
        }
        protected void Rating4_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            lbl_point4.Text = e.Value.ToString();
        }
        protected void Rating5_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            lbl_point5.Text = e.Value.ToString();
        }
    }
}