using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ContactEmail;
using System.Configuration;
using System.IO;
using System.Net.Mail;
using System.Net;


namespace SendMailClass
{
    public class Mailer
    {
        readonly log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
      //  log4net.ILog logger = new LoggerConfiguration().MinimumLevel.Debug().WriteTo.File("YOUR FILE PATH HERE")
           // .CreateLogger();
        public bool SendContactMailToTeam(string To, string Name, string RequesterMail, string subject, string from, string contact, MessageDetails message,
            string CC, string BCC, bool enableSsl, string filePath)
        {
            try
            {
                
                
               // Emailer em = new Emailer();
                StreamReader reader = System.IO.File.OpenText(filePath);
                string body = reader.ReadToEnd();
                reader.Close();
                reader.Dispose();
                


             body = body.Replace("$Client", message.Client);
                body = body.Replace("$Comments", message.Comments);
                body = body.Replace("$Load_From", message.Load_From);
                body = body.Replace("$Mobile_No", message.Mobile_No);
                body = body.Replace("$CurrentDate", DateTime.Now.ToShortDateString());
                body = body.Replace("$Name", message.Name);
                body = body.Replace("$NameOfCircle", message.NameOfCircle);
                body = body.Replace("$PostBy", message.PostBy);

                body = body.Replace("$Status", message.Status);
                body = body.Replace("$Suggested_Freight", message.Suggested_Freight);
                body = body.Replace("$Suggested_Weight", message.Suggested_Weight);
                body = body.Replace("$Top", message.Top);
                body = body.Replace("$Unload_To", message.Unload_To);
                body = body.Replace("$Vehicle_Type", message.Vehicle_Type);
                body = body.Replace("$Top", message.Top);
                // em.SendMail(To, subject, body, from, CC, BCC, enableSsl);
                SendMail(To, subject, body, from, CC, BCC, enableSsl);
                return true;
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
                string strEx = ex.Message;
                return false;
            }
        }

        public bool SendCarrerMail(string To, string Name, string RequesterMail, string subject, string from, string contact, CarrerDetail objcontact,
          string CC, string BCC, bool enableSsl, string filePath)
        {
            try
            {
                
                // Emailer em = new Emailer();
                StreamReader reader = System.IO.File.OpenText(filePath);
                string body = reader.ReadToEnd();
                reader.Close();
                reader.Dispose();



                body = body.Replace("$FullName", objcontact.FullName);
                body = body.Replace("$Email", objcontact.Email);
                body = body.Replace("$Phone", objcontact.Phone);
                body = body.Replace("$Attachement", objcontact.Attachement);
                

                // em.SendMail(To, subject, body, from, CC, BCC, enableSsl);
                SendMail(To, subject, body, from, CC, BCC, enableSsl);
                return true;
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
                string strEx = ex.Message;
                return false;
            }
        }
        public bool SendContactUsMail(string To, string Name, string RequesterMail, string subject, string from, string contact, ContactUsDetail objcontact,
           string CC, string BCC, bool enableSsl, string filePath)
        {
            try
            {
               
                // Emailer em = new Emailer();
                StreamReader reader = System.IO.File.OpenText(filePath);
                string body = reader.ReadToEnd();
                reader.Close();
                reader.Dispose();



                body = body.Replace("$Yourrequest", objcontact.ContactEnquiry);
                body = body.Replace("$FirstName", objcontact.ContactFirstname);
                body = body.Replace("$LastName", objcontact.Contactlastname);
                body = body.Replace("$Email", objcontact.Contactemail);
                body = body.Replace("$Message", objcontact.Contactmessage);
               
                // em.SendMail(To, subject, body, from, CC, BCC, enableSsl);
                SendMail(To, subject, body, from, CC, BCC, enableSsl);
                return true;
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
                string strEx = ex.Message;
                return false;
            }
        }
        public bool SendNewsLetterMail(string To, string Name, string RequesterMail, string subject, string from, string contact, NewsletterClass objcontact,
           string CC, string BCC, bool enableSsl, string filePath)
        {
            try
            {
                ContactEmailDetails contactdetail = new ContactEmailDetails();

                // Emailer em = new Emailer();
                StreamReader reader = System.IO.File.OpenText(filePath);
                string body = reader.ReadToEnd();
                reader.Close();
                reader.Dispose();

                body = body.Replace("$Name", objcontact.Name);
                body = body.Replace("$Email", objcontact.Contactemail);
               

                // em.SendMail(To, subject, body, from, CC, BCC, enableSsl);
                SendMail(To, subject, body, from, CC, BCC, enableSsl);
                return true;
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
                string strEx = ex.Message;
                return false;
            }
        }

