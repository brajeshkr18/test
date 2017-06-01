using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Logistic
{
    public partial class employee_home_Consignement : System.Web.UI.Page
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
            DataTable dt1 = new DataManager().CountTotalConsignementbyCircle(Convert.ToInt32(Session["EmployeeId"]));
            if (dt1.Rows.Count > 0)
            {

                lblTotalConsignement.Text = dt1.Rows[0]["TotalConsignment"].ToString();

            }
            else
            {
                lblTotalConsignement.Text = "0";

            }
            DateTime d = DateTime.Now.Date;
            string Month = d.ToString("MM");
            string day = d.ToString("dd");
            string Year = d.ToString("yyyy");
            string date = Month + "/" + day + "/" + Year;
            DataTable dt2 = new DataManager().CountTodayConsignementbyCircle(date, Convert.ToInt32(Session["EmployeeId"]));
            if (dt2.Rows.Count > 0)
            {

                lblTodayConsignement.Text = dt2.Rows[0]["ToDayConsignment"].ToString();

            }
            else
            {
                lblTodayConsignement.Text = "0";

            }

            DataTable dt3 = new DataManager().CountConsignmentbyStatusAndCircle("Pending", Convert.ToInt32(Session["EmployeeId"]));
            if (dt3.Rows.Count > 0)
            {

                lblOngoingConsignement.Text = dt3.Rows[0]["Status"].ToString();

            }
            else
            {
                lblOngoingConsignement.Text = "0";

            }
            DataTable dt4 = new DataManager().CountConsignmentbyStatusAndCircle("Delivered", Convert.ToInt32(Session["EmployeeId"]));
            if (dt4.Rows.Count > 0)
            {

                lblOldConsignement.Text = dt4.Rows[0]["Status"].ToString();

            }
            else
            {
                lblOldConsignement.Text = "0";

            }
        }
    }
}