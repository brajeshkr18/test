﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;

namespace Logistic
{
    public partial class employee_employee_Appraisal : System.Web.UI.Page
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
            DataTable dt = new DataManager().SelectEmployee(Convert.ToInt32(Session["EmployeeId"]));
            if (dt.Rows.Count > 0)
            {
                txtLevel.Value = dt.Rows[0]["levels"].ToString();
                txtDesignation.Value = dt.Rows[0]["Designation"].ToString();
            }
            else
            {
                txtLevel.Value = "0";
                txtDesignation.Value = "";
            }
            string a = (Convert.ToDecimal(txtLevel.Value) + 1).ToString();
            DataTable dt3 = new DataManager().SelectEmployeebyLevel(a);
            if (dt3.Rows.Count != 0)
            {
                ddlEmployee.DataSource = dt3;
                ddlEmployee.DataTextField = "EmployeeName";
                ddlEmployee.DataValueField = "Id";
                ddlEmployee.DataBind();
                ddlEmployee.Items.Insert(0, new ListItem("--Select Employee--", "0"));



            }
            else
            {
                DataTable dt1 = new DataTable();
                ddlEmployee.DataSource = dt1;
                ddlEmployee.DataBind();
                ddlEmployee.Items.Insert(0, new ListItem("--No Employee--", "0"));


            }

            DataTable data = new DataManager().SelectEmployeeAppraisalbyLevels(Convert.ToInt32(txtLevel.Value));
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
            DataTable dt4 = new DataManager().SelectEmployee(0);
            if (dt4.Rows.Count != 0)
            {
                ddlManager.DataSource = dt4;
                ddlManager.DataTextField = "EmployeeName";
                ddlManager.DataValueField = "Id";
                ddlManager.DataBind();
                ddlManager.Items.Insert(0, new ListItem("-----------", "0"));



            }
            else
            {
                DataTable dt1 = new DataTable();
                ddlManager.DataSource = dt1;
                ddlManager.DataBind();
                ddlManager.Items.Insert(0, new ListItem("--No Manager--", "0"));


            }

