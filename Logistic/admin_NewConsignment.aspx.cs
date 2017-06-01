using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using System.Net;
using SendMailClass;
using ExcelUtility;
using SendSMSClass;

namespace Logistic
{
    public partial class admin_NewConsignment : System.Web.UI.Page
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
            txtDate.Value = "";
            txtConsignementID.Value = "";
            ddlConsigner.SelectedIndex = 0;
            txtConsignee2.Value = "";
            txtAddress1.Value = "";
            txtAddress2.Value = "";
            txtAdvanceFreight.Value = "0.0";
            txtContact1.Value = "";
            txtContact2.Value = "";
            txtContactNumber1.Value = "";
            txtContactNumber2.Value = "";
            txtContactNumber3.Value = "";
            txtContactNumber4.Value = "";
            txtContactNumber5.Value = "";
            txtDateOfDeliver.Value = "";
            txtDateOfLoading.Value = "";
            txtExtraAmount.Value = "0.0";
            txtFreightAmount.Value = "0.0";
            txtLoading.Value = "0.0";
            txtLR.Value = "";
            txtMaterialType.Value = "";
            txtOthers.Value = "0.0";
            txtRemark.Value = "";
            txtSRNNo.Value = "";
            txtTotalAmount.Value = "0.0";
            txtUnloading.Value = "0.0";
            txtWayBill1.Value = "";
            txtWayBill2.Value = "";
            txtWayBill3.Value = "";
            txtWayBill4.Value = "";
            ddlStatus.SelectedIndex = 0;
            ddlCity.SelectedIndex = 0;
            txtVehicleNo.Value = "";
            ddlType.SelectedIndex = 0;
            ddlWeight.SelectedIndex = 0;
            txtMinNo.Value = "";
            txtOGP.Value = "";
            txtBlank1.Value = "";
            txtBlank2.Value = "";
          
        }
        public void BindDataList()
        {
            DataTable data = new DataManager().SelectConsignment1(0);
            if (data.Rows.Count != 0)
            {
                gridState.DataSource = Session["gridConsignment"] = data;
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
        }
        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            
            btnsubmit.Text = "Submit";
            Clear();
            MultiView1.ActiveViewIndex = 0;

            DataTable dt1 = new DataManager().SelectConsignmentMaxConsignementID();
            if (dt1.Rows.Count > 0)
            {
                txtConsignementID.Value = dt1.Rows[0]["ConsignementID"].ToString();
                if (txtConsignementID.Value == "")
                {
                    txtConsignementID.Value = "CL/000000";
                }
            }
            else
            {
                txtConsignementID.Value = "CL/000001";
            }
            var str = txtConsignementID.Value;
            var tempArray = str.Split('/');
            string tempId = tempArray[1];
            int id = Convert.ToInt32(tempId);
            id = id + 1;
            string autoId = "CL/" + String.Format("{0:000000}", id);
            txtConsignementID.Value = autoId;


            //DataTable dt2 = new DataManager().SelectConsignmentMaxSRNNo();
            //if (dt2.Rows.Count > 0)
            //{
            //    txtSRNNo.Value = dt2.Rows[0]["SRNNo"].ToString();
            //    if (txtSRNNo.Value == "")
            //    {
            //        txtSRNNo.Value = "SRN/000000";
            //    }
            //}
            //else
            //{
            //    txtSRNNo.Value = "SRN/000001";
            //}
            //var str1 = txtSRNNo.Value;
            //var tempArray1 = str1.Split('/');
            //string tempId1 = tempArray1[1];
            //int id1 = Convert.ToInt32(tempId1);
            //id1 = id1 + 1;
            //string autoId1 = "SRN/" + String.Format("{0:000000}", id);
            //txtSRNNo.Value = autoId1;
        }
        protected void gridState_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridState.PageIndex = e.NewPageIndex;
            gridState.DataSource = Session["gridConsignment"];
            gridState.DataBind();
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
                    btnsubmit.Text = "Update";
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
                    txtWayBill1.Value = dt.Rows[0]["WayBill1"].ToString();
                    txtWayBill2.Value = dt.Rows[0]["WayBill2"].ToString();
                    txtWayBill3.Value = dt.Rows[0]["WayBill3"].ToString();
                    txtWayBill4.Value = dt.Rows[0]["WayBill4"].ToString();
                    txtDateOfLoading.Value = dt.Rows[0]["DateofLoading"].ToString();
                    txtDateOfDeliver.Value = dt.Rows[0]["DateofDeliver"].ToString();
                    txtFreightAmount.Value = dt.Rows[0]["FreightAmount"].ToString();
                    txtAdvanceFreight.Value = dt.Rows[0]["AdvanceFreight"].ToString();
                    txtLoading.Value = dt.Rows[0]["Loading"].ToString();
                    txtUnloading.Value = dt.Rows[0]["Unloading"].ToString();
                    txtOthers.Value = dt.Rows[0]["Others"].ToString();
                    txtExtraAmount.Value = dt.Rows[0]["ExtraAmount"].ToString();
                    txtTotalAmount.Value = dt.Rows[0]["TotalAmount"].ToString();
                    txtContactNumber1.Value = dt.Rows[0]["ContactNo1"].ToString();
                    txtContactNumber2.Value = dt.Rows[0]["ContactNo2"].ToString();
                    txtContactNumber3.Value = dt.Rows[0]["ContactNo3"].ToString();
                    txtContactNumber4.Value = dt.Rows[0]["ContactNo4"].ToString();
                    txtContactNumber5.Value = dt.Rows[0]["ContactNo5"].ToString();
                    ddlStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
                    ddlCity.SelectedValue = dt.Rows[0]["Circle"].ToString();

                    txtVehicleNo.Value = dt.Rows[0]["VehicleNo"].ToString();
                    //ddlType.SelectedValue = dt.Rows[0]["VehicleTypeId"].ToString();
                    ddlWeight.SelectedValue = dt.Rows[0]["Weight"].ToString();
                    txtMinNo.Value = dt.Rows[0]["MINno"].ToString();
                    txtOGP.Value = dt.Rows[0]["OGPno"].ToString();
                    txtBlank1.Value = dt.Rows[0]["Blank1"].ToString();
                    txtBlank2.Value = dt.Rows[0]["Blank2"].ToString();
                    lblId.Text = dt.Rows[0]["Id"].ToString();
                }

            }
            else if (e.CommandName == "Delete1")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                new DataManager().DeleteConsignment(id);
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
                //var consingmenid = txtConsignementID.Value;
                //Mailer sendsms = new Mailer();
                //sendsms.SendSMS(txtContact1.Value+ ',' + txtContact2.Value + ',' + txtContactNumber1.Value + ',' + txtContactNumber2.Value
                //    + ',' + txtContactNumber3.Value + ',' + txtContactNumber4.Value + ',' + txtContactNumber5.Value, "new consigment created with consigment id="
                //    +consingmenid);
                


                if (new DataManager().InsertUpdateConsignment(Convert.ToInt32(lblId.Text), 1, txtConsignementID.Value, txtDate.Value.ToString(), 
                    txtSRNNo.Value, Convert.ToInt32(ddlConsigner.SelectedValue), txtAddress1.Value, txtContact1.Value, txtConsignee2.Value, 
                    txtAddress2.Value, txtContact2.Value, txtLR.Value, txtMaterialType.Value, txtRemark.Value, txtWayBill1.Value, txtWayBill2.Value,
                    txtWayBill3.Value, txtWayBill4.Value, txtDateOfLoading.Value.ToString(), txtDateOfDeliver.Value.ToString(),
                    Convert.ToDecimal(txtFreightAmount.Value), Convert.ToDecimal(txtAdvanceFreight.Value), Convert.ToDecimal(txtLoading.Value), 
                    Convert.ToDecimal(txtUnloading.Value), Convert.ToDecimal(txtOthers.Value), Convert.ToDecimal(txtExtraAmount.Value),
                    Convert.ToDecimal(txtTotalAmount.Value), txtContactNumber1.Value, txtContactNumber2.Value, txtContactNumber3.Value,
                    txtContactNumber4.Value, txtContactNumber5.Value, ddlStatus.SelectedValue,ddlCity.SelectedValue,txtVehicleNo.Value,
                    Convert.ToInt32(ddlType.SelectedValue),ddlWeight.SelectedValue,txtMinNo.Value,txtOGP.Value,txtBlank1.Value,txtBlank2.Value) > 0)
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
                var consingmenid = txtConsignementID.Value;
                clsSendSMS sendsms = new clsSendSMS();
                sendsms.SendSMS(txtContact1.Value + ',' + txtContact2.Value + ',' + txtContactNumber1.Value + ',' + txtContactNumber2.Value
                    + ',' + txtContactNumber3.Value + ',' + txtContactNumber4.Value + ',' + txtContactNumber5.Value, "Hi User New consignment has created with consignment ID="
                    + consingmenid);
                if (new DataManager().InsertUpdateConsignment(0, 0, txtConsignementID.Value, txtDate.Value.ToString(), txtSRNNo.Value, Convert.ToInt32(ddlConsigner.SelectedValue), txtAddress1.Value, txtContact1.Value, txtConsignee2.Value, txtAddress2.Value, txtContact2.Value, txtLR.Value, txtMaterialType.Value, txtRemark.Value, txtWayBill1.Value, txtWayBill2.Value, txtWayBill3.Value, txtWayBill4.Value, txtDateOfLoading.Value.ToString(), txtDateOfDeliver.Value.ToString(), Convert.ToDecimal(txtFreightAmount.Value), Convert.ToDecimal(txtAdvanceFreight.Value), Convert.ToDecimal(txtLoading.Value), Convert.ToDecimal(txtUnloading.Value), Convert.ToDecimal(txtOthers.Value), Convert.ToDecimal(txtExtraAmount.Value), Convert.ToDecimal(txtTotalAmount.Value), txtContactNumber1.Value, txtContactNumber2.Value, txtContactNumber3.Value, txtContactNumber4.Value, txtContactNumber5.Value, ddlStatus.SelectedValue, ddlCity.SelectedValue, txtVehicleNo.Value, Convert.ToInt32(ddlType.SelectedValue), ddlWeight.SelectedValue, txtMinNo.Value, txtOGP.Value, txtBlank1.Value, txtBlank2.Value) > 0)
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
            DataTable dt = new DataManager().SelectConsignment(0);
            DataView dv = new DataView(dt);
            string SearchExpression = null;
            if (!String.IsNullOrEmpty(txtSearch.Text))
            {
                SearchExpression = string.Format("{0} '%{1}%'",
                gridState.SortExpression, txtSearch.Text);


            }

            dv.RowFilter = "ConsignementID LIKE " + SearchExpression + " OR SRNNo LIKE " + SearchExpression + " OR ConsignerName like" + SearchExpression + "OR Status like" + SearchExpression + "";
           
          
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
        public void sms()
        {
            String varUserName = "t1tarunkashyap";
            String varPWD = "kashyap@21";
            String varSenderID = "FSKART";
            String varPhNo = "" + txtContactNumber1.Value.ToString() + "," + txtContactNumber2.Value.ToString() + "," + txtContactNumber3.Value.ToString() + "," + txtContactNumber4.Value.ToString() + "," + txtContactNumber5.Value.ToString() + "";
            String varMSG = string.Format("Your Order has been placed successfully .Soon we will confirm it from our side by checking your details. Thank You, Team Logistics");
            HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://www.nimbusit.co.in/api/swsend.asp?username=" + varUserName + "&password=" + varPWD + "&sender=" + varSenderID + "&sendto=" + varPhNo + "&message=" + varMSG);
            HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
            System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
            string responseString = respStreamReader.ReadToEnd();
            respStreamReader.Close();
            myResp.Close();


        }

        protected void lnkExportExcel_Click(object sender, EventArgs e)
        {
            DataTable data = new DataManager().SelectConsignment1(0);
            DataSetToExcel.Convert(data, Response, "Newfile");
        }
    }
}