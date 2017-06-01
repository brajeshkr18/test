using ContactEmail;
using SendMailClass;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Logistic
{
    public partial class contact : System.Web.UI.Page
    {
        private object txtFreight;
        private object txtemail;

        public object MultiView1 { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSendmail_Click(object sender, EventArgs e)
        {
            //if (txtemail.Value == "")

            //{
            //    Response.Write("<script>alert('Enter EmailId !!!');</script>");
            //    ////  return;
            //    //  Mailer test = new Mailer();
            //    //  test.SendSMS("9910753655","test@123");
            //    //clsSendSMS sendsms = new clsSendSMS();
            //    //sendsms.SendSMS("9910753655", "test@123");

            //}
            //else if(txtemail.Value.Contains())
            //{
            //    Response.Write("<script>alert('Enter valid !!!');</script>");
            //    return;

            //}
            //Mailer Emailer = new Mailer();
            //MessageDetails message = new MessageDetails();
            //message.Client = MultiView1.ActiveViewIndex.ToString();
            //message.Load_From = txtFrom.Value;
            //message.Unload_To = txtTo.Value;
            //message.Vehicle_Type = ddlType.SelectedItem.Text;
            //message.Top = ddlTop.SelectedValue;
            //message.Suggested_Weight = ddlWeight.SelectedValue;
            //message.Suggested_Freight = txtFreight.Value;
            //message.Comments = txtComments.Value;
            //message.NameOfCircle = ddlCity.SelectedIndex.ToString();
            //message.PostBy = txtType.Value;
            //message.Name = txtName.Value;
            //message.Mobile_No = txtMobile.Value;
            //message.Status = lblId.Text;
            ////DataSetToExcel.Convert(dt, Response,"Newfile");
             
            //var sendto = ConfigurationManager.AppSettings["EmailTo"].ToString();
            //if (Emailer.SendContactMailToTeam(sendto,
            //   sendto, email, ConfigurationManager.AppSettings["Subject"].ToString(),
            //    ConfigurationManager.AppSettings["EmailFrom"].ToString(), "9999999999", message,
            //    ConfigurationManager.AppSettings["CC"].ToString(), ConfigurationManager.AppSettings["BCC"].ToString(),
            //    true, Server.MapPath(ConfigurationManager.AppSettings["EmailTemplatePath"].ToString() + "ContactTemplateToTeam.html")))
            //{
            //    Response.Write("<script>alert('Mail sent successfully!!!');</script>");
            //    return;
            //}
            //else
            //    Response.Write("<script>alert('Oops Something went Wrong!!!');</script>");
            //return;
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterForEventValidation(this.UniqueID);
           // erMsg.Visible = !string.IsNullOrEmpty(lblError.Text);
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            var ddcontact = ddcontactinquiry.Value;
            var firstname = Firstname.Value;
            var lastname = contactlastname.Value;
            var email = contactemail.Text;
            var message = contactmessage.Value;
            if(firstname=="" || lastname=="" || email=="" || message=="")
            {
                Response.Write("<script>alert('Pleaase fill the all required field!!!');</script>");
                return;

            }
            var sendto = ConfigurationManager.AppSettings["EmailToContactUs"].ToString();
            Mailer Emailer = new Mailer();
            ContactUsDetail objcontactus = new ContactUsDetail();
            objcontactus.ContactEnquiry = ddcontact;
            objcontactus.Contactemail = email;
            objcontactus.ContactFirstname = firstname;
            objcontactus.Contactlastname = lastname;
            objcontactus.Contactmessage = message;
            if (Emailer.SendContactUsMail(sendto,
               sendto, email, ConfigurationManager.AppSettings["Subject"].ToString(),
                ConfigurationManager.AppSettings["EmailFrom"].ToString(), "9999999999", objcontactus,
                ConfigurationManager.AppSettings["CC"].ToString(), ConfigurationManager.AppSettings["BCC"].ToString(),
                true, Server.MapPath(ConfigurationManager.AppSettings["EmailTemplatePath"].ToString() + "ContactUsTemplate.html")))
            {
                Response.Write("<script>alert('Mail sent successfully!!!');</script>");
                
                Firstname.Value = "";
                contactlastname.Value = "";
                contactemail.Text = "";
                contactmessage.Value="";
                return;
            }
            else
                Response.Write("<script>alert('Oops Something went Wrong!!!');</script>");
            return;
        }
    }
}