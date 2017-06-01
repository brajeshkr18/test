using SendMailClass;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Logistic
{
    public partial class AdminNewsLetterSubscription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataList();
        }

        public void BindDataList()
        {
            DataTable data = new DataManager().SelectSewsLetter();
            if (data.Rows.Count != 0)
            {
                gridState.DataSource = Session["gridConsignment"] = data;
                gridState.DataBind();

            }
            else
            {
                DataTable dt0 = new DataTable();
                gridState.DataSource = dt0;
                gridState.DataBind();
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
        protected void btnsendmail_Click(object sender, EventArgs e)
        {
            var  data = new DataManager().SelectNewsLetterEmails();
            string email = "";
            string documentPath = "";
            if (data.Rows.Count != 0)
            {
                email = data.Rows[0]["Email"].ToString();
                email = email.Substring(0, email.LastIndexOf(','));
            }
            if (FileUpload.HasFile)
            {
                string filename = Path.GetFileName(FileUpload.FileName);
                filename= filename.ToLower();
                if (filename.Contains(".pdf") || filename.Contains(".doc") || filename.Contains(".docx"))
                {
                    filename = Path.GetFileName(FileUpload.FileName);
                    filename = CreateFileName(filename);
                    FileUpload.SaveAs(Server.MapPath("~/Attachement/") + filename);
                    documentPath = "http://corelogistic.com" + "/Attachement/" + filename;
                    //documentPath = "http://localhost:58034" + "/Attachement/" + filename;
                }
                else
                {
                    Response.Write("<script>alert('only file with pdf and doc are allowed !!!');</script>");
                }
            }
               
                Mailer sendemail = new Mailer();
            if(sendemail.SendNewsLetterMailWithContent(email,
               "Hello Subscriber", email, ConfigurationManager.AppSettings["Subject"].ToString(),
                ConfigurationManager.AppSettings["EmailFrom"].ToString(), "9999999999", documentPath,
                "brajeshkr18@gmail.com", ConfigurationManager.AppSettings["BCC"].ToString(),
                true, Server.MapPath(ConfigurationManager.AppSettings["EmailTemplatePath"].ToString() + "NewsLetterSuscription.html")))
            {
                Response.Write("<script>alert('Mail send with newsletter attachement !!!');</script>");
                return;
            }
            else
                Response.Write("<script>alert('some error in sending attachement !!!');</script>");
        }
      
    }
}