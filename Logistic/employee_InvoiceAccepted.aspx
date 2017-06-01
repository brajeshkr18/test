<%@ Page Title="" Language="C#" MasterPageFile="~/employee.Master" AutoEventWireup="true" CodeBehind="employee_InvoiceAccepted.aspx.cs" Inherits="Logistic.employee_InvoiceAccepted" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function DeleteItem() {
        if (confirm("Are you sure you want to delete Bill ...?")) {
            return true;
        }
        return false;
    }
 </script>
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
								<div class="row">
							<div class="col-xs-12">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>
						
										<h2 class="panel-title">Bill Accepted</h2>
									</header>
									<div class="panel-body">
										<form class="form-horizontal form-bordered" action="#">
                                         <div class="form-group">
												    <label class="col-md-3 control-label">Partner </label>
												    <div class="col-md-6">
													     <asp:DropDownList ID="ddlPartner" class="form-control populate" Enabled="false" runat="server">
                                                         </asp:DropDownList>
												    </div>
											    </div>
                                            <div class="form-group">
											    <label class="col-sm-3 control-label">Date: </label>
											    <div class="col-sm-6">
                                                 <input id="txtDate" runat="server" readonly="readonly" type="text" class="form-control">
                                            </div>
										</div>
											 <div class="form-group">
												<label class="col-md-3 control-label">SRN No: </label>
												<div class="col-md-6">
                                                        <input id="txtSRNNo" runat="server" readonly="readonly" type="text" class="form-control">
										
												</div>
											</div>
                                 
                                            
                                            <div class="form-group">
												<label class="col-md-3 control-label">Name Of Circle: </label>
												<div class="col-md-6">
													 <asp:DropDownList ID="ddlCity" class="form-control populate" Enabled="false" runat="server">
                                                         <asp:ListItem></asp:ListItem>
                                                         <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                                         <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                                         <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                                         <asp:ListItem>Assam</asp:ListItem>
                                                         <asp:ListItem>Bihar</asp:ListItem>
                                                         <asp:ListItem>Chandigarh</asp:ListItem>
                                                         <asp:ListItem>Chhattisgarh</asp:ListItem>
                                                         <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                                                         <asp:ListItem>Daman and Diu</asp:ListItem>
                                                         <asp:ListItem>National Capital Territory of Delhi</asp:ListItem>
                                                         <asp:ListItem>Goa</asp:ListItem>
                                                         <asp:ListItem>Gujarat</asp:ListItem>
                                                         <asp:ListItem>Haryana</asp:ListItem>
                                                         <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                                         <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                                         <asp:ListItem>Jharkhand</asp:ListItem>
                                                         <asp:ListItem>Karnataka</asp:ListItem>
                                                         <asp:ListItem>Kerala</asp:ListItem>
                                                         <asp:ListItem>Lakshadweep</asp:ListItem>
                                                         <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                                         <asp:ListItem>Maharashtra</asp:ListItem>
                                                         <asp:ListItem>Manipur</asp:ListItem>
                                                         <asp:ListItem>Meghalaya</asp:ListItem>
                                                         <asp:ListItem>Mizoram</asp:ListItem>
                                                         <asp:ListItem>Nagaland</asp:ListItem>
                                                         <asp:ListItem>Odisha</asp:ListItem>
                                                         <asp:ListItem>Puducherry</asp:ListItem>
                                                         <asp:ListItem>Punjab</asp:ListItem>
                                                         <asp:ListItem>Rajasthan</asp:ListItem>
                                                         <asp:ListItem>Sikkim</asp:ListItem>
                                                         <asp:ListItem>Tamil Nadu</asp:ListItem>
                                                         <asp:ListItem>Telangana</asp:ListItem>
                                                         <asp:ListItem>Tripura</asp:ListItem>
                                                         <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                                         <asp:ListItem>Uttarakhand</asp:ListItem>
                                                         <asp:ListItem>West Bengal</asp:ListItem>
                                                        
                                                     </asp:DropDownList>
												</div>
											</div>
                                          <div class="form-group">
												<label class="col-md-3 control-label" for="inputDefault">Name Of Account: </label>
												<div class="col-md-6">
													<input type="text" class="form-control" readonly="readonly"  runat="server" id="txtNameOfAccount">
                                                    
												</div>
											</div>
                                          <div class="form-group">
												<label class="col-md-3 control-label" for="inputDefault">Bill Period: </label>
												<div class="col-md-6">
													<input type="text" class="form-control" readonly="readonly" runat="server" id="txtPeriod">
												</div>
											</div>
                    
                                             <div class="form-group">
												<label class="col-md-3 control-label" for="inputDefault">Bill Amount: </label>
												<div class="col-md-6">
													<input type="text" class="form-control" runat="server" readonly="readonly" onkeypress="return isNumberKey(event)" id="txtAmount">
                                                     
												</div>
											</div>
                                             <hr />
                                        <div class="form-group">
												<label class="col-md-3 control-label">Status</label>
												<div class="col-md-6">
													<asp:DropDownList ID="ddlStatus" class="form-control populate" runat="server" 
                                                        AutoPostBack="True" onselectedindexchanged="ddlStatus_SelectedIndexChanged">
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>Pending</asp:ListItem>
                                                        <asp:ListItem>Accept</asp:ListItem>
                                                        <asp:ListItem>Reject</asp:ListItem>
                                                     </asp:DropDownList>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                     ControlToValidate="ddlStatus" ErrorMessage="Please Select Status" ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
												</div>
									    </div>
                                        <div class="form-group">
											<label class="col-sm-3 control-label">Date of Review: </label>
											<div class="col-sm-6">
                                             <input id="txtDateOfReview" runat="server" readonly="readonly" type="text" data-plugin-datepicker class="form-control">
                                              </div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-3 control-label">Rejection Remark: </label>
											<div class="col-sm-6">
												  <textarea id="txtRejectionRemark" runat="server" name="example-text-input" class="form-control" cols="20" rows="5"></textarea>
                                    
											</div>
										</div>
										</form>
                                        
									</div>
                                     <footer class="panel-footer">
                                            <asp:LinkButton ID="btnsubmit" onclick="btnsubmit_Click1" ValidationGroup="abc" CssClass="mb-xs mt-xs mr-xs btn btn-primary" runat="server"> Update</asp:LinkButton>
                                            <asp:LinkButton ID="btnCancel" onclick="btnCancel_Click" CssClass="mb-xs mt-xs mr-xs btn btn-primary" runat="server"> Cancel</asp:LinkButton>
                                             <asp:Label ID="lblId" runat="server" Text="Label" Visible="False"></asp:Label>
                                      </footer>
								</section>
							</div>
						</div>
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
						
										<h2 class="panel-title">Accepted Bill List</h2>
									</header>
									<div class="panel-body">
									
                                        <div class="row"><div class="col-sm-8 col-xs-5">
                            <div class="dataTables_length" id="example-datatable_length">
                                  

                            </div></div><div class="col-sm-4 col-xs-7"><div id="example-datatable_filter" class="dataTables_filter">
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
                                <ItemStyle HorizontalAlign="Left"  Width="4%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>
                         <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lbldate" runat="server" Text='<%#Eval("Invoice_date","{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="9%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>           
                           
                              <asp:TemplateField HeaderText="SRN No" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblSRNNo" runat="server" Text='<%#Eval("SRNNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="8%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>     
                               
                              <asp:TemplateField HeaderText="Name Of Account" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblNameOfAccount" runat="server" Text='<%#Eval("NameOfAccount") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="14%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>     
                             
                             <asp:TemplateField HeaderText="Bill Amount" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblInvoiceAmount" runat="server" Text='<%#Eval("InvoiceAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="10%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>   
                             <asp:TemplateField HeaderText="Partner" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblPartnerName" runat="server" Text='<%#Eval("PartnerName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="13%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>  
                              <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                     <span class="label label-success"><asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label></span>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="7%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>           
                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Actions" ItemStyle-VerticalAlign="Top">
                                                    <ItemTemplate>
                                                    <div class="btn-group">
                                                   <asp:LinkButton ID="lnkView" runat="server" CssClass="btn btn-default" CommandName="View" Font-Size="18px" CommandArgument='<%#Eval("Id")%>'  AlternateText="View"><i class="fa fa-folder-open-o" aria-hidden="true"></i></asp:LinkButton>
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

