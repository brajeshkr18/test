﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_state.aspx.cs" Inherits="Logistic.admin_state" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function DeleteItem() {
        if (confirm("Are you sure you want to delete Consigner ...?")) {
            return true;
        }
        return false;
    }
 </script>
<style type="text/css">
    .style1
        { 
            padding: 4px 50px 4px 15px;
 
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

										<h2 class="panel-title">Consigner Form</h2>
										
									</header>
									<div class="panel-body">
										<div class="form-group">
											<label class="col-sm-4 control-label">Consigner: </label>
											<div class="col-sm-8">
												<input type="text" id="txtCategory" runat="server" class="form-control" name="username" data-bv-field="username">
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtCategory" ErrorMessage="*" ValidationGroup="abc"></asp:RequiredFieldValidator>
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
						
										<h2 class="panel-title">Consigner List</h2>
									</header>
									<div class="panel-body">
									
                                        <div class="row"><div class="col-sm-9 col-xs-5">
                            <div class="dataTables_length" id="example-datatable_length">
                                  <asp:LinkButton ID="lnkAdd" runat="server"  CssClass="btn btn-primary" onclick="lnkAdd_Click"><i class="gi gi-show_big_thumbnails sidebar-nav-icon"></i> Create&nbsp;&nbsp;</asp:LinkButton>

                            </div></div><div class="col-sm-3 col-xs-7"><div id="example-datatable_filter" class="dataTables_filter">
                            <label><div class="input-group">
                              <asp:TextBox ID="txtSearch" runat="server" class="form-control" Height="42px" AutoPostBack="True" placeholder="Search" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                              <span class="input-group-addon"><i class="fa fa-search"></i></span>
       
                            </div></label></div></div></div>
                            	<div class="table-responsive">
		<asp:GridView ID="gridState" runat="server" Width="100%" 
        AutoGenerateColumns="False" CellPadding="4" BorderWidth="1px"
                        BorderStyle="Groove" EmptyDataRowStyle-ForeColor="#FFFFFF" EmptyDataText="Sorry, No Data to show."
                        EmptyDataRowStyle-Height="30"  EnableModelValidation="True" 
                    EmptyDataRowStyle-HorizontalAlign="Center" 
                        ForeColor="Black" DataKeyNames="Id" Font-Names="Myriad Pro"
                    onpageindexchanging="gridState_PageIndexChanging" 
                    onrowcommand="gridState_RowCommand" PageSize="30" >
                        <AlternatingRowStyle />
                        <Columns>    
                         <asp:TemplateField HeaderText = "S.No." ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                </ItemTemplate>
                                 <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="2%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>            
                            <asp:TemplateField HeaderText="Consigner Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("StateName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="85%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>           
                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Actions" ItemStyle-VerticalAlign="Top">
                                                    <ItemTemplate>
                                                    <div class="btn-group">
                                                   <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-default" CommandName="Edit1" Font-Size="18px" CommandArgument='<%#Eval("Id")%>'  AlternateText="Edit"><i class="fa fa-edit"></i></asp:LinkButton>
                                                   <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete1" CssClass="btn btn-default" Font-Size="18px"  CommandArgument='<%#Eval("Id") %>' onclientclick="return DeleteItem()"  AlternateText="Delete"><i class="fa fa-power-off"></i></asp:LinkButton>        
                                                   </div>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                 <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  Width="12%" ></ItemStyle>
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
