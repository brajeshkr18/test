using ContactEmail;
using SendMailClass;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Logistic
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx?type="+"E");
        }
        protected void lnkClient_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx?type=" + "C");
        }
        protected void lnkPartner_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx?type=" + "P");
        }

        protected void lnksendmail_Click(object sender, EventArgs e)
        {

        }

        private bool IsValidEmail(string email)

        {

            string regexPattern = @"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$";

            return new Regex(regexPattern, RegexOptions.IgnoreCase).IsMatch(email);

        }
        protected void applynewsletter_Click(object sender, EventArgs e)
        {
            var mailid = txtemail.Text;
           
            if (IsValidEmail(mailid))
            {
                Mailer Emailer = new Mailer();
                NewsletterClass objcontact = new NewsletterClass();
                objcontact.Contactemail = mailid;
                objcontact.Name = mailid;
                if (Emailer.SendNewsLetterMail(mailid,
                   mailid, mailid, ConfigurationManager.AppSettings["Subject"].ToString(),
                    ConfigurationManager.AppSettings["EmailFrom"].ToString(), "9999999999", objcontact,
                    ConfigurationManager.AppSettings["CC"].ToString(), ConfigurationManager.AppSettings["BCC"].ToString(),
                    true, Server.MapPath(ConfigurationManager.AppSettings["EmailTemplatePath"].ToString() + "NewsLetterSuscription.html")))
                {
                    if (new DataManager().InsertNewsLetterSubscription(0, mailid, true) > 0)
                    {
                        Response.Write("<script>alert('Thansk for subscribring our News Letter   !!!');</script>");
                        txtemail.Text = "";
                    }
                }
                else
                {
                    Response.Write("<script>alert('oops something went wrong !!!');</script>");
                }
            }
            else {
                Response.Write("<script>alert('Enter Valid Email ID   !!!');</script>");
            }

        }
        
        //protected void lnksendmail_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Login.aspx?type=" + "P");
        //}
    }
}