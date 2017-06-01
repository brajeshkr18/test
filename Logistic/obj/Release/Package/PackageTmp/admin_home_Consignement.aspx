<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_home_Consignement.aspx.cs" Inherits="Logistic.admin_home_Consignement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
						
						<div class="col-md-6 col-lg-12 col-xl-12">
							<div class="row">
								<div class="col-md-8 col-lg-4 col-xl-4">
									<section class="panel panel-featured-left panel-featured-primary">
                                 
										<div class="panel-body">
											<div class="widget-summary">
                                               <a href="admin_Today_Consignement.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-primary">
														<i class="fa fa-star-o" aria-hidden="true"></i>
													</div>
												</div>
                                                 </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Today Consignement</h4>
														<div class="info">
															<strong class="amount"><asp:Label ID="lblTodayConsignement" runat="server" Text=""></asp:Label></strong>
															
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="admin_Today_Consignement.aspx">(View Today)</a>
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
                                             <a href="admin_NewConsignment.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-tertiary">
														<i class="fa fa-star-o" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Consignement</h4>
														<div class="info">
															<strong class="amount"> <asp:Label ID="lblTotalConsignement" runat="server" Text=""></asp:Label></strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="admin_NewConsignment.aspx">(View All)</a>
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
                                             <a href="admin_OldConsignmentClient.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-quartenary">
														<i class="fa fa-star-o" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Old Consignement</h4>
														<div class="info">
															<strong class="amount"> <asp:Label ID="lblOldConsignement" runat="server" Text=""></asp:Label></strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="admin_OldConsignmentClient.aspx">(View Old)</a>
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
                                              <a href="admin_OngoingConsignmentClient.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-secondary">
														<i class="fa fa-star-o" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Ongoing Consignement</h4>
														<div class="info">
															<strong class="amount"><asp:Label ID="lblOngoingConsignement" runat="server" Text=""></asp:Label></strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="admin_OngoingConsignmentClient.aspx">(View )</a>
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
                                             <a href="admin_ConsignementTracking.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-quartenary">
														<i class="fa fa-star-o" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Consignement Tracking</h4>
														<%--<div class="info">
															<strong class="amount"> <asp:Label ID="lblTotalLoad" runat="server" Text=""></asp:Label></strong>
														</div>--%>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="admin_ConsignementTracking.aspx">(View )</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
							</div>
						</div>
					</div>
</asp:Content>
