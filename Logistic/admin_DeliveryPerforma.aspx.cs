using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using System.Net;
using SendSMSClass;

namespace Logistic
{
    public partial class admin_DeliveryPerforma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 1;
                BindDataList();
                Binddropdown();
            }
        }
        public void Clear()
        {
            txtDate.Value = "";
            //ddConsignementID.SelectedValue = "S";
          //  txtConsignementID.Text = "";
            txtConsigner1.Value = "";
            txtConsignee2.Value = "";
            txtAddress1.Value = "";
            txtExtraAmount.Value = "0.0";
            txtContact.Value = "";
            txtContactNo2.Value = "";
            txtDeliveryRemark.Value = "";
            txtDeliveryTime.Value = "";
            txtReceiversName.Value = "";

            txtContact_No1.Value = "";
            txtContact_No2.Value = "";
            txtContact_No3.Value = "";
            txtContact_No4.Value = "";
            txtContact_No5.Value = "";
        }
        public void BindDataList()
        {
            DataTable data = new DataManager().SelectDeliveryPerforma(0);
            if (data.Rows.Count != 0)
            {
                gridState.DataSource = Session["gridDeliveryPerforma"] = data;
                gridState.DataBind();

            }
            else
            {
                DataTable dt0 = new DataTable();
                gridState.DataSource = dt0;
                gridState.DataBind();
            }
        }
        public void Binddropdown()
        {
            DataTable dt2 = new DataManager().bindConsingmentdd();
            if (dt2.Rows.Count != 0)
            {
                ddConsignementID.DataSource = dt2;
                ddConsignementID.DataTextField = "ConsignementId";
                ddConsignementID.DataValueField = "id";
                ddConsignementID.DataBind();
                ddConsignementID.Items.Insert(0, new ListItem("--Select Consingment Id--", "0"));



            }
        }
        protected void lnkAdd_Click(object sender, EventArgs e)
        {

            btnsubmit.Text = "Submit";
            Clear();
            MultiView1.ActiveViewIndex = 0;

            //DataTable dt1 = new DataManager().SelectConsignmentMaxConsignementID();
            //if (dt1.Rows.Count > 0)
            //{
            //    txtConsignementID.Value = dt1.Rows[0]["ConsignementID"].ToString();
            //    if (txtConsignementID.Value == "")
            //    {
            //        txtConsignementID.Value = "CL/000000";
            //    }
            //}
            //else
            //{
            //    txtConsignementID.Value = "CL/000001";
            //}
            //var str = txtConsignementID.Value;
            //var tempArray = str.Split('/');
            //string tempId = tempArray[1];
            //int id = Convert.ToInt32(tempId);
            //id = id + 1;
            //string autoId = "CL/" + String.Format("{0:000000}", id);
            //txtConsignementID.Value = autoId;


          
        }
        protected void gridState_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridState.PageIndex = e.NewPageIndex;
            gridState.DataSource = Session["gridDeliveryPerforma"];
            gridState.DataBind();
        }
        protected void gridState_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                DataTable dt = new DataManager().SelectDeliveryPerforma(id);
                if (dt.Rows.Count != 0)
                {
                    MultiView1.ActiveViewIndex = 0;
                    btnsubmit.Text = "Update";
                    ddConsignementID.SelectedItem.Text = dt.Rows[0]["ConsignementId"].ToString();
                    ddConsignementID.DataValueField = dt.Rows[0]["id"].ToString();
                    //  ddConsignementID.SelectedIndex = dt.Rows[0]["ConsignementId"].ToString();
                    txtDate.Value = dt.Rows[0]["date"].ToString();
                    txtConsigner1.Value = dt.Rows[0]["Consigner_Name"].ToString();
                    txtAddress1.Value = dt.Rows[0]["address"].ToString();
                    txtConsignee2.Value = dt.Rows[0]["Consignee_Name_Id"].ToString();
                    txtContact.Value = dt.Rows[0]["contactNo1"].ToString();
                    txtDeliveryTime.Value = dt.Rows[0]["Delivery_Time"].ToString();
                    txtReceiversName.Value = dt.Rows[0]["Receivers_Name"].ToString();
                    txtContactNo2.Value = dt.Rows[0]["ContactNo2"].ToString();
                    txtDeliveryRemark.Value = dt.Rows[0]["Delivery_Remark"].ToString();
                    txtExtraAmount.Value = dt.Rows[0]["Any_Extra_Amount"].ToString();
                   
                    lblId.Text = dt.Rows[0]["Id"].ToString();
                }

            }
            else if (e.CommandName == "Delete1")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                new DataManager().DeleteDeliveryPerforma(id);
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
            DataTable dt = new DataManager().SelectdeliveryperformaByConsignementID(ddConsignementID.SelectedItem.Text);
            if (btnsubmit.Text == "Update" || dt.Rows.Count > 0)
            {
                string id;
                if (dt.Rows.Count > 0)
                {
                    id = dt.Rows[0]["Id"].ToString();
                }
                else
                {
                    id = Convert.ToInt32(lblId.Text).ToString();
                }
                int test = Convert.ToInt32(id);
                if (new DataManager().InsertUpdateDeliveryPerforma(test, 1, ddConsignementID.SelectedItem.Text, txtDate.Value, txtConsigner1.Value, txtAddress1.Value, txtConsignee2.Value, txtContactNo2.Value, txtDeliveryTime.Value, txtReceiversName.Value, txtContactNo2.Value, txtDeliveryRemark.Value, Convert.ToDecimal(txtExtraAmount.Value)) > 0)
                {
					var updatestatu = new DataManager().Updateconsignment(ddConsignementID.SelectedItem.Text);
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
                if (new DataManager().InsertUpdateDeliveryPerforma(0, 0, ddConsignementID.SelectedItem.Text, txtDate.Value, txtConsigner1.Value, txtAddress1.Value, txtConsignee2.Value, txtContactNo2.Value, txtDeliveryTime.Value, txtReceiversName.Value, txtContactNo2.Value, txtDeliveryRemark.Value, Convert.ToDecimal(txtExtraAmount.Value)) > 0)
                {
                    var updatestatu = new DataManager().Updateconsignment(ddConsignementID.SelectedItem.Text);
                   
                    var consingmenid = ddConsignementID.SelectedItem.Text;
                    clsSendSMS sendsms = new clsSendSMS();
                    sendsms.SendSMS(txtContact.Value + ',' + txtContactNo2.Value + ',' + txtContact_No1.Value + ',' + txtContact_No2.Value
                        + ',' + txtContact_No3.Value + ',' + txtContact_No4.Value + ',' + txtContact_No5.Value, "Hi User Your Consignment  has been delivered with consignment ID="
                        + consingmenid);

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
            DataTable dt = new DataManager().SelectDeliveryPerforma(0);
            DataView dv = new DataView(dt);
            string SearchExpression = null;
            if (!String.IsNullOrEmpty(txtSearch.Text))
            {
                SearchExpression = string.Format("{0} '%{1}%'",
                gridState.SortExpression, txtSearch.Text);


            }

            dv.RowFilter = "ConsignementId LIKE " + SearchExpression + " OR Consigner_Name LIKE " + SearchExpression + " OR address like" + SearchExpression + "OR Receivers_Name like" + SearchExpression + "";


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
        //protected void txtConsignementID_TextChanged(object sender, EventArgs e)
        //{

        //    DataTable dt = new DataManager().SelectConsignmentByConsignementID(txtConsignementID.Text);
        //    if (dt.Rows.Count > 0)
        //    {
        //      //  txtConsigner1.Value = dt.Rows[0]["ConsignerName"].ToString();
        //        txtAddress1.Value = dt.Rows[0]["Address1"].ToString();
        //        txtConsignee2.Value = dt.Rows[0]["ConsigneeName"].ToString();
        //        txtContact.Value = dt.Rows[0]["Contact1"].ToString();

        //        txtContact_No1.Value = dt.Rows[0]["ContactNo1"].ToString();
        //        txtContact_No2.Value = dt.Rows[0]["ContactNo2"].ToString();
        //        txtContact_No3.Value = dt.Rows[0]["ContactNo3"].ToString();
        //        txtContact_No4.Value = dt.Rows[0]["ContactNo4"].ToString();
        //        txtContact_No5.Value = dt.Rows[0]["ContactNo5"].ToString();
        //    }
        //    else
        //    {
        //        txtConsigner1.Value = "";
        //        txtAddress1.Value = "";
        //        txtConsignee2.Value = "";
        //        txtContact.Value = "";
        //        txtContact_No1.Value = "";
        //        txtContact_No2.Value = "";
        //        txtContact_No3.Value = "";
        //        txtContact_No4.Value = "";
        //        txtContact_No5.Value = "";
        //    }
        //}

        public void sms()
        {
            String varUserName = "t1tarunkashyap";
            String varPWD = "kashyap@21";
            String varSenderID = "FSKART";
            String varPhNo = "" + txtContact_No1.Value.ToString() + "," + txtContact_No2.Value.ToString() + "," + txtContact_No3.Value.ToString() + "," + txtContact_No4.Value.ToString() + "," + txtContact_No5.Value.ToString() + "," + txtContactNo2.Value.ToString() + "";
            String varMSG = string.Format("Your Order has been placed successfully .Soon we will confirm it from our side by checking your details. Thank You, Team Logistics");
            HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://www.nimbusit.co.in/api/swsend.asp?username=" + varUserName + "&password=" + varPWD + "&sender=" + varSenderID + "&sendto=" + varPhNo + "&message=" + varMSG);
            HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
            System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
            string responseString = respStreamReader.ReadToEnd();
            respStreamReader.Close();
            myResp.Close();


        }

        protected void ddConsignementID_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddConsignementID_SelectedIndexChanged1(object sender, EventArgs e)
        {
            DataTable dt = new DataManager().SelectConsignmentByConsignementID2(ddConsignementID.SelectedValue);
            if (dt.Rows.Count > 0)
            {
                //    ddConsignementID.SelectedValue = dt.Rows[0]["ConsignerName"].ToString();
                txtAddress1.Value = dt.Rows[0]["Address1"].ToString();
                txtConsignee2.Value = dt.Rows[0]["ConsigneeName"].ToString();

                txtDate.Value = dt.Rows[0]["Date"].ToString();

                txtConsigner1.Value = dt.Rows[0]["consignername"].ToString();
                //  txtDeliveryTime.Value = dt.Rows[0]["ContactNo2"].ToString();
                txtContact_No1.Value = dt.Rows[0]["ContactNo1"].ToString();
                txtContact_No2.Value = dt.Rows[0]["ContactNo2"].ToString();
                txtContact_No3.Value = dt.Rows[0]["ContactNo3"].ToString();
                txtContact_No4.Value = dt.Rows[0]["ContactNo4"].ToString();
                txtContact_No5.Value = dt.Rows[0]["ContactNo5"].ToString();
            }
            else
            {
                txtConsigner1.Value = "";
                txtAddress1.Value = "";
                txtConsignee2.Value = "";
                txtContact.Value = "";
                txtContact_No1.Value = "";
                txtContact_No2.Value = "";
                txtContact_No3.Value = "";
                txtContact_No4.Value = "";
                txtContact_No5.Value = "";
            }

        }
    }
}