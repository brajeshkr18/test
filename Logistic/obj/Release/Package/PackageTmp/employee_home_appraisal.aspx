<%@ Page Title="" Language="C#" MasterPageFile="~/employee.Master" AutoEventWireup="true" CodeBehind="employee_home_appraisal.aspx.cs" Inherits="Logistic.employee_home_appraisal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">

                                <div class="col-md-8 col-lg-4 col-xl-4">
									<section class="panel panel-featured-left panel-featured-primary">
                                 
										<div class="panel-body">
											<div class="widget-summary">
                                               <a href="employee_Appraisal.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-primary">
														<i class="fa fa-user" aria-hidden="true"></i>
													</div>
												</div>
                                                 </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title"> Self Appraisal </h4>
														<%--<div class="info">
															<strong class="amount"><asp:Label ID="lblTodayGenerateBill" runat="server" Text=""></asp:Label></strong>
															
														</div>--%>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="employee_Appraisal.aspx">(View Self)</a>
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
                                             <a href="employee_Manager_Appraisal.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-tertiary">
														<i class="fa fa-user" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title"> Manager Appraisal </h4>
														<%--<div class="info">
															<strong class="amount"> <asp:Label ID="lblTotalGenerateBill" runat="server" Text=""></asp:Label></strong>
														</div>--%>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="employee_Manager_Appraisal.aspx">(View )</a>
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
                                             <a href="employee_employee_Appraisal.aspx">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-quartenary">
														<i class="fa fa-user" aria-hidden="true"></i>
													</div>
												</div>
                                                </a>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Employee Appraisal</h4>
														<%--<div class="info">
															<strong class="amount"> <asp:Label ID="lblTotalPending" runat="server" Text=""></asp:Label></strong>
														</div>--%>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="employee_employee_Appraisal.aspx">(View )</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
                             
                                 
					</div>
</asp:Content>
