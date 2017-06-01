using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace SendSMSClass
{
    public class clsSendSMS
    {
        readonly log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public string Hello { get; private set; }

        public bool SendSMS(string Mobile_Number, string Message)
        {
            try
            {
                string Password = "Hello@1234";
                string Msg = Message;
                string OPTINS = "INVITE";
                string MobileNumber = Mobile_Number;
                string type = "3";
                string strUrl = "http://login.bulksmsgateway.in/sendmessage.php?user=brajeshkr&password=" + Password + "&message=" + Msg + "&sender=" + OPTINS + "&mobile=" + MobileNumber + "&type=" + 3;
                System.Net.WebRequest request = System.Net.WebRequest.Create(strUrl);
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                Stream s = (Stream)response.GetResponseStream();
                StreamReader readStream = new StreamReader(s);
                string dataString = readStream.ReadToEnd();
                response.Close();
                s.Close();
                readStream.Close();
               // Response.Write("Sent");
                return true;
            }
            
            catch (Exception ex)
            {
                // logger.Error(ex.Message);
                return false;
            }
            finally
            {

              
            }
        }
    }
}