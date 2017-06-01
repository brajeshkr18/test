<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Career.aspx.cs" Inherits="Logistic.Career" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <!-- .header-wrapper.header-transparent end -->

        <!-- .page-title start -->
        <div class="page-title-style01 page-title-negative-top pt-bkg16">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Trucking - Careers</h1>

                        <div class="breadcrumb-container">
                            <ul class="breadcrumb clearfix">
                                <li>You are here:</li>
                                <li>

                                    <a href="index.html">Home</a>
                                </li>
                                <li>
                                    <a href="about03.html">About</a>
                                </li>

                                <li>
                                    <a href="#">Careers</a>
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
                    <aside class="col-md-3 aside aside-left">
                        <ul class="aside-widgets">
                            <li class="widget widget_nav_menu clearfix">
                                <div class="title">
                                    <h3>company</h3>
                                </div>

                                <ul class="menu">
                                    <li class="menu-item">
                                        <a href="about01.html">About simple</a>
                                    </li>

                                    <li class="menu-item">
                                        <a href="about02.html">About compact</a>
                                    </li>

                                    <li class="menu-item">
                                        <a href="about03.html">About with sidebar</a>
                                    </li>

                                    <li class="menu-item">
                                        <a href="simple-page-title.html">Simple page title</a>
                                    </li>

                                    <li class="menu-item">
                                        <a href="company-history.html">Company history</a>
                                    </li>

                                    <li class="menu-item">
                                        <a href="events.html">Company Events</a>
                                    </li>

                                    <li class="menu-item">
                                        <a href="clients.html">Company clients</a>
                                    </li>

                                    <li class="menu-item current-menu-item">
                                        <a href="careers.html">Careers</a>
                                    </li>

                                    <li class="menu-item">
                                        <a href="driver-application.html">Online driver application</a>
                                    </li>
                                </ul><!-- .menu end -->
                            </li><!-- .widget.widget_nav_menu end -->

                            <!-- .widget.widget-text start -->
                            <li class="widget widget-text">
                                <div class="title">
                                    <h3>contact us</h3>
                                </div>

                                <img src="img/pics/locations.jpg" alt="contact us"/>

                                <br />

                                <p>
                                    Let us know what can we do for you. Contact 
                                    us today!
                                </p>

                                <a href="contact-simple.html" class="read-more">
                                    <span>
                                        Contact us
                                        <i class="fa fa-chevron-right"></i>
                                    </span>
                                </a>
                            </li><!-- .widget-text end -->
                        </ul><!-- .aside-widgets end -->
                    </aside><!-- .aside.aside-left end -->

                    <div class="col-md-9">                        
                        <div class="custom-heading">
                            <h2>careers</h2>
                        </div>

                        <img class="float-right" src="img/pics/img41.jpg"  alt=""/>

                        <p>
                            I throw myself down among the tall grass by the 
                            trickling stream; and, as I lie close to the earth,
                            a thousand unknown plants are noticed by me: when I 
                            hear the buzz of the little world among the stalks, 
                            and grow familiar with the countless indescribable 
                            forms of the insects and flies, then I feel the 
                            presence of the Almighty, who formed us in his own 
                            image, and the breath.

                            <br /><br />
                            On the other hand, we denounce with righteous
                            indignation and dislike men who are so beguiled and 
                            demoralized by the charms of pleasure of the moment, 
                            so blinded by desire, that they cannot foresee the 
                            pain and trouble that are bound to ensue; and equal 
                            blame belongs to those who fail in their duty.
                            In a free hour, when our power of choice is 
                            untrammelled and when nothing prevents our being 
                            able to do what we like best, every pleasure is to 
                            be welcomed and every pain avoided. But in certain 
                            circumstances and owing to the claims of duty or 
                            the obligations of business it will frequently occur
                            that pleasures have to be repudiated and annoyances
                            accepted. The wise man therefore always holds in 
                            these matters to this principle of selection: he 
                            rejects pleasures to secure other greater pleasures,
                            or else he endures pains to avoid worse pains.
                        </p>

                        <br />

                        <div class="custom-heading">
                            <h3>opened positions</h3>
                        </div><!-- .custom-heading end -->

                        <div class="accordion careers">
                           <%-- <div class="title active">
                                <a href='#' class="clearfix">
                                    <span class='job-position'>Lead Ingineer/Technologist,</span> 
                                    <span class='job-place'>Paris, France, Europe,</span>  
                                    <span class='job-end-date'>END DATE: MAY 15 2015</span>
                                </a>
                            </div>

                            <div class="content clearfix">
                                <h4>Job summary</h4>
                                <p>
                                    At vero eos et accusamus et iusto odio 
                                    dignissimos ducimus qui blanditiis 
                                    praesentium voluptatum deleniti atque 
                                    corrupti quos dolores et quas molestias 
                                    excepturi sint occaecati cupiditate non 
                                    provident, similique sunt in culpa qui 
                                    officia deserunt mollitia animi, id est 
                                    laborum et dolorum fuga. Et harum quidem 
                                    rerum facilis est et expedita distinctio. 
                                    Nam libero tempore, cum soluta nobis est
                                    eligendi optio cumque nihil impedit quo
                                    minus id quod maxime placeat facere possimus, 
                                    omnis voluptas assumenda est, omnis dolor
                                    repellendus. Temporibus autem quibusdam et 
                                    aut officiis debitis aut rerum necessitatibus 
                                    saepe eveniet ut et voluptates repudiandae
                                    sint et molestiae non recusandae. Itaque 
                                    earum rerum hic tenetur a sapiente delectus,
                                    ut aut reiciendis voluptatibus maiores alias
                                    consequatur aut perferendis doloribus 
                                    asperiores repellat.
                                </p>
                                <br />

                                <h4>Your responsibilities:</h4>

                                <p>
                                    At vero eos et accusamus et iusto odio 
                                    dignissimos ducimus qui blanditiis
                                    praesentium voluptatum deleniti atque 
                                    corrupti quos dolores et quas molestias
                                    excepturi sint occaecati cupiditate non 
                                    provident, similique sunt in culpa qui 
                                    officia deserunt mollitia.
                                </p>

                                <ul class='fa-ul'>
                                    <li>
                                        <i class="fa fa-li fa-long-arrow-right"></i>
                                        Creating value for a customer
                                    </li>

                                    <li>
                                        <i class="fa fa-li fa-long-arrow-right"></i>
                                        Building a strong infrastructure
                                    </li>

                                    <li>
                                        <i class="fa fa-li fa-long-arrow-right"></i>
                                        Synchronized demand and supply
                                    </li>

                                    <li>
                                        <i class="fa fa-li fa-long-arrow-right"></i>
                                        Quality measurement and monitoring
                                    </li>
                                </ul><!-- .fa-ul end -->

                                <br />
                                <asp:linkButton class="btn btn-big"  ID="btnSend" OnClick="btnSend_mail" runat="server">
                                    <span>
                                        Send Mail
                                    </span>
                                </asp:linkButton>

                               <%-- <a class="btn btn-big" href="">
                                    <span>
                                        view more
                                    </span>
                                </a>
                            </div>--%>

                            <div class="title">
                                <a href='#' class="clearfix">
                                    <span class='job-position'>WAREHOUSE OFFICER,</span> 
                                    <span class='job-place'>Paris, France, Europe,</span>  
                                    <span class='job-end-date'>END DATE: MAY 22 2015</span>
                                </a>
                            </div><!-- .title end -->

                             <div class="content clearfix" style="display: block;">
                                <h4>Job summary</h4>
                                <p>
                                    At vero eos et accusamus et iusto odio 
                                    dignissimos ducimus qui blanditiis 
                                    praesentium voluptatum deleniti atque 
                                    corrupti quos dolores et quas molestias 
                                    excepturi sint occaecati cupiditate non 
                                    provident, similique sunt in culpa qui 
                                    officia deserunt mollitia animi, id est 
                                    laborum et dolorum fuga. Et harum quidem 
                                    rerum facilis est et expedita distinctio. 
                                    Nam libero tempore, cum soluta nobis est
                                    eligendi optio cumque nihil impedit quo
                                    minus id quod maxime placeat facere possimus, 
                                    omnis voluptas assumenda est, omnis dolor
                                    repellendus. Temporibus autem quibusdam et 
                                    aut officiis debitis aut rerum necessitatibus 
                                    saepe eveniet ut et voluptates repudiandae
                                    sint et molestiae non recusandae. Itaque 
                                    earum rerum hic tenetur a sapiente delectus,
                                    ut aut reiciendis voluptatibus maiores alias
                                    consequatur aut perferendis doloribus 
                                    asperiores repellat.
                                </p>
                                <br />

                                <h4>Your responsibilities:</h4>

                                <p>
                                    At vero eos et accusamus et iusto odio 
                                    dignissimos ducimus qui blanditiis
                                    praesentium voluptatum deleniti atque 
                                    corrupti quos dolores et quas molestias
                                    excepturi sint occaecati cupiditate non 
                                    provident, similique sunt in culpa qui 
                                    officia deserunt mollitia.
                                </p>

                                <ul class='fa-ul'>
                                    <li>
                                        <i class="fa fa-li fa-long-arrow-right"></i>
                                        Creating value for a customer
                                    </li>

                                    <li>
                                        <i class="fa fa-li fa-long-arrow-right"></i>
                                        Building a strong infrastructure
                                    </li>

                                    <li>
                                        <i class="fa fa-li fa-long-arrow-right"></i>
                                        Synchronized demand and supply
                                    </li>

                                    <li>
                                        <i class="fa fa-li fa-long-arrow-right"></i>
                                        Quality measurement and monitoring
                                    </li>
                                </ul><!-- .fa-ul end -->
                        
                        <br />

                        <!-- .contact form start -->
                        <div class="wpcf7 clearfix" >
                        
                            <fieldset>
                                <label>
                                    <span class="required">*</span> Full Name:
                                </label>

                                <input type="text" class="wpcf7-text" id="txtname" runat="server">
                            </fieldset>

                            <fieldset>
                                <label>
                                    <span class="required">*</span> Phone:
                                </label>

                                <input type="text" class="wpcf7-text" id="txtphone" runat="server">
                            </fieldset>

                         
                                <label>
                                    <span class="required">*</span> Email:
                                </label>
                                <asp:TextBox type="text" class="wpcf7-text" id="txtmail"  runat="server"/>
                                <%--<input type="text" class="wpcf7-text" id="contactemail"  runat="server" />--%>
                           <fieldset>
                                <label>
                                    <span class="required">*</span> Upload Attachement:
                                </label>

                                     <asp:FileUpload id="FileUploadControl" runat="server" />
                            </fieldset>
                           
                           
                            <br />
                          <asp:linkButton class="btn btn-big"  ID="LinkButton1" OnClick="btnSend_mail" runat="server">
                                    <span>
                                        Send Mail
                                    </span>
                                </asp:linkButton>
                        </div><!-- .wpcf7 end -->
                    </div>
                               
                                
                            </div><!-- .content end -->

                          <!-- .content end -->
                        </div><!-- .accordion.careers end -->
                    </div><!-- .col-md-9 end -->
                </div><!-- .row end -->
            </div><!-- .container end -->
        </div><!-- .page-content end -->       

        <!-- #footer-wrapper end -->

        <script src="js/jquery-2.1.4.min.js"></script><!-- jQuery library -->
        <script src="js/bootstrap.min.js"></script><!-- .bootstrap script -->
        <script src="js/jquery.srcipts.min.js"></script><!-- modernizr, retina, stellar for parallax -->  
        <script src="js/jquery.dlmenu.min.js"></script><!-- for responsive menu -->
        <script src="js/include.js"></script><!-- custom js functions -->
    </body>
</asp:Content>
