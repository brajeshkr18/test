using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Logistic
{
    public partial class employee : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmployeeName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            else
            {
                lblEmployee.Text = "Welcome" + ", " + Session["EmployeeName"].ToString();

            }
            BindDataList();
            role();
        }
     
        public void BindDataList()
        {

            string today = DateTime.Now.ToString("yyyy-MM-dd");
            DataTable dt3 = new DataManager().CountTodayLoadByEmp(Convert.ToInt32(Session["EmployeeId"]), today);
            if (dt3.Rows.Count > 0)
            {

                lblTodayLoad.Text = dt3.Rows[0]["TodayLoad"].ToString();
                lblTodayLoad1.Text = lblTodayLoad.Text;
            }
            else
            {
                lblTodayLoad.Text = "0";
                lblTodayLoad1.Text = "0";
            }
            DataTable dt4 = new DataManager().CountTodayVehicleByEmp(Convert.ToInt32(Session["EmployeeId"]), today);
            if (dt4.Rows.Count > 0)
            {

                lblTodayVehicle.Text = dt4.Rows[0]["TodayVehicle"].ToString();
                lblTodayVehicle1.Text = lblTodayVehicle.Text;
            }
            else
            {
                lblTodayVehicle.Text = "0";
                lblTodayVehicle1.Text = "0";
            }
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            DataTable dt2 = new DataManager().CountTodayBill(Convert.ToInt32(Session["EmployeeId"]), date);
            if (dt2.Rows.Count > 0)
            {

                lblTodayGenerateBill.Text = dt2.Rows[0]["TodayBill"].ToString();
                lblTodayGenerateBill1.Text = lblTodayGenerateBill.Text;
            }
            else
            {
                lblTodayGenerateBill.Text = "0";
                lblTodayGenerateBill1.Text = "0";
            }
        }
        public void role()
        {
            DataTable dt = new DataManager().SelectEmployee(Convert.ToInt32(Session["EmployeeId"]));
            if(dt.Rows.Count>0)
            {
                if (dt.Rows[0]["Load_request_role"].ToString() == "Yes")
                {
                    lblLoadRequest.Visible = true;
                }
                else
                {
                    lblLoadRequest.Visible = false;
                }
                if (dt.Rows[0]["Vehicle_request_role"].ToString() == "Yes")
                {
                    lblVehicleRequest.Visible = true;
                }
                else
                {
                    lblVehicleRequest.Visible = false;
                }
                if (dt.Rows[0]["ask_for_vehicle_role"].ToString() == "Yes")
                {
                    lblAskforVehicle.Visible = true;
                }
                else
                {
                    lblAskforVehicle.Visible = false;
                }
                if (dt.Rows[0]["Consignement_role"].ToString() == "Yes")
                {
                    lblConsignement.Visible = true;
                }
                else
                {
                    lblConsignement.Visible = false;
                }
                if (dt.Rows[0]["Bill_role"].ToString() == "Yes")
                {
                    lblBill.Visible = true;
                }
                else
                {
                    lblBill.Visible = false;
                }
                if (dt.Rows[0]["Delivery_Performa_role"].ToString() == "Yes")
                {
                    lblDeilveryPerforma.Visible = true;
                }
                else
                {
                    lblDeilveryPerforma.Visible = false;
                }
            }
        }
    }
}