        public bool SendNewsLetterMailWithContent(string To, string Name, string RequesterMail, string subject, string from, string contact, string documentPath,
          string CC, string BCC, bool enableSsl, string filePath)
        {
            try
            {
                ContactEmailDetails contactdetail = new ContactEmailDetails();

                // Emailer em = new Emailer();
                StreamReader reader = System.IO.File.OpenText(filePath);
                string body = reader.ReadToEnd();
                reader.Close();
                reader.Dispose();



                body = body.Replace("$Name", "Subscriber");
                body = body.Replace("$Email", documentPath);


                // em.SendMail(To, subject, body, from, CC, BCC, enableSsl);
                SendMail(To, subject, body, from, CC, BCC, enableSsl);
                return true;
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
                string strEx = ex.Message;
                return false;
            }
        }
        public bool SendMail(string To, String subject, string body, string emailfrom, string CC, String BCC, bool enableSsl)
        {
            MailMessage msg = new MailMessage();
            try
            {
                if (To != null & To != "")
                    msg.To.Add(To);
                if (subject != null & subject != "")
                    msg.Subject = subject;
                if (body != null & body != "")
                    msg.Body = body;
                if (BCC != null & BCC != "")
                    msg.Bcc.Add(BCC);

                msg.BodyEncoding = System.Text.Encoding.UTF8;
                msg.From = new MailAddress(emailfrom, "Query");
                msg.IsBodyHtml = true;
                msg.Priority = MailPriority.High;            
                SmtpClient client = new SmtpClient();
                //client.EnableSsl = enableSsl;
                //client.UseDefaultCredentials = true;

                var fromAddress = new MailAddress("reply@corelogistic.com");
                var fromPassword = "reply@2017$";
                //client.Host = "smtp.gmail.com";

                //client.Port = 587;

                client.Host = "mail.corelogistic.com";

                client.Port = 587;
                client.EnableSsl = false;
                client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(fromAddress.Address, fromPassword);
                client.Send(msg);


                //var smtp = new SmtpClient
                //{
                //    Host = "mail.corelogistic.com ",
                //    Port = 110,
                //    EnableSsl = true,
                //    DeliveryMethod = SmtpDeliveryMethod.Network,
                //    UseDefaultCredentials = true,
                //    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                //};
                //using (var message = new MailMessage(fromAddress.Address, To)
                //{
                //    Subject = subject,
                //    Body = body
                //})
                //{
                //    smtp.Send(message);
                //}





                return true;
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
                string strEx = ex.Message;
                
                return false;
            }
            finally
            {
                msg.Dispose();
            }
        }

        public  string SendSMS(string Mobile_Number, string Message)
        {
            WebProxy objProxy1 = null;
           var SenderID = "manish";
          // System.Object stringpost = "user=manish520&password=123456789&sender=manish520&text=" + Message + "&PhoneNumber=" + Mobile_Number;
            System.Object stringpost= "http://bhashsms.com/api/sendmsg.php?user=manish520&pass=123456789&sender=" + SenderID + "&phone=" + Mobile_Number + "&text=" + Message + " &priority=ndnd&stype=normal";
            //string functionReturnValue = null;
            //functionReturnValue = "";

            HttpWebRequest objWebRequest = null;
            HttpWebResponse objWebResponse = null;
            StreamWriter objStreamWriter = null;
            StreamReader objStreamReader = null;

            try
            {
                string stringResult = null;

                objWebRequest = (HttpWebRequest)WebRequest.Create("http://bhashsms.com/api/sendmsg.php?user=manish520&pass=123456789&sender=" + SenderID + "&phone=" + Mobile_Number + "&text=" + Message + " &priority=ndnd&stype=normal");

               // objWebRequest = (HttpWebRequest)WebRequest.Create("http://www.smscountry.com/SMSCwebservice.asp?");
                //  objWebRequest = (HttpWebRequest)WebRequest.Create("http://sms.sms2india.info/sendsms.asp?user=chhabrasoft&password=322559564&sender=Chhabras&text="+Message+"&PhoneNumber="+Mobile_Number+"");
                //objWebRequest = (HttpWebRequest)WebRequest.Create("http://sms.sms2india.info/sendsms.asp?");
                objWebRequest.Method = "POST";

                if ((objProxy1 != null))
                {
                    objWebRequest.Proxy = objProxy1;
                }

                // Use below code if you want to SETUP PROXY.
                //Parameters to pass: 1. ProxyAddress 2. Port
                //You can find both the parameters in Connection settings of your internet explorer.

                //WebProxy myProxy = new WebProxy("YOUR PROXY", PROXPORT);
                //myProxy.BypassProxyOnLocal = true;
                //wrGETURL.Proxy = myProxy;

                objWebRequest.ContentType = "application/x-www-form-urlencoded";

                objStreamWriter = new StreamWriter(objWebRequest.GetRequestStream());
                objStreamWriter.Write(stringpost);
                objStreamWriter.Flush();
                objStreamWriter.Close();

                objWebResponse = (HttpWebResponse)objWebRequest.GetResponse();
                objStreamReader = new StreamReader(objWebResponse.GetResponseStream());
                stringResult = objStreamReader.ReadToEnd();

                objStreamReader.Close();
                return (stringResult);
            }
            catch (Exception ex)
            {
               // logger.Error(ex.Message);
                return (ex.Message);
            }
            finally
            {

                if ((objStreamWriter != null))
                {
                    objStreamWriter.Close();
                }
                if ((objStreamReader != null))
                {
                    objStreamReader.Close();
                }
                objWebRequest = null;
                objWebResponse = null;
                objProxy1 = null;
            }
        }
    }
   
}