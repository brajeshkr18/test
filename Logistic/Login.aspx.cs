using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Logistic
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String type = Request.QueryString["type"];
                if (type == "E")
                {
                    ddlType.SelectedValue = "Employee";
                }
                else if (type == "C")
                {
                    ddlType.SelectedValue = "Client";
                }
                else if (type == "P")
                {
                    ddlType.SelectedValue = "Partner";
                }
                else
                {
                    ddlType.SelectedIndex = 0;
                }
            }

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
                if (ddlType.SelectedIndex > 0)
                {
                    if (ddlType.SelectedValue == "Client")
                    {
                        DataTable dt2 = new DataManager().SelectClientByMobileNo(txtUserId.Value);
                        if (dt2.Rows.Count != 0)
                        {
                            if (txtPassword.Value == dt2.Rows[0]["Password"].ToString())
                            {
                                Session["ClientId"] = dt2.Rows[0]["Id"].ToString();
                                Session["ClientName"] = dt2.Rows[0]["ClientName"].ToString();
                                if (dt2.Rows[0]["role"].ToString() == "Inactive")
                                {
                                    Response.Redirect("Login.aspx");
                                    Response.Write("<script>alert('Your Account Inactive  !!!');</script>");
                                }
                                else
                                    Response.Redirect("client_home.aspx");
                            }
                            else
                            {
                            Response.Write("<script>alert('Username or Password is incorrect');</script>");
                        }
                        }
                        else
                        {
                           Response.Write("<script>alert('Record Could Not Found !!!');</script>");
                        }
                    }
                    else if (ddlType.SelectedValue == "Employee")
                    {
                        DataTable dt1 = new DataManager().SelectEmployeeByMobileNo(txtUserId.Value);
                        if (dt1.Rows.Count != 0)
                        {
                            if (txtPassword.Value == dt1.Rows[0]["Password"].ToString())
                            {
                                Session["EmployeeId"] = dt1.Rows[0]["Id"].ToString();
                                Session["EmployeeName"] = dt1.Rows[0]["EmployeeName"].ToString();
                                if (dt1.Rows[0]["role"].ToString() == "Inactive")
                                {
                                    Response.Redirect("Login.aspx");
                                    Response.Write("<script>alert('Your Account Inactive  !!!');</script>");
                                }
                                else
                                    Response.Redirect("employee_home.aspx");
                            }
                            else
                            {
                            Response.Write("<script>alert('Username or Password is incorrect');</script>");
                        }
                        }
                        else
                        {
                            Response.Write("<script>alert('Record Could Not Found !!!');</script>");
                        }
                    }
                    else if (ddlType.SelectedValue == "Partner")
                    {

                        DataTable dt3 = new DataManager().SelectPartnerByMobileNo(txtUserId.Value);
                        if (dt3.Rows.Count != 0)
                        {
                            if (txtPassword.Value == dt3.Rows[0]["Password"].ToString())
                            {
                                Session["PartnerId"] = dt3.Rows[0]["Id"].ToString();
                                Session["PartnerName"] = dt3.Rows[0]["PartnerName"].ToString();
                                if (dt3.Rows[0]["role"].ToString() == "Inactive")
                                {
                                    Response.Redirect("Login.aspx");
                                    Response.Write("<script>alert('Your Account Inactive  !!!');</script>");
                                }
                                else
                                    Response.Redirect("partner_home.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('Username or Password is incorrect');</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Record Could Not Found !!!');</script>");
                        }
                    }
                    else if (ddlType.SelectedValue == "Admin")
                    {
                        cmd.CommandType = CommandType.Text;
                        if (con.State == ConnectionState.Closed)
                            con.Open();
                        cmd.CommandText = "select password,role from Core_login where email='" + txtUserId.Value + "'";
                        cmd.Connection = con;
                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read())
                        {
                            if (txtPassword.Value == dr.GetString(0))
                                if (dr.GetString(1) == "2")
                                {
                                    Response.Redirect("Login.aspx");
                                    Response.Write("<script>alert('Your Account   !!!');</script>");
                                }
                                else
                                    Response.Redirect("admin_home.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Username or Password is incorrect');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Record Could Not Found !!!');</script>");
                    }

                }
           
                else
                {
                Response.Write("<script>alert('Please Select Login Type !!!');</script>");
            }

        }
           
    }
}