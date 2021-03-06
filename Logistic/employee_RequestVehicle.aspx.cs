﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using ContactEmail;
using System.Configuration;
using SendMailClass;

namespace Logistic
{
    public partial class employee_RequestVehicle : System.Web.UI.Page
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
            DataTable data = new DataManager().SelectVehicleRequestbyCircle(Convert.ToInt32(Session["EmployeeId"]));
            if (data.Rows.Count != 0)
            {
                gridState.DataSource = Session["gridVehicle"] = data;
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
        }
        public void Clear()
        {
            txtComments.Value = "";
            txtFreight.Value = "";
            ddlWeight.SelectedIndex = 0;
            txtFrom.Value = "";
            txtTo.Value = "";
            ddlTop.SelectedIndex = 0;
            ddlType.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            ddlPartner.SelectedIndex = 0;
            ddlCity.SelectedIndex = 0;
            txtType.Value = "";
            txtName.Value = "";
            txtMobile.Value = "";
        }
        protected void gridState_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridState.PageIndex = e.NewPageIndex;
            gridState.DataSource = Session["gridVehicle"];
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
                btnSendmail.Visible = true;
                txtemail.Visible = true;
                lblEmailId.Visible = true;

            }
            else if (e.CommandName == "Delete1")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                new DataManager().DeleteVehicleRequest(id);
                BindDataList();
            }
        }
        public void filldata(int id)
        {
            DataTable dt = new DataManager().SelectVehicleRequest(id);
            if (dt.Rows.Count != 0)
            {
                MultiView1.ActiveViewIndex = 0;
                txtFrom.Value = dt.Rows[0]["FromState"].ToString();
                txtTo.Value = dt.Rows[0]["ToState"].ToString();
                ddlType.SelectedValue = dt.Rows[0]["VehicleTypeId"].ToString();
                ddlTop.SelectedValue = dt.Rows[0]["Tops"].ToString();
                ddlWeight.SelectedValue = dt.Rows[0]["Weight"].ToString();
                txtFreight.Value = dt.Rows[0]["Freight"].ToString();
                txtComments.Value = dt.Rows[0]["Comments"].ToString();
                ddlStatus.SelectedValue = dt.Rows[0]["status"].ToString();
                ddlPartner.SelectedValue = dt.Rows[0]["PartnerId"].ToString();
                ddlCity.SelectedValue = dt.Rows[0]["Circle"].ToString();
                txtType.Value = dt.Rows[0]["postBy"].ToString();
                txtName.Value = dt.Rows[0]["Name"].ToString();
                txtMobile.Value = dt.Rows[0]["Mobile"].ToString();
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


                if (new DataManager().InsertUpdateVehicleRequest(Convert.ToInt32(lblId.Text), 1, txtFrom.Value.ToString(), txtTo.Value.ToString(), Convert.ToInt32(ddlType.SelectedValue), ddlTop.SelectedValue, ddlWeight.SelectedValue.ToString(), txtFreight.Value.ToString(), txtComments.Value.ToString(), ddlStatus.SelectedValue, Convert.ToInt32(ddlPartner.SelectedValue), ddlCity.SelectedValue, txtType.Value.ToString(), txtName.Value.ToString(), txtMobile.Value.ToString()) > 0)
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
                if (new DataManager().InsertUpdateVehicleRequest(0, 0, txtFrom.Value.ToString(), txtTo.Value.ToString(), Convert.ToInt32(ddlType.SelectedValue), ddlTop.SelectedValue, ddlWeight.SelectedValue.ToString(), txtFreight.Value.ToString(), txtComments.Value.ToString(), ddlStatus.SelectedValue, Convert.ToInt32(ddlPartner.SelectedValue), ddlCity.SelectedValue, txtType.Value.ToString(), txtName.Value.ToString(), txtMobile.Value.ToString()) > 0)
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
            DataTable dt = new DataManager().SelectVehicleRequestbyCircle(Convert.ToInt32(Session["EmployeeId"]));
            DataView dv = new DataView(dt);
            string SearchExpression = null;
            if (!String.IsNullOrEmpty(txtSearch.Text))
            {
                SearchExpression = string.Format("{0} '%{1}%'",
                gridState.SortExpression, txtSearch.Text);


            }
            dv.RowFilter = "stateName LIKE " + SearchExpression + " OR Type LIKE " + SearchExpression + " OR Tops like" + SearchExpression + "OR status like" + SearchExpression + "";
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
        protected void btnSendmail_Click(object sender, EventArgs e)
        {
            if (txtemail.Value == "")

            {
                Response.Write("<script>alert('Enter EmailId !!!');</script>");
                //  return;
                Mailer test = new Mailer();
                test.SendSMS("9910753655", "test@123");

            }
            //else if(txtemail.Value.Contains())
            //{
            //    Response.Write("<script>alert('Enter valid !!!');</script>");
            //    return;

            //}
            Mailer Emailer = new Mailer();
            MessageDetails message = new MessageDetails();
            message.Client = MultiView1.ActiveViewIndex.ToString();
            message.Load_From = txtFrom.Value;
            message.Unload_To = txtTo.Value;
            message.Vehicle_Type = ddlType.SelectedItem.Text;
            message.Top = ddlTop.SelectedValue;
            message.Suggested_Weight = ddlWeight.SelectedValue;
            message.Suggested_Freight = txtFreight.Value;
            message.Comments = txtComments.Value;
            message.NameOfCircle = ddlCity.SelectedItem.Text;

            message.PostBy = txtType.Value;
            message.Name = txtName.Value;
            message.Mobile_No = txtMobile.Value;
            message.Status = lblId.Text;
            //DataSetToExcel.Convert(dt, Response,"Newfile");
            // ConfigurationManager.AppSettings["EmailTo"].ToString()
            var sendto = txtemail.Value;
            if (Emailer.SendContactMailToTeam(sendto,
               sendto, sendto, ConfigurationManager.AppSettings["Subject"].ToString(),
                ConfigurationManager.AppSettings["EmailFrom"].ToString(), "9999999999", message,
                ConfigurationManager.AppSettings["CC"].ToString(), ConfigurationManager.AppSettings["BCC"].ToString(),
                true, Server.MapPath(ConfigurationManager.AppSettings["EmailTemplatePath"].ToString() + "ContactTemplateToTeam.html")))
            {
                Response.Write("<script>alert('Mail sent successfully!!!');</script>");
                return;
            }
            else
                Response.Write("<script>alert('Oops Something went Wrong!!!');</script>");
            return;
        }
    }
}