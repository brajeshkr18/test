using ContactEmail;
using SendMailClass;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Logistic
{
    public partial class Career : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSend_mail(object sender, EventArgs e)
        {
            string path="";
            string Fullpath = "";
            if (txtmail.Text == "" || txtname.Value == "" || txtphone.Value == "")
            {
                Response.Write("<script>alert('Please Fill all field!!!');</script>");
            }
            else
            {

                if (FileUploadControl.HasFile)
                {
                    try
                    {
                        string filename = Path.GetFileName(FileUploadControl.FileName);
                        filename = filename.ToLower();
                        if (filename.Contains(".pdf") || filename.Contains(".doc") || filename.Contains(".docx"))
                        {
                            filename = Path.GetFileName(FileUploadControl.FileName);
                            filename = CreateFileName(filename);
                            FileUploadControl.SaveAs(Server.MapPath("~/Attachement/") + filename);
                            Fullpath = "http://corelogistic.com" + "/Attachement/" + filename;
                            // documentPath = "http://localhost:58034" + "/Attachement/" + filename;
                            Sendmailattachement(Fullpath);
                        }
                        else
                        {
                            Response.Write("<script>alert('only file with pdf and doc are allowed !!!');</script>");
                            return;
                        }


                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert(ex.message);</script>");
                        // StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please upload a attachement!!!');</script>");
                    return;
                }
            }
            
        }
        private string CreateFileName(string filename)
        {
            if (!string.IsNullOrEmpty(filename))
            {
                var Fname = filename.Split('.')[0];
                var Fext = filename.Split('.')[1];

                return (Fname + "_" + DateTime.Now.ToString("yyyyMMddmmss")) + "." + Fext;
            }

            return "";

        }
        private bool Sendmailattachement(string Fullpath)
        {
            //if (txtmail.Text == "" || txtname.Value == "" || txtphone.Value == "")
            //{
            //    Response.Write("<script>alert('Please Fill all field!!!');</script>");
            //}
            //else
            //{
               var FullName = txtname.Value;
                var Phone = txtphone.Value;
                var email = txtmail.Text;
                var sendto = ConfigurationManager.AppSettings["EmailTocarrer"].ToString();
                Mailer Emailer = new Mailer();
                CarrerDetail objcarrerdetail = new CarrerDetail();
            //objcarrerdetail.Attachement = "http://corelogistic.votoo.in/" + Fullpath;
              objcarrerdetail.Attachement = Fullpath;
                //objcarrerdetail.Attachement = "http://corelogistic.com/" + Fullpath;
                objcarrerdetail.Email = txtmail.Text;
                objcarrerdetail.Phone = txtphone.Value;
                objcarrerdetail.FullName = txtname.Value;

                if (Emailer.SendCarrerMail(sendto,
                   sendto, email, ConfigurationManager.AppSettings["Subject"].ToString(),
                    ConfigurationManager.AppSettings["EmailFrom"].ToString(), "9999999999", objcarrerdetail,
                    ConfigurationManager.AppSettings["EmailTocarrer"].ToString(), ConfigurationManager.AppSettings["EmailTocarrer"].ToString(),
                    true, Server.MapPath(ConfigurationManager.AppSettings["EmailTemplatePath"].ToString() + "CareerTemplate.html")))
                {
                    Response.Write("<script>alert('Mail sent successfully!!!');</script>");
                txtname.Value="";
                txtphone.Value="";
                txtmail.Text="";
                return true;
                }
                else
                    Response.Write("<script>alert('Oops Something went Wrong!!!');</script>");
                return false;
            //}
            //return true;
        }
    }
}