using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Logistic
{
    public partial class admin_home_request : System.Web.UI.Page
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
            DataTable dt1 = new DataManager().CountTotalLoadByEmp(0);
            if (dt1.Rows.Count > 0)
            {

                lblTotalLoad.Text = dt1.Rows[0]["TotalLoad"].ToString();

            }
            else
            {
                lblTotalLoad.Text = "0";

            }
            DataTable dt2 = new DataManager().CountTotalVehicleByEmp(0);
            if (dt2.Rows.Count > 0)
            {

                lblTotalVehicle.Text = dt2.Rows[0]["TotalVehicle"].ToString();

            }
            else
            {
                lblTotalVehicle.Text = "0";

            }
          
            string today = DateTime.Now.ToString("yyyy-MM-dd");
            DataTable dt3 = new DataManager().CountTodayLoadByEmp(0, today);
            if (dt3.Rows.Count > 0)
            {

                lblTodayLoad.Text = dt3.Rows[0]["TodayLoad"].ToString();

            }
            else
            {
                lblTodayLoad.Text = "0";

            }
            DataTable dt4 = new DataManager().CountTodayVehicleByEmp(0, today);
            if (dt4.Rows.Count > 0)
            {

                lblTodayVehicle.Text = dt4.Rows[0]["TodayVehicle"].ToString();

            }
            else
            {
                lblTodayVehicle.Text = "0";

            }
        }
    
    }
}