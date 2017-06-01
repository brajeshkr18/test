﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_Partner.aspx.cs" Inherits="Logistic.admin_Partner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function DeleteItem() {
        if (confirm("Are you sure you want to delete Partner ...?")) {
            return true;
        }
        return false;
    }
 </script>

<style type="text/css">
    .style1
        { 
            padding: 4px 10px 4px 15px;
 
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1" >
 <asp:View ID="View1" runat="server"> 
       <div class="col-sm-6 portlets ui-sortable">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>

										<h2 class="panel-title">Partner Form</h2>
										
									</header>
									<div class="panel-body">
										<div class="form-group">
											<label class="col-sm-4 control-label">Partner Name: </label>
											<div class="col-sm-8">
												 <input type="text" id="txtName" runat="server" class="form-control placeholder-no-fix" placeholder="Name">
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                                                            ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
                                            
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">Email: </label>
											<div class="col-sm-8">
												<input type="text" id="txtEmail" runat="server" class="form-control placeholder-no-fix" placeholder="E-mail">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                                                            ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
                          
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                                                ErrorMessage="Please Enter Valid Email Address" ControlToValidate="txtEmail" Height="1px" ForeColor="Red" 
                                                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                                                ValidationGroup="abc"></asp:RegularExpressionValidator>
											</div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label">Mobile: </label>
											<div class="col-sm-8">
												 <input type="text" id="txtMobile" runat="server" onkeypress="return isNumberKey(event)" class="form-control placeholder-no-fix" placeholder="Mobile No">
                                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Height="2px" Font-Size="Small" runat="server" ControlToValidate="txtMobile" 
                                                         ErrorMessage="Please Enter Correct Mobile No " ForeColor="Red" ValidationGroup="abc" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$"></asp:RegularExpressionValidator>

											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Partner Id: </label>
											<div class="col-sm-8">
												 <input type="text" id="txtUserId" runat="server" class="form-control placeholder-no-fix" placeholder="Partner Id (Login Id)">
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                                            ControlToValidate="txtUserId" ErrorMessage="*" ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
                                            
											</div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label">Password: </label>
											<div class="col-sm-8">
												 <input type="text" id="txtpassword" runat="server" class="form-control placeholder-no-fix" placeholder="Password*****">
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                                        ControlToValidate="txtpassword" ErrorMessage="*" ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
											</div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label">City: </label>
											<div class="col-sm-8">
												 <input type="text" id="txtCity" runat="server" class="form-control placeholder-no-fix" placeholder="">
                                                        <input type="hidden" value="">
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">State: </label>
											<div class="col-sm-8">
											  <input type="text" id="txtState" runat="server" class="form-control placeholder-no-fix" placeholder="">
                                                        <input type="hidden" value="">
											</div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label">Address: </label>
											<div class="col-sm-8">
                                                  <textarea id="txtAddress" runat="server" class="form-control placeholder-no-fix" rows="3" cols="20"></textarea>
												
                                                  <input type="hidden" value="">
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Status: </label>
											<div class="col-sm-8">
												 <asp:DropDownList ID="ddlStatus" class="form-control placeholder-no-fix" runat="server">
                                                                 <asp:ListItem>Active</asp:ListItem>
                                                                 <asp:ListItem>Inactive</asp:ListItem>
                                                             </asp:DropDownList>
						                                 <asp:RequiredFieldValidator ControlToValidate="ddlStatus" ID="RequiredFieldValidator17"
                                                   ValidationGroup="abc" ForeColor="Red"  ErrorMessage="Please select Status" InitialValue="0" runat="server"  Display="Dynamic"></asp:RequiredFieldValidator>
                
											</div>
										</div>
									</div>
									<footer class="panel-footer">
                                            <asp:LinkButton ID="btnsubmit" onclick="btnsubmit_Click1" ValidationGroup="abc" CssClass="btn btn-primary" runat="server"> Submit</asp:LinkButton>
                                            <asp:LinkButton ID="btnCancel" onclick="btnCancel_Click" CssClass="btn btn-default" runat="server"> Cancel</asp:LinkButton>
                                             <asp:Label ID="lblId" runat="server" Text="Label" Visible="False"></asp:Label>
										
									</footer>
								</section>
						</div>
           </asp:View>
  <asp:View ID="View2" runat="server">
       
       <div class="row">
        <div class="col-md-12">
						<div class="widget">
							
                            <div class="col-md-12">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>
						
										<h2 class="panel-title">Partner</h2>
									</header>
									<div class="panel-body">
									
                                        <div class="row"><div class="col-sm-9 col-xs-5">
                            <div class="dataTables_length" id="example-datatable_length">
                                  <asp:LinkButton ID="lnkAdd" runat="server"  CssClass="btn btn-primary" onclick="lnkAdd_Click"><i class="gi gi-show_big_thumbnails sidebar-nav-icon"></i> Create&nbsp;&nbsp;</asp:LinkButton>
                                   <asp:Button ID="btnExport" runat="server" Enabled="false" CssClass="btn btn-default" Text="Export To Excel" OnClick = "ExportToExcel" />
                            </div></div><div class="col-sm-3 col-xs-7"><div id="example-datatable_filter" class="dataTables_filter">
                            <label><div class="input-group">
                              <asp:TextBox ID="txtSearch" runat="server" class="form-control" Height="42px" AutoPostBack="True" placeholder="Search" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                              <span class="input-group-addon"><i class="fa fa-search"></i></span>
       
                            </div></label></div></div></div>
                            	<div class="table-responsive">
		  <asp:GridView ID="gridPoll" runat="server" Width="100%" 
        AutoGenerateColumns="False" CellPadding="4" BorderWidth="1px"
                        BorderStyle="Groove" EmptyDataRowStyle-ForeColor="#FFFFFF" EmptyDataText="Sorry, No Data to show."
                        EmptyDataRowStyle-Height="30"  EnableModelValidation="True" 
                    EmptyDataRowStyle-HorizontalAlign="Center" 
                        ForeColor="Black" DataKeyNames="Id" Font-Names="Myriad Pro"
                    onpageindexchanging="gridPoll_PageIndexChanging" 
                    onrowcommand="gridPoll_RowCommand" PageSize="30" >
                        <AlternatingRowStyle />
                        <Columns>                
                             <asp:TemplateField HeaderText = "S.No." ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                </ItemTemplate>
                                 <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="6%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Partner Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("PartnerName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="10%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblemail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="5%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>
                            
                              <asp:TemplateField HeaderText="Mobile" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("Mobile") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="4%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField> 
                            <asp:TemplateField HeaderText="UserId" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserId" runat="server" Text='<%#Eval("UserId") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="4%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Password" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblPassword" runat="server" Text='<%#Eval("Password") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="6%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField> 
                            <asp:TemplateField HeaderText="City" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="6%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField> 
                            <asp:TemplateField HeaderText="State" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblState" runat="server" Text='<%#Eval("State") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="6%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField> 
                          
                             <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("role") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="4%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField> 
                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Actions" ItemStyle-VerticalAlign="Top">
                                                    <ItemTemplate>
                                                    <div class="btn-group">
                                                   <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-default" CommandName="Edit1" Font-Size="18px" CommandArgument='<%#Eval("Id")%>'  AlternateText="Edit"><i class="fa fa-edit"></i></asp:LinkButton>
                                                   <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete1" CssClass="btn btn-default" Font-Size="18px"  CommandArgument='<%#Eval("Id") %>' onclientclick="return DeleteItem()"  AlternateText="Delete"><i class="fa fa-power-off"></i></asp:LinkButton>        
                                                   </div>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                 <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  Width="10%" ></ItemStyle>
                        </asp:TemplateField>
                                                 
                        </Columns>
                                  <EmptyDataRowStyle BackColor="White" ForeColor="GrayText" Height="30px" 
                            HorizontalAlign="Center" BorderColor="#E4E9E7" />
                                 <FooterStyle BackColor="White" Font-Bold="True" Font-Size="Large" 
                            ForeColor="Black" BorderColor="#E4E9E7"/>
                                <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="GrayText"  
                            BorderColor="#E4E9E7" Font-Size="15px" Height="35px" 
                            HorizontalAlign="Center" />
                                <PagerStyle BackColor="White" ForeColor="Black" 
                            HorizontalAlign="Center" BorderColor="#E4E9E7" />
                                <RowStyle BackColor="White" HorizontalAlign="Left" Font-Size="Medium" 
                            ForeColor="GrayText" BorderColor="#E4E9E7" Height="30px" />
                    </asp:GridView>
                    <div style="visibility:hidden;height:10px">
   <asp:GridView ID="GridView1" Visible="true" HeaderStyle-BackColor="#000" HeaderStyle-ForeColor="White"
    RowStyle-BackColor="#D7D8D9" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
    runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging">
    <Columns>
        
        <asp:BoundField DataField="PartnerName" HeaderText="Partner Name" ItemStyle-Width="150px" />
        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="200px" />
        <asp:BoundField DataField="Mobile" HeaderText="Mobile (LoginId)" ItemStyle-Width="150px" />
        <asp:BoundField DataField="Password" HeaderText="Password" ItemStyle-Width="150px" />
         <asp:BoundField DataField="City" HeaderText="City" ItemStyle-Width="150px" />
         <asp:BoundField DataField="State" HeaderText="State" ItemStyle-Width="150px" />
         <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="250px" />
                 
        <asp:BoundField DataField="role" HeaderText="role" ItemStyle-Width="150px" />
    </Columns>
    </asp:GridView>
</div>
										</div>
									</div>
								</section>
							</div>
        
                            </div>

							
					</div>
     </div>           
                    
  </asp:View>
</asp:MultiView>
</asp:Content>