            DataTable dt5 = new DataManager().SelectAppraisalMaxId();
            if (dt5.Rows.Count > 0)
            {
                string Max = dt5.Rows[0]["id"].ToString();

                DataTable dt2 = new DataManager().SelectAppraisal(Convert.ToInt32(Max));
                if (dt2.Rows.Count > 0)
                {
                    DateTime today = Convert.ToDateTime(DateTime.Today);
                    DateTime from = Convert.ToDateTime(dt2.Rows[0]["From_date"]);
                    txtFrom.Value = from.ToString();
                    DateTime To = Convert.ToDateTime(dt2.Rows[0]["To_date"]);
                    txtTo.Value = To.ToString();
                    if (from <= today && To >= today)
                    {
                        lnkAdd.Visible = true;
                        
                    }
                    else
                    {
                        lnkAdd.Visible = false;
                    }
                }
                else
                {
                    lnkAdd.Visible = false;
                }
            }
            else
            {
                lnkAdd.Visible = false;
            }

        }
        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            btnsubmit.Text = "Submit";
            Clear();
            MultiView1.ActiveViewIndex = 0;
            BindDataList();
        }
        public void Clear()
        {
            txtRemark1.Value = "";
            txtRemark2.Value = "";
            txtRemark3.Value = "";
            txtRemark4.Value = "";
            txtRemark5.Value = "";
            lbl_point1.Text = "0";
            lbl_point2.Text = "0";
            lbl_point3.Text = "0";
            lbl_point4.Text = "0";
            lbl_point5.Text = "0";
            Rating1.CurrentRating = 0;
            Rating2.CurrentRating = 0;
            Rating3.CurrentRating = 0;
            Rating4.CurrentRating = 0;
            Rating5.CurrentRating = 0;
            txtOther.Value = "";
            txtFileUpload.Value = "";
        }
        protected void gridState_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridState.PageIndex = e.NewPageIndex;
            gridState.DataSource = Session["gridManagerApp"];
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
                new DataManager().DeleteEmployeeAppraisal(id);
                BindDataList();
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

                DataTable dt3 = new DataManager().SelectEmployee(0);
                if (dt3.Rows.Count != 0)
                {
                    ddlEmployee.DataSource = dt3;
                    ddlEmployee.DataTextField = "EmployeeName";
                    ddlEmployee.DataValueField = "Id";
                    ddlEmployee.DataBind();
                    ddlEmployee.Items.Insert(0, new ListItem("--Select Employee--", "0"));



                }
                else
                {
                    DataTable dt1 = new DataTable();
                    ddlEmployee.DataSource = dt1;
                    ddlEmployee.DataBind();
                    ddlEmployee.Items.Insert(0, new ListItem("--No Employee--", "0"));


                }
                ddlEmployee.SelectedValue = dt.Rows[0]["EmployeeId"].ToString();
                ddlManager.SelectedValue = dt.Rows[0]["ManagerId"].ToString();

                txtOther.Value = dt.Rows[0]["Other"].ToString();
                txtFileUpload.Value = dt.Rows[0]["File_path"].ToString();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {

            Clear();
            MultiView1.ActiveViewIndex = 1;

        }
        protected void btnsubmit_Click1(object sender, EventArgs e)
        {
            int count1 = 0;
            int count2 = 0;
            int count3 = 0;
            int count4 = 0;
            int count5 = 0;
            if (btnsubmit.Text == "Update")
            {
                string file1 = string.Empty;
                if (!FileUpload1.HasFile)
                {
                    file1 = txtFileUpload.Value;
                }
                else
                {
                    file1 = "~/Files/" + FileUpload1.FileName;
                    FileUpload1.SaveAs(Server.MapPath("~/Files/" + FileUpload1.FileName));
                }
                if (lbl_point1.Text != "0" && lbl_point2.Text != "0" && lbl_point3.Text != "0" && lbl_point4.Text != "0" && lbl_point5.Text != "0" || txtOther.Value != "" || FileUpload1.HasFile == true)
                {
                    if (lbl_point1.Text != "0" && lbl_point2.Text != "0" && lbl_point3.Text != "0" && lbl_point4.Text != "0" && lbl_point5.Text != "0")
                    {
                        if (lbl_point1.Text != "3")
                        {
                            if (txtRemark1.Value == "")
                            {
                                count1 = 1;
                                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark 1');", true);
                            }

                        }
                        if (lbl_point2.Text != "3")
                        {
                            if (txtRemark2.Value == "")
                            {
                                count2 = 1;
                                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark 2');", true);
                            }
                        }
                        if (lbl_point3.Text != "3")
                        {
                            if (txtRemark3.Value == "")
                            {
                                count3 = 1;
                                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark 3');", true);
                            }
                        }
                        if (lbl_point4.Text != "3")
                        {
                            if (txtRemark4.Value == "")
                            {
                                count4 = 1;
                                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark 4');", true);
                            }
                        }
                        if (lbl_point5.Text != "3")
                        {
                            if (txtRemark5.Value == "")
                            {
                                count5 = 1;
                                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark 5');", true);
                            }
                        }
                    }
                    if (count1 == 0 && count2 == 0 && count3 == 0 && count4 == 0 && count5 == 0)
                    {

                        if (new DataManager().InsertUpdateEmployeeAppraisal(Convert.ToInt32(lblId.Text), 1, lbl_point1.Text, txtRemark1.Value.ToString(), lbl_point2.Text, txtRemark2.Value.ToString(), lbl_point3.Text, txtRemark3.Value.ToString(), lbl_point4.Text, txtRemark4.Value.ToString(), lbl_point5.Text, txtRemark5.Value.ToString(), Convert.ToInt32(ddlEmployee.SelectedValue), Convert.ToInt32(Session["EmployeeId"]), txtDesignation.Value.ToString(), txtOther.Value.ToString(), file1,0) > 0)
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
                        ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark );", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Any One, All Rating || Other || FileUpload ');", true);
                }

            }
            else if (btnsubmit.Text == "Back")
            {
                Clear();
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                string file1 = string.Empty;
                if (!FileUpload1.HasFile)
                {
                    file1 = "~/Files/na.pdf";

                }
                else
                {

                    file1 = "~/Files/" + FileUpload1.FileName;
                    FileUpload1.SaveAs(Server.MapPath("~/Files/" + FileUpload1.FileName));

                }
                if (lbl_point1.Text != "0" && lbl_point2.Text != "0" && lbl_point3.Text != "0" && lbl_point4.Text != "0" && lbl_point5.Text != "0" || txtOther.Value != "" || FileUpload1.HasFile == true)
                {
                    if (lbl_point1.Text != "0" && lbl_point2.Text != "0" && lbl_point3.Text != "0" && lbl_point4.Text != "0" && lbl_point5.Text != "0")
                    {
                        if (lbl_point1.Text != "3")
                        {
                            if (txtRemark1.Value == "")
                            {
                                count1 = 1;
                                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark 1');", true);
                            }

                        }
                        if (lbl_point2.Text != "3")
                        {
                            if (txtRemark2.Value == "")
                            {
                                count2 = 1;
                                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark 2');", true);
                            }
                        }
                        if (lbl_point3.Text != "3")
                        {
                            if (txtRemark3.Value == "")
                            {
                                count3 = 1;
                                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark 3');", true);
                            }
                        }
                        if (lbl_point4.Text != "3")
                        {
                            if (txtRemark4.Value == "")
                            {
                                count4 = 1;
                                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark 4');", true);
                            }
                        }
                        if (lbl_point5.Text != "3")
                        {
                            if (txtRemark5.Value == "")
                            {
                                count5 = 1;
                                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark 5');", true);
                            }
                        }
                    }
                    if (count1 == 0 && count2 == 0 && count3 == 0 && count4 == 0 && count5 == 0)
                    {
                        if (new DataManager().checkEmployeeAppraisal(Convert.ToInt32(ddlEmployee.SelectedValue), Convert.ToInt32(Session["EmployeeId"]), Convert.ToDateTime(txtFrom.Value),Convert.ToDateTime(txtTo.Value)) == 1)
                        {
                            int AppraisalId;
                            DataTable dt1 = new DataManager().SelectAppraisalMaxId();
                            if (dt1.Rows.Count > 0)
                            {
                                AppraisalId = Convert.ToInt32(dt1.Rows[0]["id"]);
                            }
                            else
                            {
                                AppraisalId = 0;
                            }

                            if (new DataManager().InsertUpdateEmployeeAppraisal(0, 0, lbl_point1.Text, txtRemark1.Value.ToString(), lbl_point2.Text, txtRemark2.Value.ToString(), lbl_point3.Text, txtRemark3.Value.ToString(), lbl_point4.Text, txtRemark4.Value.ToString(), lbl_point5.Text, txtRemark5.Value.ToString(), Convert.ToInt32(ddlEmployee.SelectedValue), Convert.ToInt32(Session["EmployeeId"]), txtDesignation.Value.ToString(), txtOther.Value.ToString(), file1, AppraisalId) > 0)
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
                            ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Already Apply   ...!!!!');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Remark );", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Fill Any One, All Rating || Other || FileUpload ');", true);
                }
            }
        }

        private void SearchText()
        {
            DataTable dt = new DataManager().SelectEmployeeAppraisalbyLevels(Convert.ToInt32(txtLevel.Value));
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

        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
                    if (ddlEmployee.SelectedIndex > 0)
                    {
                         DataTable dt5 = new DataManager().SelectAppraisalMaxId();
                    if (dt5.Rows.Count > 0)
                    {
                        string Max = dt5.Rows[0]["id"].ToString();

                        DataTable dt2 = new DataManager().SelectAppraisal(Convert.ToInt32(Max));
                        if (dt2.Rows.Count > 0)
                        {
                            DateTime today = Convert.ToDateTime(DateTime.Today);
                            DateTime from = Convert.ToDateTime(dt2.Rows[0]["From_date"]);
                            txtFrom.Value = from.ToString();
                            DateTime To = Convert.ToDateTime(dt2.Rows[0]["To_date"]);
                            txtTo.Value = To.ToString();
                    
                        }
               
                    }
           

                }
                DataTable dt = new DataManager().SelectEmployeeAppraisalbyEmployeeIdAndDate(Convert.ToInt32(ddlEmployee.SelectedValue), Convert.ToDateTime(txtFrom.Value), Convert.ToDateTime(txtTo.Value));
                if (dt.Rows.Count != 0)
                {
                    btnsubmit.Enabled = true;
                    lbl_point_emp1.Text = dt.Rows[0]["Rating1"].ToString();
                    Rating6.CurrentRating = Convert.ToInt32(lbl_point_emp1.Text);
                    txtRemark_Emp1.Value = dt.Rows[0]["Remark1"].ToString();

                    lbl_point_emp2.Text = dt.Rows[0]["Rating2"].ToString();
                    Rating7.CurrentRating = Convert.ToInt32(lbl_point_emp2.Text);
                    txtRemark_Emp2.Value = dt.Rows[0]["Remark2"].ToString();

                    lbl_point_emp3.Text = dt.Rows[0]["Rating3"].ToString();
                    Rating8.CurrentRating = Convert.ToInt32(lbl_point_emp3.Text);
                    txtRemark_Emp3.Value = dt.Rows[0]["Remark3"].ToString();

                    lbl_point_emp4.Text = dt.Rows[0]["Rating4"].ToString();
                    Rating9.CurrentRating = Convert.ToInt32(lbl_point_emp4.Text);
                    txtRemark_Emp4.Value = dt.Rows[0]["Remark4"].ToString();

                    lbl_point_emp5.Text = dt.Rows[0]["Rating5"].ToString();
                    Rating10.CurrentRating = Convert.ToInt32(lbl_point_emp5.Text);
                    txtRemark_Emp5.Value = dt.Rows[0]["Remark5"].ToString();

                    txtOther_Emp.Value = dt.Rows[0]["Other"].ToString();

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Fill Appraisal by Employee After Manager Fill');", true);
                    btnsubmit.Enabled = false;
                    txtRemark_Emp1.Value = "";
                    txtRemark_Emp2.Value = "";
                    txtRemark_Emp3.Value = "";
                    txtRemark_Emp4.Value = "";
                    txtRemark_Emp5.Value = "";
                    lbl_point_emp1.Text = "0";
                    lbl_point_emp2.Text = "0";
                    lbl_point_emp3.Text = "0";
                    lbl_point_emp4.Text = "0";
                    lbl_point_emp5.Text = "0";
                    Rating6.CurrentRating = 0;
                    Rating7.CurrentRating = 0;
                    Rating8.CurrentRating = 0;
                    Rating9.CurrentRating = 0;
                    Rating10.CurrentRating = 0;
                    txtOther_Emp.Value = "";
                   
                }
            
        }
    }
}