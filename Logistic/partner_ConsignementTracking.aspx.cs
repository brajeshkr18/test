﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using ExcelUtility;

namespace Logistic
{
    public partial class partner_ConsignementTracking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
                MultiView1.ActiveViewIndex = 1;
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
        }
        public void Clear()
        {
            txtDate.Value = "";
            txtConsignementID.Value = "";
            ddlConsigner.SelectedIndex = 0;
            txtConsignee2.Value = "";
            txtAddress1.Value = "";
            txtAddress2.Value = "";
            txtContact1.Value = "";
            txtContact2.Value = "";
            txtDateOfDeliver.Value = "";
            txtDateOfLoading.Value = "";
            txtLR.Value = "";
            txtMaterialType.Value = "";
            txtRemark.Value = "";
            txtSRNNo.Value = "";


        }
        protected void lnkSearch_Click(object sender, EventArgs e)
        {
            if (ddlSearch.SelectedValue == "Date of Loading")
            {
                DataTable dt = new DataManager().SelectConsignmentByDateofLoading1(txtToDate.Value, txtFromDate.Value);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();

                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                }
            }
            else if (ddlSearch.SelectedValue == "Date of Deliver")
            {
                DataTable dt = new DataManager().SelectConsignmentByDateofDeliver1(txtToDate.Value, txtFromDate.Value);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();

                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                }
            }
            else if (ddlSearch.SelectedValue == "Consignement ID")
            {
                DataTable dt = new DataManager().SelectConsignmentByConsignementID3(txtSearch.Value);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();

                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                }
            }
            else if (ddlSearch.SelectedValue == "MIR/SRN No")
            {
                DataTable dt = new DataManager().SelectConsignmentBySRNNo1(txtSearch.Value);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();

                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                }
            }
        }
        protected void gridState_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                DataTable dt = new DataManager().SelectConsignment(id);
                if (dt.Rows.Count != 0)
                {
                    MultiView1.ActiveViewIndex = 0;
                    txtConsignementID.Value = dt.Rows[0]["ConsignementID"].ToString();
                    txtDate.Value = dt.Rows[0]["Date"].ToString();
                    txtSRNNo.Value = dt.Rows[0]["SRNNo"].ToString();
                    ddlConsigner.SelectedValue = dt.Rows[0]["ConsignerId"].ToString();
                    txtAddress1.Value = dt.Rows[0]["Address1"].ToString();
                    txtConsignee2.Value = dt.Rows[0]["ConsigneeName"].ToString();
                    txtAddress2.Value = dt.Rows[0]["Address2"].ToString();
                    txtContact1.Value = dt.Rows[0]["Contact1"].ToString();
                    txtContact2.Value = dt.Rows[0]["Contact2"].ToString();
                    txtLR.Value = dt.Rows[0]["LR"].ToString();
                    txtMaterialType.Value = dt.Rows[0]["MaterialType"].ToString();
                    txtRemark.Value = dt.Rows[0]["Remark"].ToString();
                    txtDateOfLoading.Value = dt.Rows[0]["DateofLoading"].ToString();
                    txtDateOfDeliver.Value = dt.Rows[0]["DateofDeliver"].ToString();
                    ddlStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
                    lblId.Text = dt.Rows[0]["Id"].ToString();
                }

            }

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {

            Clear();
            MultiView1.ActiveViewIndex = 1;

        }
        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSearch.SelectedValue == "Date of Loading")
            {
                txtSearch.Visible = false;
                txtToDate.Visible = true;
                txtFromDate.Visible = true;
            }
            else if (ddlSearch.SelectedValue == "Date of Deliver")
            {
                txtSearch.Visible = false;
                txtToDate.Visible = true;
                txtFromDate.Visible = true;
            }
            else if (ddlSearch.SelectedValue == "Consignement ID")
            {
                txtSearch.Visible = true;
                txtToDate.Visible = false;
                txtFromDate.Visible = false;
            }
            else if (ddlSearch.SelectedValue == "MIR/SRN No")
            {
                txtSearch.Visible = true;
                txtToDate.Visible = false;
                txtFromDate.Visible = false;
            }
        }
        protected void lnkExportExcel_Click(object sender, EventArgs e)
        {
            if (ddlSearch.SelectedValue == "Date of Loading")
            {
                DataTable dt = new DataManager().SelectConsignmentByDateofLoading1(txtToDate.Value, txtFromDate.Value);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();
                    // DataTable data = new DataManager().SelectConsignment1(0);
                    DataSetToExcel.Convert(dt, Response, "Newfile");
                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                }
            }
            else if (ddlSearch.SelectedValue == "Date of Deliver")
            {
                DataTable dt = new DataManager().SelectConsignmentByDateofDeliver1(txtToDate.Value, txtFromDate.Value);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();
                    DataSetToExcel.Convert(dt, Response, "Newfile");
                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                }
            }
            else if (ddlSearch.SelectedValue == "Consignement ID")
            {
                DataTable dt = new DataManager().SelectConsignmentByConsignementID3(txtSearch.Value);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();
                    DataSetToExcel.Convert(dt, Response, "Newfile");
                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                }
            }
            else if (ddlSearch.SelectedValue == "MIR/SRN No")
            {
                DataTable dt = new DataManager().SelectConsignmentBySRNNo1(txtSearch.Value);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();
                    DataSetToExcel.Convert(dt, Response, "Newfile");
                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                }
            }
            else if (ddlSearch.SelectedValue == "LR/GR Number")
            {
                DataTable dt = new DataManager().SelectConsignmentByLrgrNo1(txtSearch.Value);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();
                    DataSetToExcel.Convert(dt, Response, "Newfile");
                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                }

            }
            else if (ddlSearch.SelectedValue == "Vechile Number")
            {
                DataTable dt = new DataManager().SelectConsignmentByVeNo1(txtSearch.Value);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();
                    DataSetToExcel.Convert(dt, Response, "Newfile");
                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                }

            }
            else if (ddlSearch.SelectedValue == "Consigner Name")
            {
                DataTable dt = new DataManager().SelectConsignmentByCoName1(txtSearch.Value);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();
                    DataSetToExcel.Convert(dt, Response, "Newfile");
                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                }

            }


        }
    }
}