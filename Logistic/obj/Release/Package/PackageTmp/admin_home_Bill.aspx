<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_home_Bill.aspx.cs" Inherits="Logistic.admin_home_Bill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">

								<div class="col-md-8 col-lg-4 col-xl-4">
									<section class="panel panel-featured-left panel-featured-primary">
                                 
										<div class="panel-body">
											<div class="widget-summary">
                                               <a href="admin_Today_GenerateInvoice.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-primary">
														<i class="fa fa-star" aria-hidden="true"></i>
													</div>
												</div>
                                                 </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Today Generate Bill </h4>
														<div class="info">
															<strong class="amount"><asp:Label ID="lblTodayGenerateBill" runat="server" Text=""></asp:Label></strong>
															
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="admin_Today_GenerateInvoice.aspx">(View Today)</a>
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
                                             <a href="admin_GenerateInvoice.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-tertiary">
														<i class="fa fa-star" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Generate Bill </h4>
														<div class="info">
															<strong class="amount"> <asp:Label ID="lblTotalGenerateBill" runat="server" Text=""></asp:Label></strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="admin_GenerateInvoice.aspx">(View All)</a>
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
                                             <a href="admin_OldInvoice.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-quartenary">
														<i class="fa fa-star" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Pending Bill</h4>
														<div class="info">
															<strong class="amount"> <asp:Label ID="lblTotalPending" runat="server" Text=""></asp:Label></strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="admin_OldInvoice.aspx">(View Pending)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
                              
							
                            <div class="row">
                            <div class="col-md-8 col-lg-4 col-xl-4">
									<section class="panel panel-featured-left panel-featured-secondary">
										<div class="panel-body">
											<div class="widget-summary">
                                              <a href="admin_Invoice_Rejection.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-secondary">
														<i class="fa fa-star" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Bill Rejection Mail</h4>
														<div class="info">
															<strong class="amount"><asp:Label ID="lblTotalBillRejection" runat="server" Text=""></asp:Label></strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="admin_Invoice_Rejection.aspx">(View Reject)</a>
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
                                             <a href="admin_InvoiceAccepted.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-tertiary">
														<i class="fa fa-star" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Bill Sent to Account </h4>
														<div class="info">
															<strong class="amount"> <asp:Label ID="lblTotalBillAccept" runat="server" Text=""></asp:Label></strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="admin_InvoiceAccepted.aspx">(View Accept)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
                            
                            </div>
</asp:Content>
