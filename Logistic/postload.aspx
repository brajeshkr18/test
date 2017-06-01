<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="postload.aspx.cs" Inherits="Logistic.postload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- .page-title start -->
<div class="page-title-style01 page-title-negative-top pt-bkg08">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h1>Core Logistic Pvt. Ltd.</h1>
        <div class="breadcrumb-container">
          <ul class="breadcrumb clearfix">
            <li>You are here:</li>
            <li>Book Your Load</li>
          </ul>
          <!-- .breadcrumb end --> 
        </div>
        <!-- .breadcrumb-container end --> 
      </div>
      <!-- .col-md-12 end --> 
    </div>
    <!-- .row end --> 
  </div>
  <!-- .container end --> 
</div>
<!-- .page-title-style01.page-title-negative-top end -->
<div class="page-content">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="custom-heading">
          <h3>Book Your Load</h3>
        </div>
        <!-- .custom-heading.left end -->
        
        <p> Please send your inquiry. </p>
        <br />
        
        <div class="col-md-6">
        <div class="wpcf7 clearfix">
          <fieldset>
                 <label> <span class="required">*</span> From: </label>
              	<input type="text" class="wpcf7-textarea" runat="server" id="txtFrom">
                  <asp:RequiredFieldValidator ControlToValidate="txtFrom" ID="RequiredFieldValidator17"
                                                   ValidationGroup="abc" ForeColor="Red"  ErrorMessage="Please fill Location of Pick up" runat="server" ></asp:RequiredFieldValidator>
          </fieldset>
          <fieldset>
            <label> <span class="required">*</span> To: </label>
           <input type="text" class="wpcf7-textarea" runat="server" id="txtTo">
              <asp:RequiredFieldValidator ControlToValidate="txtTo" ID="RequiredFieldValidator2"
                                                   ValidationGroup="abc" ForeColor="Red"  ErrorMessage="Please fill Location of Delivery" runat="server" ></asp:RequiredFieldValidator>
          </fieldset>
          <fieldset>
          <label> <span class="required">*</span> Vehicle Type: </label>
                 <asp:DropDownList ID="ddlType" class="wpcf7-form-control-wrap wpcf7-select" runat="server">
                </asp:DropDownList>
                  <asp:RequiredFieldValidator ControlToValidate="ddlType" ID="RequiredFieldValidator3"
                                                       ValidationGroup="abc" ForeColor="Red"  ErrorMessage="Please Vehicle Type" InitialValue="0" runat="server"  Display="Dynamic"></asp:RequiredFieldValidator>
        </fieldset>
          <fieldset>
            <label> <span class="required">*</span> Top: </label>
             <asp:DropDownList ID="ddlTop" class="wpcf7-form-control-wrap wpcf7-select" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Covered</asp:ListItem>
                    <asp:ListItem>Open</asp:ListItem>
               </asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="ddlTop" ID="RequiredFieldValidator1" ValidationGroup="abc" ForeColor="Red"   ErrorMessage="Please Select Top" runat="server" ></asp:RequiredFieldValidator>
          </fieldset>
          <fieldset>
            <label> <span class="required">*</span> Select Weight: </label>      
            <asp:DropDownList ID="ddlWeight" class="wpcf7-form-control-wrap wpcf7-select" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Less than 250 Grams</asp:ListItem>
                    <asp:ListItem>250 to 500 Grams</asp:ListItem>
                    <asp:ListItem>500 to 999 Grams</asp:ListItem>
                    <asp:ListItem>1Kg to 5Kg</asp:ListItem>
                    <asp:ListItem>5Kg to 10Kg</asp:ListItem>
                    <asp:ListItem>10Kg to 50Kg</asp:ListItem>
                    <asp:ListItem>50Kg to 100Kg</asp:ListItem>
                    <asp:ListItem>100Kg to 500Kg</asp:ListItem>
                    <asp:ListItem>Less than 1Ton</asp:ListItem>
                    <asp:ListItem>1Ton</asp:ListItem>
                    <asp:ListItem>1.5Ton</asp:ListItem>
                    <asp:ListItem>2Ton</asp:ListItem>
                    <asp:ListItem>2.5Ton</asp:ListItem>
                    <asp:ListItem>3.5Ton</asp:ListItem>
                    <asp:ListItem>4Ton</asp:ListItem>
                    <asp:ListItem>5Ton</asp:ListItem>
                    <asp:ListItem>6.5Ton</asp:ListItem>
                    <asp:ListItem>7.5Ton</asp:ListItem>
                    <asp:ListItem>9Ton</asp:ListItem>
                    <asp:ListItem>10Ton</asp:ListItem>
                    <asp:ListItem>12Ton</asp:ListItem>
                    <asp:ListItem>15Ton</asp:ListItem>
                    <asp:ListItem>20Ton</asp:ListItem>
                    <asp:ListItem>21Ton</asp:ListItem>
                    <asp:ListItem>24Ton</asp:ListItem>
                    <asp:ListItem>27Ton</asp:ListItem>
                    <asp:ListItem>40Ton</asp:ListItem>
                    <asp:ListItem>50 to 100Ton</asp:ListItem>
                    <asp:ListItem>100 to 200Ton</asp:ListItem>
                    <asp:ListItem>200Ton 0r above</asp:ListItem>
               </asp:DropDownList>
              <asp:RequiredFieldValidator ControlToValidate="ddlWeight" ID="RequiredFieldValidator6" ValidationGroup="abc" ForeColor="Red"   ErrorMessage="Please Select Weight" runat="server" ></asp:RequiredFieldValidator>
          </fieldset>
          
          <fieldset>
            <label> Suggested Freight: </label>
           	<input type="text" class="wpcf7-textarea" runat="server" id="txtFreight">
             
          </fieldset>
         
   
          
        </div>
        </div>
         <div class="col-md-6">
          <div class="wpcf7 clearfix">
           <fieldset>
            <label> <span class="required">*</span> State: </label>
              <asp:DropDownList ID="ddlCity" class="wpcf7-form-control-wrap wpcf7-select" runat="server">
                                                         <asp:ListItem></asp:ListItem>
                                                         <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                                         <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                                         <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                                         <asp:ListItem>Assam</asp:ListItem>
                                                         <asp:ListItem>Bihar</asp:ListItem>
                                                         <asp:ListItem>Chandigarh</asp:ListItem>
                                                         <asp:ListItem>Chhattisgarh</asp:ListItem>
                                                         <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                                                         <asp:ListItem>Daman and Diu</asp:ListItem>
                                                         <asp:ListItem>National Capital Territory of Delhi</asp:ListItem>
                                                         <asp:ListItem>Goa</asp:ListItem>
                                                         <asp:ListItem>Gujarat</asp:ListItem>
                                                         <asp:ListItem>Haryana</asp:ListItem>
                                                         <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                                         <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                                         <asp:ListItem>Jharkhand</asp:ListItem>
                                                         <asp:ListItem>Karnataka</asp:ListItem>
                                                         <asp:ListItem>Kerala</asp:ListItem>
                                                         <asp:ListItem>Lakshadweep</asp:ListItem>
                                                         <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                                         <asp:ListItem>Maharashtra</asp:ListItem>
                                                         <asp:ListItem>Manipur</asp:ListItem>
                                                         <asp:ListItem>Meghalaya</asp:ListItem>
                                                         <asp:ListItem>Mizoram</asp:ListItem>
                                                         <asp:ListItem>Nagaland</asp:ListItem>
                                                         <asp:ListItem>Odisha</asp:ListItem>
                                                         <asp:ListItem>Puducherry</asp:ListItem>
                                                         <asp:ListItem>Punjab</asp:ListItem>
                                                         <asp:ListItem>Rajasthan</asp:ListItem>
                                                         <asp:ListItem>Sikkim</asp:ListItem>
                                                         <asp:ListItem>Tamil Nadu</asp:ListItem>
                                                         <asp:ListItem>Telangana</asp:ListItem>
                                                         <asp:ListItem>Tripura</asp:ListItem>
                                                         <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                                         <asp:ListItem>Uttarakhand</asp:ListItem>
                                                         <asp:ListItem>West Bengal</asp:ListItem>
                                                     </asp:DropDownList>
               <asp:RequiredFieldValidator ControlToValidate="ddlCity" ID="RequiredFieldValidator4" ValidationGroup="abc" ForeColor="Red"  ErrorMessage="Please select State" runat="server" ></asp:RequiredFieldValidator>

          </fieldset>
          <fieldset>
          <label> <span class="required">*</span> Comment: </label>
          <textarea rows="8" class="wpcf7-textarea" runat="server" id="txtComments"></textarea>
          <asp:RequiredFieldValidator ControlToValidate="txtComments" ID="RequiredFieldValidator7" ValidationGroup="abc" ForeColor="Red"   ErrorMessage="Please Enter Comment" runat="server" ></asp:RequiredFieldValidator>
          </fieldset>
           
          <fieldset>
            <label> <span class="required">*</span> Name: </label>
           	<input type="text" class="wpcf7-textarea" runat="server" id="txtClient">
              <asp:RequiredFieldValidator ControlToValidate="txtClient" ID="RequiredFieldValidator8" ValidationGroup="abc" ForeColor="Red"  ErrorMessage="Please Enter Name" runat="server" ></asp:RequiredFieldValidator>
          </fieldset>
            
          <fieldset>
            <label> <span class="required">*</span> Mobile No: </label>
           	<input type="text" class="wpcf7-textarea" runat="server" id="txtMobile">
              <asp:RequiredFieldValidator ControlToValidate="txtMobile" ID="RequiredFieldValidator9" ValidationGroup="abc" ForeColor="Red"  ErrorMessage="Please Enter Mobile No" runat="server" ></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Height="2px" Font-Size="Small" runat="server" ControlToValidate="txtMobile" 
                                                         ErrorMessage="Please Enter Correct Mobile No " ForeColor="Red" ValidationGroup="abc" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$"></asp:RegularExpressionValidator>
          </fieldset>
    <asp:LinkButton ID="lnkSubmit" ValidationGroup="abc" CssClass="wpcf7-submit" 
                runat="server" onclick="lnkSubmit_Click">Submit</asp:LinkButton>
         
          </div>
         </div> 
        
        <!-- .col-md-6 end --><!-- .custom-heading end --> 
        
      </div>
      <!-- .col-md-6 end --> 
    </div>
    <!-- .row end --> 
  </div>
  <!-- .container end --> 
</div>
<!-- .page-content end -->
</asp:Content>
