﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Logistic
{
    public partial class partner_home_request : System.Web.UI.Page
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
            DataTable dt1 = new DataManager().CountTotalAskVehicleByPartner(Convert.ToInt32(Session["PartnerId"]));
            if (dt1.Rows.Count > 0)
            {

                lblTotalAskVehicle.Text = dt1.Rows[0]["TotalAskVehicle"].ToString();

            }
            else
            {
                lblTotalAskVehicle.Text = "0";

            }
            DataTable dt2 = new DataManager().CountTotalVehicleByPartner(Convert.ToInt32(Session["PartnerId"]));
            if (dt2.Rows.Count > 0)
            {

                lblTotalVehicle.Text = dt2.Rows[0]["TotalVehicle"].ToString();

            }
            else
            {
                lblTotalVehicle.Text = "0";

            }

            string today = DateTime.Now.ToString("yyyy-MM-dd");
            DataTable dt3 = new DataManager().CountTodayAskVehicleByPartner(Convert.ToInt32(Session["PartnerId"]), today);
            if (dt3.Rows.Count > 0)
            {

                lblTodayAskVehicle.Text = dt3.Rows[0]["TodayAskVehicle"].ToString();

            }
            else
            {
                lblTodayAskVehicle.Text = "0";

            }
            DataTable dt4 = new DataManager().CountTodayVehicleByPartner(Convert.ToInt32(Session["PartnerId"]), today);
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