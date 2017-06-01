using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Logistic
{
    public partial class client_changepassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnsubmit_Click1(object sender, EventArgs e)
        {
            try
            {
                cmd.CommandType = CommandType.Text;
                if (con.State == ConnectionState.Closed)
                    con.Open();
                cmd.CommandText = "select Password,Id from Core_client where Password='" + txtOld.Value + "'";
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    int id = Convert.ToInt32(dr["Id"].ToString());
                    if (txtOld.Value == dr.GetString(0))
                    {

                        if (new DataManager().UpdateClientPassword(Convert.ToInt32(id), txtNewPassword.Value.ToString()) > 0)
                        {
                            ScriptManager.RegisterStartupScript(Page, typeof(string), "Message", "alert('Your Details have been updated ');", true);
                            Response.Redirect("client_home.aspx");

                        }
                        else
                        {
                            Response.Write("<script>alert('Not updated ')</script>");

                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('Please Enter Correct password....!!!!');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please Enter Correct password....!!!!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("client_home.aspx");

        }
    }
}