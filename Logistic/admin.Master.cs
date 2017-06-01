using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Logistic
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                //Response.Redirect("Login.aspx");
            }

            else
            {
                //lblMemberName.Text = "Welcome" + "," + Session["Name"].ToString();

            }
            BindDataList();
        }
        //protected void btnLogOut_Click(object sender, EventArgs e)
        //{
        //    Session["Name"] = "";
        //    Response.Redirect("admin.aspx");
        //}
        public void BindDataList()
        {
           

            string today = DateTime.Now.ToString("yyyy-MM-dd");
            DataTable dt3 = new DataManager().CountTodayLoadByEmp(0, today);
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
            DataTable dt4 = new DataManager().CountTodayVehicleByEmp(0, today);
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
            DataTable dt2 = new DataManager().CountTodayBill(0, date);
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
    }
}