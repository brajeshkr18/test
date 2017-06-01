<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
     enableEventValidation="true" CodeBehind="Contact.aspx.cs" Inherits="Logistic.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <!-- .page-title start -->
        <div class="page-title-style01 page-title-negative-top pt-bkg08">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1></h1>

                        <div class="breadcrumb-container">
                            <ul class="breadcrumb clearfix">
                                <li>You are here:</li>
                                <li>
                                    <a href="#">Contact</a>
                                </li>
                            </ul><!-- .breadcrumb end -->
                        </div><!-- .breadcrumb-container end -->
                    </div><!-- .col-md-12 end -->
                </div><!-- .row end -->
            </div><!-- .container end -->
        </div><!-- .page-title-style01.page-title-negative-top end -->

        <div class="page-content">
            <div class="container">
                <div class="row">



                    <div class="col-md-6">
                        <div class="custom-heading">
                            <h3>your inquiry</h3>
                        </div><!-- .custom-heading.left end -->

                        <p>
                           Please send your inquiry.
                        </p>

                        <br />

                        <!-- .contact form start -->
                        <div class="wpcf7 clearfix" >
                            <fieldset>
                                <label>
                                    <span class="required">*</span> Your request:
                                </label>

                                <select class="wpcf7-form-control-wrap wpcf7-select" runat="server" id="ddcontactinquiry">
                                    <option value="I need an offer for contract logistics">I need an offer for contract logistics</option>
                                    <option value="I need an offer for air freight">I need an offer for air freight</option>
                                    <option value="I want to become your partner">I want to become your partner</option>
                                    <option value="I have some other request">I have some other request</option>
                                </select>
                            </fieldset>

                            <fieldset>
                                <label>
                                    <span class="required">*</span> First Name:
                                </label>

                                <input type="text" class="wpcf7-text" id="Firstname" runat="server">
                            </fieldset>

                            <fieldset>
                                <label>
                                    <span class="required">*</span> Last Name:
                                </label>

                                <input type="text" class="wpcf7-text" id="contactlastname" runat="server">
                            </fieldset>

                         
                                <label>
                                    <span class="required">*</span> Email:
                                </label>
                                <asp:TextBox type="text" class="wpcf7-text" id="contactemail"  runat="server"/>
                                <%--<input type="text" class="wpcf7-text" id="contactemail"  runat="server" />--%>
                           

                            <fieldset>
                                <label>
                                    <span class="required">*</span> Message:
                                </label>

                                <textarea rows="8" class="wpcf7-textarea" id="contactmessage"  runat="server"> </textarea>
                            </fieldset>
                            <br />
                            <%--<asp:LinkButton ID="btnSend" OnClick="btnSend_Click" runat="server"   Text="Send Mail"  class="btn btn-big" />--%>
                            <asp:linkButton class="btn btn-big"  ID="btnSend" OnClick="btnSend_Click" runat="server">
                                    <span>
                                        Send Mail
                                    </span>
                                </asp:linkButton>
                        </div><!-- .wpcf7 end -->
                    </div><!-- .col-md-6 end -->

                    <div class="col-md-6">
                        <div class="custom-heading">
                            <h3>headquarters</h3>
                        </div><!-- .custom-heading end -->

                        <div id="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3429.3164866721363!2d76.79139061521127!3d30.737610381635466!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390ff2789486b361%3A0x9c15c4759ba38f27!2sMadhya+Marg%2C+Sector+8C%2C+Sector+8%2C+Chandigarh!5e0!3m2!1sen!2sin!4v1487938637867" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe></div>

                        <div class="custom-heading">
                            <h4>company information</h4>
                        </div><!-- .custom-heading end -->

                        <address>
                            <span class="text-big colored">Core Logistic Private Limited</span> <br />
                            SCO: 90-91-92, 2nd Floor, Sector- 8C, Madhya Marg, <br />
                            CHANDIGARH - 160 018,(UT), INDIA
                        </address>

                        <span class="text-small colored">
                         Land Line: +91 172 5002828,5002929,<br />
                         Fax Line: +91 172 4617666  
                        </span>
                        <br />
                        Email: <a href="mailto:">support@Logistic.com</a>
                    </div><!-- .col-md-6 end -->
                </div><!-- .row end -->
            </div><!-- .container end -->
        </div><!-- .page-content end -->
</asp:Content>
