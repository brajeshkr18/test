using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ContactEmail
{
    public class ContactEmailDetails
    {

        public string ContactNameOfReceiver = "TalaCall";
        public string ContactTemplateMessage = "Greetings. You have received an enquiry on TalaCall. The requester has shared following details. Details are as follows.";
        public string ContactTemplateContent = "Enquiry By: $Name <br /> Requestor Email: $EMAIL <br />Requestor Phone: $MOBILE <br />Request Date: $CurrentDate <br />Requestor Message: $CMESSAGE";
       
    }
    public class ContactOnCallDetails
    {

       public string ContactNameOfReceiver = "TalaCall";
        public string ContactTemplateMessage = "Greetings. You have received an enquiry on TalaCall. The requester has shared following details. Details are as follows.";
        public string ContactTemplateContent = " PatientNumber: $PatientNumber <br /> Room Number : $RoomNumber <br />Requestor Name: $RequestorName <br />Response Time : $TAT  minutes <br />";

    }
    public class MessageDetails
    {
       
        public string Client { get; set; }
        public string Load_From { get; set; }
        public string Unload_To { get; set; }
        public string Vehicle_Type { get; set; }
        public string Top { get; set; }
        public string Suggested_Weight { get; set; }
        public string Suggested_Freight { get; set; }
        public string Comments { get; set; }
        public string NameOfCircle { get; set; }
        public string PostBy { get; set; }
        public string Name { get; set; }
        public string Mobile_No { get; set; }
        public string Status { get; set; }
    }
    public class ContactUsDetail
    {

        public string ContactEnquiry { get; set; }
        public string ContactFirstname { get; set; }
        public string Contactlastname { get; set; }
        public string Contactemail { get; set; }
        public string Contactmessage { get; set; }
        
    }
    public class CarrerDetail
    {

        public string FullName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Attachement { get; set; }
       // public string Contactmessage { get; set; }

    }
    public class NewsletterClass
    {

        public string Name { get; set; }
     
        public string Contactemail { get; set; }

    }
}
