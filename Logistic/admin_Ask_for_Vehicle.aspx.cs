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
    public partial class admin_Ask_for_Vehicle : System.Web.UI.Page
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
            DataTable data = new DataManager().SelectAskForVehicle(0);
            if (data.Rows.Count != 0)
            {
                gridState.DataSource = Session["gridAskForVehicle"] = data;
                gridState.DataBind();

            }
            else
            {
                DataTable dt0 = new DataTable();
                gridState.DataSource = dt0;
                gridState.DataBind();
            }
           
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
        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            btnsubmit.Text = "Submit";
            Clear();
            MultiView1.ActiveViewIndex = 0;

            DataTable dt1 = new DataManager().SelectAskForVehicleMaxRequestID();
            if (dt1.Rows.Count > 0)
            {
                txtRequestNo.Value = dt1.Rows[0]["RequestNo"].ToString();
                if (txtRequestNo.Value == "")
                {
                    txtRequestNo.Value = "RQ/000000";
                }
            }
            else
            {
                txtRequestNo.Value = "RQ/000001";
            }
            var str = txtRequestNo.Value;
            var tempArray = str.Split('/');
            string tempId = tempArray[1];
            int id = Convert.ToInt32(tempId);
            id = id + 1;
            string autoId = "RQ/" + String.Format("{0:000000}", id);
            txtRequestNo.Value = autoId;
        }
        public void Clear()
        {
            txtRequestNo.Value = "";
            txtComments.Value = "";
            txtFreight.Value = "";
            txtWeight.Value = "";
            txtFrom.Value = "";
            txtTo.Value = "";
            ddlTop.SelectedIndex = 0;
            ddlType.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            ddlPartner.SelectedIndex = 0;
            ddlCity.SelectedIndex = 0;
        }
        protected void gridState_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridState.PageIndex = e.NewPageIndex;
            gridState.DataSource = Session["gridAskForVehicle"];
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
                new DataManager().DeleteAskForVehicle(id);
                BindDataList();
            }
        }
        public void filldata(int id)
        {
            DataTable dt = new DataManager().SelectAskForVehicle(id);
            if (dt.Rows.Count != 0)
            {
                MultiView1.ActiveViewIndex = 0;
                txtRequestNo.Value = dt.Rows[0]["RequestNo"].ToString();
                txtFrom.Value = dt.Rows[0]["FromState"].ToString();
                txtTo.Value = dt.Rows[0]["ToState"].ToString();
                ddlType.SelectedValue = dt.Rows[0]["VehicleTypeId"].ToString();
                ddlTop.SelectedValue = dt.Rows[0]["Tops"].ToString();
                txtWeight.Value = dt.Rows[0]["Weight"].ToString();
                txtFreight.Value = dt.Rows[0]["Freight"].ToString();
                txtComments.Value = dt.Rows[0]["Comments"].ToString();
                ddlStatus.SelectedValue = dt.Rows[0]["status"].ToString();
                ddlPartner.SelectedValue = dt.Rows[0]["PartnerId"].ToString();
                ddlCity.SelectedValue = dt.Rows[0]["Circle"].ToString();
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

                if (new DataManager().InsertUpdateAskForVehicle(Convert.ToInt32(lblId.Text), 1, txtRequestNo.Value, txtFrom.Value.ToString(), txtTo.Value.ToString(), Convert.ToInt32(ddlType.SelectedValue), ddlTop.SelectedValue, txtWeight.Value.ToString(), txtFreight.Value.ToString(), txtComments.Value.ToString(), ddlStatus.SelectedValue, Convert.ToInt32(ddlPartner.SelectedValue), ddlCity.SelectedValue) > 0)
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
                if (new DataManager().InsertUpdateAskForVehicle(0, 0, txtRequestNo.Value, txtFrom.Value.ToString(), txtTo.Value.ToString(), Convert.ToInt32(ddlType.SelectedValue), ddlTop.SelectedValue, txtWeight.Value.ToString(), txtFreight.Value.ToString(), txtComments.Value.ToString(), ddlStatus.SelectedValue, Convert.ToInt32(ddlPartner.SelectedValue), ddlCity.SelectedValue) > 0)
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
            DataTable dt = new DataManager().SelectAskForVehicle(0);
            DataView dv = new DataView(dt);
            string SearchExpression = null;
            if (!String.IsNullOrEmpty(txtSearch.Text))
            {
                SearchExpression = string.Format("{0} '%{1}%'",
                gridState.SortExpression, txtSearch.Text);


            }
           
            dv.RowFilter = "RequestNo LIKE " + SearchExpression + " OR stateName LIKE " + SearchExpression + " OR Type like" + SearchExpression + "OR status like" + SearchExpression + "";

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