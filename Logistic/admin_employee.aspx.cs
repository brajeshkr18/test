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
    public partial class admin_employee : System.Web.UI.Page
    {
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 1;
                BindDataList();
                fillgrid();
            }
        }
        public void Clear()
        {
            fillgrid(); ;
            ddlStatus.SelectedIndex = 0;
            txtEmail.Value = "";
            txtMobile.Value = "";
            txtName.Value = "";
            txtpassword.Value = "";
            txtAddress.Value = "";
            txtCity.Value = "";
            txtState.Value = "";
            txtUserId.Value = "";
            ddlDesignation.SelectedIndex = 0;
            ddlLevels.SelectedIndex = 0;
            chkAll.Checked = false;
            ddlLoadRequest_role.SelectedIndex = 0;
            ddlVehicleRequest_role.SelectedIndex = 0;
            ddlDeliveryPerforma_role.SelectedIndex = 0;
            ddlAskForVehicle_role.SelectedIndex = 0;
            ddlBill_role.SelectedIndex = 0;
            ddlConsignement.SelectedIndex = 0;

        }
        public void BindDataList()
        {
            DataTable data = new DataManager().SelectEmployee(0);
            if (data.Rows.Count != 0)
            {
                gridPoll.DataSource = Session["gridEmployee"] = data;
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
            gridPoll.DataSource = Session["gridEmployee"];
            gridPoll.DataBind();
        }
        protected void gridPoll_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                DataTable dt = new DataManager().SelectEmployee(id);
                if (dt.Rows.Count != 0)
                {
                    MultiView1.ActiveViewIndex = 0;
                    btnsubmit.Text = "Update";
                    txtEmail.Value = dt.Rows[0]["Email"].ToString();
                    txtUserId.Value = dt.Rows[0]["UserId"].ToString();
                    txtpassword.Value = dt.Rows[0]["Password"].ToString();
                    txtName.Value = dt.Rows[0]["EmployeeName"].ToString();
                    txtMobile.Value = dt.Rows[0]["Mobile"].ToString();
                    txtCity.Value = dt.Rows[0]["City"].ToString();
                    txtState.Value = dt.Rows[0]["State"].ToString();
                    txtAddress.Value = dt.Rows[0]["Address"].ToString();
                    ddlStatus.SelectedValue = dt.Rows[0]["role"].ToString();
                    ddlDesignation.SelectedValue = dt.Rows[0]["Designation"].ToString();
                    ddlLevels.SelectedValue = dt.Rows[0]["levels"].ToString();
                    ddlLoadRequest_role.SelectedValue = dt.Rows[0]["Load_request_role"].ToString();
                    ddlVehicleRequest_role.SelectedValue = dt.Rows[0]["Vehicle_request_role"].ToString();
                    ddlAskForVehicle_role.SelectedValue = dt.Rows[0]["ask_for_vehicle_role"].ToString();
                    ddlConsignement.SelectedValue = dt.Rows[0]["Consignement_role"].ToString();
                    ddlBill_role.SelectedValue = dt.Rows[0]["Bill_role"].ToString();
                    ddlDeliveryPerforma_role.SelectedValue = dt.Rows[0]["Delivery_Performa_role"].ToString();
                    lblId.Text = dt.Rows[0]["Id"].ToString();
                    FillGrid1();
                    FillGrid2();
                }

            }
            else if (e.CommandName == "Delete1")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                new DataManager().DeleteEmployeeCircleByEmployeeId(id);
                new DataManager().DeleteEmployeeDeptByEmployeeId(id);
                new DataManager().DeleteEmployee(id);
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

                if (new DataManager().InsertUpdateEmployee(Convert.ToInt32(lblId.Text), 1, txtName.Value.ToString(), txtMobile.Value.ToString(), txtEmail.Value.ToString(), txtCity.Value.ToString(), txtState.Value.ToString(), txtAddress.Value.ToString(), txtpassword.Value.ToString(), ddlStatus.SelectedValue.ToString(), ddlDesignation.SelectedValue.ToString(), ddlLevels.SelectedValue.ToString(),txtUserId.Value.ToString(),ddlLoadRequest_role.SelectedValue,ddlVehicleRequest_role.SelectedValue,ddlAskForVehicle_role.SelectedValue,ddlConsignement.SelectedValue,ddlBill_role.SelectedValue,ddlDeliveryPerforma_role.SelectedValue) > 0)
                {
                    foreach (GridViewRow r in GridViewImage.Rows)
                    {
                        Label Label1 = (Label)r.FindControl("Label1");
                        int Id = Convert.ToInt32(Label1.Text);
                        if (Id == 0)
                        {
                            Label Label2 = (Label)r.FindControl("Label2");
                            string Name = Label2.Text;
                         
                            new DataManager().InsertEmployeeCircle(0, Name, Convert.ToInt32(lblId.Text));
                        }
                    }
                    foreach (GridViewRow r in GridView2.Rows)
                    {
                        Label Label1 = (Label)r.FindControl("Label1");
                        int Id = Convert.ToInt32(Label1.Text);
                        if (Id == 0)
                        {
                            Label Label2 = (Label)r.FindControl("Label2");
                            string Name = Label2.Text;
                            Label Label3 = (Label)r.FindControl("Label3");
                            string sub = Label3.Text;
                            new DataManager().InsertEmployeeDept(0, Name,sub, Convert.ToInt32(lblId.Text));
                        }
                    }
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
                if (new DataManager().checkEmployee(txtMobile.Value.ToString(), txtEmail.Value.ToString()) == 1)
                {
                    if (new DataManager().InsertUpdateEmployee(0, 0, txtName.Value.ToString(), txtMobile.Value.ToString(), txtEmail.Value.ToString(), txtCity.Value.ToString(), txtState.Value.ToString(), txtAddress.Value.ToString(), txtpassword.Value.ToString(), ddlStatus.SelectedValue.ToString(), ddlDesignation.SelectedValue.ToString(), ddlLevels.SelectedValue.ToString(), txtUserId.Value.ToString(),ddlLoadRequest_role.SelectedValue,ddlVehicleRequest_role.SelectedValue,ddlAskForVehicle_role.SelectedValue,ddlConsignement.SelectedValue,ddlBill_role.SelectedValue,ddlDeliveryPerforma_role.SelectedValue) > 0)
                    {
                        DataTable dt = new DataManager().SelectEmployeeMaxId();
                        string Max = dt.Rows[0]["id"].ToString();
                        foreach (GridViewRow r in GridViewImage.Rows)
                        {
                            Label Label2 = (Label)r.FindControl("Label2");
                            string Name = Label2.Text;
                           

                            new DataManager().InsertEmployeeCircle(0, Name,Convert.ToInt32(Max));
                        }
                        foreach (GridViewRow r in GridView2.Rows)
                        {
                            Label Label2 = (Label)r.FindControl("Label2");
                            string Name = Label2.Text;
                            Label Label3 = (Label)r.FindControl("Label3");
                            string sub = Label3.Text;

                            new DataManager().InsertEmployeeDept(0, Name,sub, Convert.ToInt32(Max));
                        }
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
            DataTable dt = new DataManager().SelectEmployee(0);
            DataView dv = new DataView(dt);
            string SearchExpression = null;
            if (!String.IsNullOrEmpty(txtSearch.Text))
            {
                SearchExpression = string.Format("{0} '%{1}%'",
                gridPoll.SortExpression, txtSearch.Text);


            }
            dv.RowFilter = "EmployeeName LIKE " + SearchExpression + " OR Email LIKE " + SearchExpression + " OR Mobile like" + SearchExpression + "OR City like" + SearchExpression + "";

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
            Response.AddHeader("content-disposition", "attachment;filename=EmployeeExport.xls");
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

        public void fillgrid()
        {
            gridVIEWCity();
            dt2.Clear();
            dt3.Clear();
            GridViewImage.DataSource = dt2;
            GridViewImage.DataBind();
            Session["dt1InImage"] = dt2;

            GridView2.DataSource = dt3;
            GridView2.DataBind();
            Session["dt1InDept"] = dt3;
        }
        private void gridVIEWCity()
        {
            dt2.Columns.Add("Id", typeof(int));
            dt2.Columns.Add("Name", typeof(string));

            dt3.Columns.Add("Id", typeof(int));
            dt3.Columns.Add("Departement", typeof(string));
            dt3.Columns.Add("SubDivision", typeof(string));
        }
        protected void btnImage_Click(object sender, EventArgs e)
        {
            if (chkAll.Checked == true)
            {
               
                    foreach (ListItem ltItem in ddlCity.Items)
                    {
                        if (Session["dt1InImage"] != null)
                            dt2 = (DataTable)Session["dt1InImage"];
                        DataRow dr = dt2.NewRow();

                        dr["Id"] = 0;
                        dr["Name"] = ltItem.Value;
                        dt2.Rows.Add(dr);
                        Session["dt1InImage"] = dt2;
                        GridViewImage.DataSource = dt2;
                        GridViewImage.DataBind();

                    }
            }
            else
            {
                if (ddlCity.SelectedIndex > 0)
                {
                    if (Session["dt1InImage"] != null)
                        dt2 = (DataTable)Session["dt1InImage"];
                    DataRow dr = dt2.NewRow();
                    dr["Id"] = 0;
                    dr["Name"] = ddlCity.SelectedValue.ToString();

                    dt2.Rows.Add(dr);
                    Session["dt1InImage"] = dt2;
                    GridViewImage.DataSource = dt2;
                    GridViewImage.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please select Name Of Circle');", true);
                }
            }
          
        }
        public void FillGrid1()
        {
            fillgrid();
            DataTable data = new DataManager().SelectEmployeeCirclebyEmployeeId(Convert.ToInt32(lblId.Text));
            if (data.Rows.Count != 0)
            {
                for (int i = 0; i < data.Rows.Count; i++)
                {
                    DataRow dr = dt2.NewRow();

                    dr["Id"] = data.Rows[i]["Id"].ToString();
                    dr["Name"] = data.Rows[i]["CircleName"].ToString();
                   
                    dt2.Rows.Add(dr);
                    Session["dt1InImage"] = dt2;
                    GridViewImage.DataSource = dt2;
                    GridViewImage.DataBind();

                }

            }
            else
            {
                DataTable dt0 = new DataTable();
                GridViewImage.DataSource = dt0;
                GridViewImage.DataBind();
            }
        }
        protected void MyButtonClick(object sender, System.EventArgs e)
        {

            ImageButton btn = (ImageButton)sender;
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int rowIndex = gvRow.RowIndex;
            if (Session["dt1InImage"] != null)
            {
                Label Label1 = (Label)gvRow.FindControl("Label1");
                int Id = Convert.ToInt32(Label1.Text);
                if (Id != 0)
                {
                    new DataManager().DeleteEmployeeCircle(Id);
                }

                DataTable dt = (DataTable)Session["dt1InImage"];
                DataRow drCurrentRow = null;
                if (dt.Rows.Count > 0)
                {

                    dt.Rows.Remove(dt.Rows[rowIndex]);
                    drCurrentRow = dt.NewRow();
                    Session["dt1InImage"] = dt;
                    GridViewImage.DataSource = dt;
                    GridViewImage.DataBind();

                }
            }
        }

        protected void ddlDepartement_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubDivision.Items.Clear();
            ddlSubDivision.Items.Add("Select Sub Division");
            if (ddlDepartement.SelectedValue == "Warehouse Operation - Capex")
            {
                
                ddlSubDivision.Items.Add("Over All Operations");
                ddlSubDivision.Items.Add("Inward - Fresh");
                ddlSubDivision.Items.Add("Inward - SRN");
                ddlSubDivision.Items.Add("Outward -Fresh");
                ddlSubDivision.Items.Add("Outward -SRN");
                ddlSubDivision.Items.Add("R&R");
                ddlSubDivision.Items.Add("MBRC");
                ddlSubDivision.Items.Add("Kitting");
                ddlSubDivision.Items.Add("Labour");
                ddlSubDivision.Items.Add("Bin Cards");
                ddlSubDivision.Items.Add("Stickering");
                ddlSubDivision.Items.Add("Stacking");
                ddlSubDivision.Items.Add("Physical Verification");
                ddlSubDivision.Items.Add("Other activities");
              
            }
            if (ddlDepartement.SelectedValue == "Warehouse Operation - Opex")
            {
                ddlSubDivision.Items.Add("Over All Operations");
                ddlSubDivision.Items.Add("Sim packing");
                ddlSubDivision.Items.Add("Packing Supervisor");
                ddlSubDivision.Items.Add("SIM Dispatch");
                ddlSubDivision.Items.Add("RCV Dispatch");
                ddlSubDivision.Items.Add("POP Dispatch");
                ddlSubDivision.Items.Add("SIM Receipt");
                ddlSubDivision.Items.Add("RCV Receipt");
                ddlSubDivision.Items.Add("POP Receipt");
                ddlSubDivision.Items.Add("Gift -Receipt/ Dispatch");
                ddlSubDivision.Items.Add("Hand Set");
                ddlSubDivision.Items.Add("Bin Cards");
                ddlSubDivision.Items.Add("Stickering");
                ddlSubDivision.Items.Add("Stacking");
                ddlSubDivision.Items.Add("Physical Verification");
                ddlSubDivision.Items.Add("Other activities");
            }
            if (ddlDepartement.SelectedValue == "EDP")
            {
                ddlSubDivision.Items.Add("Over All Operations");
                ddlSubDivision.Items.Add("MIS - HEAD");
                ddlSubDivision.Items.Add("MIS");
                ddlSubDivision.Items.Add("GRN / MRN");
                ddlSubDivision.Items.Add("Outward");
                ddlSubDivision.Items.Add("SRN Receipt");
                ddlSubDivision.Items.Add("Scrap Entries");
                ddlSubDivision.Items.Add("Reconciliation");
                ddlSubDivision.Items.Add("Optimiser -Inward");
                ddlSubDivision.Items.Add("Optimiser -Outward");
                ddlSubDivision.Items.Add("Bucket Transfer");
                ddlSubDivision.Items.Add("R&R");
                ddlSubDivision.Items.Add("Other activities");
               
            }
            if (ddlDepartement.SelectedValue == "Logistic")
            {
                ddlSubDivision.Items.Add("Over All Operations");
                ddlSubDivision.Items.Add("Documentation");
                ddlSubDivision.Items.Add("Certification");
                ddlSubDivision.Items.Add("Other activities");
                ddlSubDivision.Items.Add("Route Planning");
                ddlSubDivision.Items.Add("LR Management");
                ddlSubDivision.Items.Add("Billing");
                ddlSubDivision.Items.Add("Other activities");
            }
            if (ddlDepartement.SelectedValue == "FINANCE")
            {
                ddlSubDivision.Items.Add("Over All Operations");
                ddlSubDivision.Items.Add("Vehicle Tracking");
                ddlSubDivision.Items.Add("Client PR");
                ddlSubDivision.Items.Add("Other activities");
                ddlSubDivision.Items.Add("Expenses Vouching");
                ddlSubDivision.Items.Add("Invoicing");
                ddlSubDivision.Items.Add("Tally");
                ddlSubDivision.Items.Add("Vendor Reconciliation");
                ddlSubDivision.Items.Add("Client Reconciliation");
                ddlSubDivision.Items.Add("Vendor Payment");
                ddlSubDivision.Items.Add("B/S & P&L");
                ddlSubDivision.Items.Add("Returns");
                ddlSubDivision.Items.Add("Other Statutory");
                ddlSubDivision.Items.Add("Other activities");
             
            }
            if (ddlDepartement.SelectedValue == "HR")
            {
                ddlSubDivision.Items.Add("Over All Operations");
                ddlSubDivision.Items.Add("Salary Disbursal");
                ddlSubDivision.Items.Add("PF/ESI deduction and deposit");
                ddlSubDivision.Items.Add("Compliances");
                ddlSubDivision.Items.Add("Returns");
                ddlSubDivision.Items.Add("Offer / Appointment");
                ddlSubDivision.Items.Add("Interviews");
                ddlSubDivision.Items.Add("Motivational activites");
                ddlSubDivision.Items.Add("F&F");
                ddlSubDivision.Items.Add("I Cards");
                ddlSubDivision.Items.Add("Personal files");
                ddlSubDivision.Items.Add("Appraisals");
                ddlSubDivision.Items.Add("Tranings");
                ddlSubDivision.Items.Add("Other Statutory");
                ddlSubDivision.Items.Add("Other activities");
            }
            if (ddlDepartement.SelectedValue == "Marketing")
            {
                ddlSubDivision.Items.Add("Over All Operations");
                ddlSubDivision.Items.Add("Client Liasion");
                ddlSubDivision.Items.Add("New Clients");
                ddlSubDivision.Items.Add("RFP");
                ddlSubDivision.Items.Add("Other activities");
               
            }
            if (ddlDepartement.SelectedValue == "Administration")
            {
                ddlSubDivision.Items.Add("Over All Operations");
                ddlSubDivision.Items.Add("Bookings");
                ddlSubDivision.Items.Add("Printing");
                ddlSubDivision.Items.Add("Billing");
                ddlSubDivision.Items.Add("Arrangements");
                ddlSubDivision.Items.Add("Housekeeping");
                ddlSubDivision.Items.Add("Other activities");
            }
            if (ddlDepartement.SelectedValue == "Purchase")
            {
                ddlSubDivision.Items.Add("Over All Operations");
                ddlSubDivision.Items.Add("Quotation collection");
                ddlSubDivision.Items.Add("Comparatives");
                ddlSubDivision.Items.Add("Negotiations");
                ddlSubDivision.Items.Add("PO");
                ddlSubDivision.Items.Add("Vendor Payment");
                ddlSubDivision.Items.Add("Deliveries");
                ddlSubDivision.Items.Add("Other activities");
            }
            if (ddlDepartement.SelectedValue == "Support")
            {
                ddlSubDivision.Items.Add("Over All Operations");
                ddlSubDivision.Items.Add("Analysis");
                ddlSubDivision.Items.Add("Reporting");
                ddlSubDivision.Items.Add("Data back up");
                ddlSubDivision.Items.Add("Comparatives");
                ddlSubDivision.Items.Add("Value additions");
                ddlSubDivision.Items.Add("Bill Checking");
                ddlSubDivision.Items.Add("Billing Data");
                ddlSubDivision.Items.Add("Other activities");
            }
        }
        protected void btnImage1_Click(object sender, EventArgs e)
        {

            if (ddlDepartement.SelectedIndex > 0 && 0< ddlSubDivision.SelectedIndex)
                {
                    if (Session["dt1InDept"] != null)
                        dt3 = (DataTable)Session["dt1InDept"];
                    DataRow dr = dt3.NewRow();
                    dr["Id"] = 0;
                    dr["Departement"] = ddlDepartement.SelectedValue.ToString();
                    dr["SubDivision"] = ddlSubDivision.SelectedValue.ToString();
                    dt3.Rows.Add(dr);
                    Session["dt1InDept"] = dt3;
                    GridView2.DataSource = dt3;
                    GridView2.DataBind();
                    ddlSubDivision.SelectedIndex = 0;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Please select Departement & SubDivision');", true);
                }
          

        }
        public void FillGrid2()
        {
           
            DataTable data = new DataManager().SelectEmployeeDeptbyEmployeeId(Convert.ToInt32(lblId.Text));
            if (data.Rows.Count != 0)
            {
                for (int i = 0; i < data.Rows.Count; i++)
                {
                    DataRow dr = dt3.NewRow();

                    dr["Id"] = data.Rows[i]["Id"].ToString();
                    dr["Departement"] = data.Rows[i]["Departement"].ToString();
                    dr["SubDivision"] = data.Rows[i]["SubDivision"].ToString();

                    dt3.Rows.Add(dr);
                    Session["dt1InDept"] = dt3;
                    GridView2.DataSource = dt3;
                    GridView2.DataBind();

                }

            }
            else
            {
                DataTable dt0 = new DataTable();
                GridView2.DataSource = dt0;
                GridView2.DataBind();
            }
        }
        protected void MyButtonClick1(object sender, System.EventArgs e)
        {

            ImageButton btn = (ImageButton)sender;
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int rowIndex = gvRow.RowIndex;
            if (Session["dt1InDept"] != null)
            {
                Label Label1 = (Label)gvRow.FindControl("Label1");
                int Id = Convert.ToInt32(Label1.Text);
                if (Id != 0)
                {
                    new DataManager().DeleteEmployeeDept(Id);
                }

                DataTable dt = (DataTable)Session["dt1InDept"];
                DataRow drCurrentRow = null;
                if (dt.Rows.Count > 0)
                {

                    dt.Rows.Remove(dt.Rows[rowIndex]);
                    drCurrentRow = dt.NewRow();
                    Session["dt1InDept"] = dt;
                    GridView2.DataSource = dt;
                    GridView2.DataBind();

                }
            }
        }
    }
}