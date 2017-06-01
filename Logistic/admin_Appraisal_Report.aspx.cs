using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Drawing;

namespace Logistic
{
    public partial class admin_Appraisal_Report : System.Web.UI.Page
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
            
            DataTable dt3 = new DataManager().SelectAppraisal(0);
            if (dt3.Rows.Count != 0)
            {
                ddlAppraisal.DataSource = dt3;
                ddlAppraisal.DataTextField = "Title";
                ddlAppraisal.DataValueField = "Id";
                ddlAppraisal.DataBind();
                ddlAppraisal.Items.Insert(0, new ListItem("--Select Appraisal--", "0"));



            }
            else
            {
                DataTable dt1 = new DataTable();
                ddlAppraisal.DataSource = dt1;
                ddlAppraisal.DataBind();
                ddlAppraisal.Items.Insert(0, new ListItem("--No Appraisal--", "0"));


            }
            


        }
        protected void lnkSearch_Click(object sender, EventArgs e)
        {
            if (ddlAppraisal.SelectedIndex > 0)
            {
                DateTime from;
                DateTime To;
                DataTable dt2 = new DataManager().SelectAppraisal(Convert.ToInt32(ddlAppraisal.SelectedValue));

                from = Convert.ToDateTime(dt2.Rows[0]["From_date"]);
                To = Convert.ToDateTime(dt2.Rows[0]["To_date"]);

                DataTable dt = new DataManager().SelectAppraisalReport(Convert.ToInt32(ddlAppraisal.SelectedValue), from, To);
                if (dt.Rows.Count > 0)
                {
                    gridState.DataSource = dt;
                    gridState.DataBind();
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    btnExport.Enabled = true;
                }
                else
                {
                    DataTable dt0 = new DataTable();
                    gridState.DataSource = dt0;
                    gridState.DataBind();
                    GridView1.DataSource = dt0;
                    GridView1.DataBind();
                    btnExport.Enabled = false;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please Select Appraisal...!!!!');", true);
                DataTable dt0 = new DataTable();
                gridState.DataSource = dt0;
                gridState.DataBind();
                GridView1.DataSource = dt0;
                GridView1.DataBind();
              
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
            Response.AddHeader("content-disposition", "attachment;filename=AppraisalReport.xls");
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