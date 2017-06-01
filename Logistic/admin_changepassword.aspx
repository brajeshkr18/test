<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_changepassword.aspx.cs" Inherits="Logistic.admin_changepassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="col-sm-6 portlets ui-sortable">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>

										<h2 class="panel-title">Change Password Form</h2>
										
									</header>
									<div class="panel-body">
										<div class="form-group">
											<label class="col-sm-4 control-label">Old Password: </label>
											<div class="col-sm-8">
												<input type="text" id="txtOld" runat="server" class="form-control" placeholder="Your Old Password.." name="username" data-bv-field="username">
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtOld" ErrorMessage="*" ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">New Password: </label>
											<div class="col-sm-8">
												<input type="text" id="txtNewPassword" runat="server" class="form-control" placeholder="Your New Password.." name="username" data-bv-field="username">
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtNewPassword" ErrorMessage="*" ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
                       
											</div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label">Conform New Password: </label>
											<div class="col-sm-8">
											<input type="text" id="txtConform" runat="server" class="form-control" name="username" placeholder="Conform Your New Password" data-bv-field="username">
                                     <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                              ErrorMessage="Don't Match Your password" ForeColor="Red" ControlToCompare="txtNewPassword" 
                                              ControlToValidate="txtConform" ValidationGroup="abc"></asp:CompareValidator>
											</div>
										</div>
									</div>
									<footer class="panel-footer">
                                            <asp:LinkButton ID="btnsubmit" onclick="btnsubmit_Click1" ValidationGroup="abc" CssClass="btn btn-primary" runat="server"><i class="fa fa-angle-right"></i> Submit</asp:LinkButton>
                                            <asp:LinkButton ID="btnCancel" onclick="btnCancel_Click" CssClass="btn btn-default" runat="server"><i class="fa fa-repeat"></i> Cancel</asp:LinkButton>

                                             <asp:Label ID="lblId" runat="server" Text="Label" Visible="False"></asp:Label>
										
									</footer>
								</section>
						</div>
</asp:Content>
