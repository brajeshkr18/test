<%@ Page Title="" Language="C#" MasterPageFile="~/partner.Master" AutoEventWireup="true" CodeBehind="partner_home_request.aspx.cs" Inherits="Logistic.partner_home_request" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
						
					
								<div class="col-md-8 col-lg-4 col-xl-4">
									<section class="panel panel-featured-left panel-featured-primary">
                                 
										<div class="panel-body">
											<div class="widget-summary">
                                               <a href="partner_Today_Ask_For_Vehicle.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-primary">
														<i class="fa fa-star-o" aria-hidden="true"></i>
													</div>
												</div>
                                                 </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Today Ask For Vehicle</h4>
														<div class="info">
															<strong class="amount"><asp:Label ID="lblTodayAskVehicle" runat="server" Text=""></asp:Label></strong>
															
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="partner_Today_Ask_For_Vehicle.aspx">(View Today)</a>
													</div>
												</div>
											</div>
										</div>
                                   
									</section>
								</div>
                                
                                <div class="col-md-8 col-lg-4 col-xl-4">
									<section class="panel panel-featured-left panel-featured-tertiary">
										<div class="panel-body">
											<div class="widget-summary">
                                             <a href="partner_Today_Vehicle_Request.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-tertiary">
														<i class="fa fa-truck" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Today Vehicle Request</h4>
														<div class="info">
															<strong class="amount"> <asp:Label ID="lblTodayVehicle" runat="server" Text=""></asp:Label></strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="partner_Today_Vehicle_Request.aspx">(View Today)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
                                
                                
                                <div class="col-md-8 col-lg-4 col-xl-4">
									<section class="panel panel-featured-left panel-featured-quartenary">
										<div class="panel-body">
											<div class="widget-summary">
                                             <a href="partner_Ask_for_Vehicle.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-quartenary">
														<i class="fa fa-star" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Ask For Vehicle</h4>
														<div class="info">
															<strong class="amount"> <asp:Label ID="lblTotalAskVehicle" runat="server" Text=""></asp:Label></strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="partner_Ask_for_Vehicle.aspx">(View All)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
                                

								<div class="col-md-8 col-lg-4 col-xl-4">
									<section class="panel panel-featured-left panel-featured-secondary">
										<div class="panel-body">
											<div class="widget-summary">
                                              <a href="partner_RequestVehicle.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-secondary">
														<i class="fa fa-truck" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Vehicle Request</h4>
														<div class="info">
															<strong class="amount"><asp:Label ID="lblTotalVehicle" runat="server" Text=""></asp:Label></strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="partner_RequestVehicle.aspx">(View All)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								
							
					</div>
</asp:Content>
