﻿<%@ Page Title="" Language="C#" MasterPageFile="~/partner.Master" AutoEventWireup="true" CodeBehind="partner_ConsignementTracking.aspx.cs" Inherits="Logistic.partner_ConsignementTracking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style type="text/css">
    .style1
        { 
            padding: 4px 10px 4px 4px;
 
        }
</style>
<script language="Javascript">
       <!--
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
    
       //-->
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1" >
 <asp:View ID="View1" runat="server"> 
       <div class="col-sm-12 portlets ui-sortable">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>

										<h2 class="panel-title"> Consignement Tracking Form</h2>
										
									</header>
									<div class="panel-body">
                                    <div class="col-sm-6 portlets ui-sortable">
                                    	<div class="form-group">
											<label class="col-sm-4 control-label">Consignement ID: </label>
											<div class="col-sm-8">
												<input type="text" id="txtConsignementID" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                   
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">Date: </label>
											<div class="col-sm-8">
                                             <input id="txtDate" runat="server" readonly="readonly" type="text" data-plugin-datepicker class="form-control">
                                              </div>
										</div>
                                       
                                        <div class="form-group">
											<label class="col-sm-4 control-label">MIR/SRN No: </label>
											<div class="col-sm-8">
												<input type="text" id="txtSRNNo" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                   
											</div>
										</div>
										<hr />
                                        	<div class="form-group">
											<label class="col-sm-4 control-label">Consigner Name: </label>
											<div class="col-sm-8">
												 <asp:DropDownList ID="ddlConsigner" class="form-control populate" runat="server">
                                                   </asp:DropDownList>
											</div>
										</div>
                                        	<div class="form-group">
											<label class="col-sm-4 control-label">Address: </label>
											<div class="col-sm-8">
												<input type="text" id="txtAddress1" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Contact : </label>
											<div class="col-sm-8">
												<input type="text" id="txtContact1" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                        	<div class="form-group">
											<label class="col-sm-4 control-label">Consignee Name/ID: </label>
											<div class="col-sm-8">
												<input type="text" id="txtConsignee2" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                   
											</div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label">Address: </label>
											<div class="col-sm-8">
												<input type="text" id="txtAddress2" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                   
											</div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label">Contact : </label>
											<div class="col-sm-8">
												<input type="text" id="txtContact2" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                        <hr />
                                       
                                       
                                       
                                         
                                        </div>


                                        <div class="col-sm-6 portlets ui-sortable">
                                         
                                        <div class="form-group">
											<label class="col-sm-4 control-label">LR/GR Number: </label>
											<div class="col-sm-8">
												<input type="text" id="txtLR" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Material Type: </label>
											<div class="col-sm-8">
												<input type="text" id="txtMaterialType" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Remark: </label>
											<div class="col-sm-8">
												  <textarea id="txtRemark" runat="server" readonly="readonly" name="example-text-input" class="form-control" cols="20" rows="5"></textarea>
                                    
											</div>
										</div>
                                        <hr />
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Date of Loading: </label>
											<div class="col-sm-8">
												
                                    	      <input id="txtDateOfLoading" runat="server" readonly="readonly" type="text" data-plugin-datepicker class="form-control">
                                           	</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Date of Deliver: </label>
											<div class="col-sm-8">
												
                                              <input id="txtDateOfDeliver" runat="server" readonly="readonly" type="text" data-plugin-datepicker class="form-control">
                                          	</div>
										</div>
                                       
                       
                                          <hr />
                                        <div class="form-group">
												<label class="col-md-4 control-label">Status</label>
												<div class="col-md-8">
													<asp:DropDownList ID="ddlStatus" readonly="readonly" class="form-control populate" runat="server">
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>Pending</asp:ListItem>
                                                        <asp:ListItem>Delivered</asp:ListItem>
                                                     </asp:DropDownList>
												</div>
											</div>
                                        </div>
									</div>
									<footer class="panel-footer">
                                           
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
						
										<h2 class="panel-title"> Consignement Tracking</h2>
									</header>
									<div class="panel-body">
									
                                       <div class="row">
                                        <div class="col-sm-8 col-xs-8">
                                             <div class="dataTables_length">
                              <label class="col-sm-2 control-label">Search: </label>
                              <div class="col-sm-4">
                                               <asp:DropDownList ID="ddlSearch" class="form-control populate" 
                                      runat="server" AutoPostBack="True" 
                                      onselectedindexchanged="ddlSearch_SelectedIndexChanged">
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>Date of Loading</asp:ListItem>
                                                        <asp:ListItem>Date of Deliver</asp:ListItem>
                                                        <asp:ListItem>Consignement ID</asp:ListItem>
                                                         <asp:ListItem>MIR/SRN No</asp:ListItem>
                                                </asp:DropDownList>
										</div>
										<div class="col-sm-3">
                                                <input id="txtToDate" runat="server" readonly="readonly" type="text" placeholder="From date" data-plugin-datepicker class="form-control">
                                             </div>
                                        <div class="col-sm-3">
                                          <input id="txtFromDate" runat="server" readonly="readonly" type="text" placeholder="To date"  data-plugin-datepicker class="form-control">
                                                <input type="text" id="txtSearch" runat="server" visible="false" class="form-control" name="username" data-bv-field="username">
										
                                        </div>

                            </div>
                                       </div>
                                                        <div class="col-sm-4  col-xs-4">
                                        
                                        <div class="col-sm-2 col-xs-2">

                                               <asp:LinkButton ID="lnkSearch" runat="server" onclick="lnkSearch_Click"><i class="gi gi-show_big_thumbnails sidebar-nav-icon"></i> <span class="input-group-addon"><i class="fa fa-search"></i></span></asp:LinkButton>
                                            
                                               <%--<asp:LinkButton ID="lnkExportExcel" runat="server"  CssClass="btn btn-primary" onclick="lnkExportExcel_Click"><i class="gi gi-show_big_thumbnails sidebar-nav-icon"></i> Export Excel&nbsp;&nbsp;</asp:LinkButton>--%>

                                        </div>
                                            <div class="col-sm-6 col-xs-6">
                                             <asp:LinkButton ID="lnkExportExcel" runat="server"  CssClass="btn btn-primary" onclick="lnkExportExcel_Click"><i class="gi gi-show_big_thumbnails sidebar-nav-icon"></i> Export Excel&nbsp;&nbsp;</asp:LinkButton>
                                            </div>
                                     </div>
                                    </div>
                                    <br />
                            	<div class="table-responsive">
		<asp:GridView ID="gridState" runat="server" Width="100%" 
        AutoGenerateColumns="False" CellPadding="4" BorderWidth="1px"
                        BorderStyle="Groove" EmptyDataRowStyle-ForeColor="#FFFFFF" EmptyDataText="Sorry, No Data to show."
                        EmptyDataRowStyle-Height="30"  EnableModelValidation="True" 
                    EmptyDataRowStyle-HorizontalAlign="Center" 
                        ForeColor="Black" DataKeyNames="Id" Font-Names="Myriad Pro"
                  
                    onrowcommand="gridState_RowCommand" PageSize="30" >
                        <AlternatingRowStyle />
                        <Columns>     
                         <asp:TemplateField HeaderText = "S.No." ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                </ItemTemplate>
                                 <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="3%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="10%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>             
                            <asp:TemplateField HeaderText="Consignement ID" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblConsignementID" runat="server" Text='<%#Eval("ConsignementID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="12%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField> 
                          
                             <asp:TemplateField HeaderText="SRN No" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblSRNNo" runat="server" Text='<%#Eval("SRNNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="10%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>  
                             <asp:TemplateField HeaderText="Consigner Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblConsignerName" runat="server" Text='<%#Eval("ConsignerName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="12%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>  
                           
                             <asp:TemplateField HeaderText="Date of Loading" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblDateofLoading" runat="server" Text='<%#Eval("DateofLoading") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="12%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>  
                             <asp:TemplateField HeaderText="Date of Deliver" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblDateofDeliver" runat="server" Text='<%#Eval("DateofDeliver") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="12%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>  
                          
                              <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="10%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>             
                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Actions" ItemStyle-VerticalAlign="Top">
                                                    <ItemTemplate>
                                                    <div class="btn-group">
                                                   <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-default" CommandName="Edit1" Font-Size="18px" CommandArgument='<%#Eval("Id")%>'  AlternateText="Edit"><i class="fa fa-folder-open-o" aria-hidden="true"></i></asp:LinkButton>
                                                 
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

