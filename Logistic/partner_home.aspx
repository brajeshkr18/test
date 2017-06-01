<%@ Page Title="" Language="C#" MasterPageFile="~/partner.Master" AutoEventWireup="true" CodeBehind="partner_home.aspx.cs" Inherits="Logistic.partner_home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
						
						      <div class="col-md-3 col-lg-6 col-xl-3">
							
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-primary">
                                   
										<div class="panel-body">
											<div class="widget-summary">
                                             <a href="partner_home_request.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-primary">
														<i class="fa fa-paper-plane" aria-hidden="true"></i>
													</div>
												</div>
                                                 </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title"> Request</h4>
														
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="partner_home_request.aspx">(View )</a>
													</div>
												</div>
											</div>
										</div>
                                   
									</section>
								</div>
                                 
                                <div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-tertiary">
										<div class="panel-body">
											<div class="widget-summary">
                                             <a href="partner_ConsignementTracking.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-tertiary">
														<i class="fa fa-truck" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Consignement</h4>
														
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="partner_ConsignementTracking.aspx">(View )</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
                                </div>
                                <div class="col-md-3 col-lg-6 col-xl-3">
                                 <div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-quartenary">
										<div class="panel-body">
											<div class="widget-summary">
                                              <a href="partner_home_Bill.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-quartenary">
														<i class="fa fa-inr" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Bill</h4>
														
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="partner_home_Bill.aspx">(View )</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
                                
								
                           
                          
						</div>
					</div>


</asp:Content>
