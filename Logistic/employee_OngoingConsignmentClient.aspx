<%@ Page Title="" Language="C#" MasterPageFile="~/employee.Master" AutoEventWireup="true" 
    EnableEventValidation="false" CodeBehind="employee_OngoingConsignmentClient.aspx.cs" Inherits="Logistic.employee_OngoingConsignmentClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="col-sm-12 portlets ui-sortable">
								<div class="row">
							<div class="col-xs-12">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>
						
										<h2 class="panel-title">Ongoing Consignement Tracking</h2>
									</header>
									<div class="panel-body">
										<form class="form-horizontal form-bordered" action="#">
                                           <div class="form-group">
												<label class="col-md-3 control-label">Consignement ID</label>
												<div class="col-md-6">
													 <asp:DropDownList ID="ddlConsignementID" class="form-control populate" 
                                                         runat="server" AutoPostBack="True" 
                                                         onselectedindexchanged="ddlConsignementID_SelectedIndexChanged">
                                                     </asp:DropDownList>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">Load From</label>
												<div class="col-md-6">
													<input type="text" class="form-control" readonly="readonly" runat="server" id="txtFrom">
												</div>
											</div>
                                            <div class="form-group">
												<label class="col-md-3 control-label">Unload To</label>
												<div class="col-md-6">
													<input type="text" class="form-control" readonly="readonly" runat="server" id="txtTo">
												</div>
											</div>
                                           <div class="form-group">
												<label class="col-md-3 control-label">Consigner Name </label>
												<div class="col-md-6">
													<asp:DropDownList ID="ddlConsigner" class="form-control populate" runat="server">
                                                   </asp:DropDownList>
												</div>
											</div>
                                             <div class="form-group">
												<label class="col-md-3 control-label">Consignee Name/ID </label>
												<div class="col-md-6">
													<input type="text" class="form-control" readonly="readonly" runat="server" id="txtConsigneeId">
												</div>
											</div>
                                           <div class="form-group">
												<label class="col-md-3 control-label" for="inputDefault">Booking Date</label>
												<div class="col-md-6">
													<input type="text" class="form-control" readonly="readonly" runat="server" id="txtBookingDate">
												</div>
											</div>
                                             <div class="form-group">
												<label class="col-md-3 control-label" for="inputDefault">Delivery Date</label>
												<div class="col-md-6">
													<input type="text" class="form-control" readonly="readonly" runat="server" id="txtDeliveryDate">
												</div>
											</div>
                                             <div class="form-group">
												<label class="col-md-3 control-label">Delivery Status</label>
												<div class="col-md-6">
													<input type="text" class="form-control" readonly="readonly" runat="server" id="txtDeliveryStatus">
												</div>
											</div>
                                              <div class="form-group">
												<label class="col-md-3 control-label" for="inputDefault">Delivery Rem</label>
												<div class="col-md-6">
													
                                                     <textarea id="txtDeliveryRem" runat="server" readonly="readonly" name="example-text-input" class="form-control" cols="20" rows="5"></textarea>
												</div>
											</div>
                                              <div class="form-group">
												<label class="col-md-3 control-label" for="inputDefault">Receiver Name</label>
												<div class="col-md-6">
													<input type="text" class="form-control" readonly="readonly" runat="server" id="txtReceiverName">
												</div>
											</div>
                                             <div class="form-group">
												<label class="col-md-3 control-label" for="inputDefault">Mobile No</label>
												<div class="col-md-6">
													<input type="text" class="form-control" readonly="readonly" runat="server" id="txtMobileNo">
												</div>
											</div>
                                        
										</form>
                                       
									</div>
                                    <footer class="panel-footer">
                                          
                                            <asp:LinkButton ID="btnCancel" onclick="btnCancel_Click" CssClass="btn btn-default" runat="server"> Cancel</asp:LinkButton>
                 
									</footer>
								</section>
							</div>
						</div>
						</div>
</asp:Content>
