<%@ Page Title="" Language="C#" MasterPageFile="~/employee.Master" AutoEventWireup="true" CodeBehind="employee_DeliveryPerforma.aspx.cs" Inherits="Logistic.employee_DeliveryPerforma" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function DeleteItem() {
        if (confirm("Are you sure you want to delete Delivery Performa ...?")) {
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
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>

										<h2 class="panel-title"> Delivery Performa Form</h2>
										
									</header>
									<div class="panel-body">
                                    <div class="col-sm-6 portlets ui-sortable">
                                    	<div class="form-group">
											<label class="col-sm-4 control-label">Consignement ID: </label>
											<div class="col-sm-8">
                                                <asp:DropDownList ID="ddConsignementID"  AutoPostBack="True" class="form-control"  
                                                    runat="server" onselectedindexchanged="ddConsignementID_SelectedIndexChanged1">
                                                   </asp:DropDownList>

<%--                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                     ControlToValidate="txtConsignementID" ErrorMessage="Please select Consignement ID" ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
												--%>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">Date: </label>
											<div class="col-sm-8">
                                             <input id="txtDate" runat="server" readonly="readonly" type="text" data-plugin-datepicker class="form-control">
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                     ControlToValidate="txtDate" ErrorMessage="*" ForeColor="Red" Height="2px" ValidationGroup="abc"></asp:RequiredFieldValidator>
                                              </div>
										</div>
                                       
										<hr />
                                        	<div class="form-group">
											<label class="col-sm-4 control-label">Consigner Name: </label>
											<div class="col-sm-8">
												<input type="text" id="txtConsigner1" runat="server" class="form-control" name="username" data-bv-field="username">
                                   
											</div>
										</div>
                                        	<div class="form-group">
											<label class="col-sm-4 control-label">Address: </label>
											<div class="col-sm-8">
												<input type="text" id="txtAddress1" runat="server" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                        	<div class="form-group">
											<label class="col-sm-4 control-label">Consignee Name/ID: </label>
											<div class="col-sm-8">
												<input type="text" id="txtConsignee2" runat="server" class="form-control" name="username" data-bv-field="username">
                                   
											</div>
										</div>
                                        
                                       
                                        <hr />
                                       
                                      
                                        </div>

                                    <div class="col-sm-6 portlets ui-sortable">

                                       <div class="form-group">
											<label class="col-sm-4 control-label">Contact: </label>
											<div class="col-sm-8">
												<input type="text" id="txtContact" runat="server" class="form-control" name="username" data-bv-field="username">
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtContact" Height="2px" Font-Size="Small" runat="server"  ErrorMessage="Please Enter Correct Contact No " ForeColor="Red" ValidationGroup="abc" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$"></asp:RegularExpressionValidator>
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Delivery_Time: </label>
											<div class="col-sm-8">
												<input id="txtDeliveryTime" runat="server"  type="text" data-plugin-timepicker class="form-control">
                                    	      
                                           	</div>
										</div>
                                       
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Receivers_Name: </label>
											<div class="col-sm-8">
												<input type="text" id="txtReceiversName" runat="server" class="form-control" name="username" data-bv-field="username">
                                            </div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">ContactNo2: </label>
											<div class="col-sm-8">
												<input type="text" id="txtContactNo2" runat="server" class="form-control" name="username"  data-bv-field="username">
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtContactNo2" Height="2px" Font-Size="Small" runat="server"  ErrorMessage="Please Enter Correct Contact No " ForeColor="Red" ValidationGroup="abc" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$"></asp:RegularExpressionValidator>
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Delivery_Remark: </label>
											<div class="col-sm-8">
												<input type="text" id="txtDeliveryRemark" runat="server" class="form-control" name="username" data-bv-field="username">
                                                
											</div>
										</div>
                                         
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Any Extra Amount: </label>
											<div class="col-sm-8">
												<input type="text" id="txtExtraAmount" runat="server" class="form-control" name="username" onkeypress="return isNumberKey(event)" data-bv-field="username">
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                                                     ControlToValidate="txtExtraAmount" ErrorMessage="*" ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
											</div>
										</div>
                                           <hr />
                                       
									</div>
                                      </div>
									<footer class="panel-footer">
                                            <asp:LinkButton ID="btnsubmit" onclick="btnsubmit_Click1" ValidationGroup="abc" CssClass="btn btn-primary" runat="server"> Submit</asp:LinkButton>
                                            <asp:LinkButton ID="btnCancel" onclick="btnCancel_Click" CssClass="btn btn-default" runat="server"> Cancel</asp:LinkButton>
                                             <asp:Label ID="lblId" runat="server" Text="Label" Visible="False"></asp:Label>
                                          
                                            <input type="hidden" id="txtContact_No1" runat="server" >
                                            <input type="hidden" id="txtContact_No2" runat="server" >
                                            <input type="hidden" id="txtContact_No3" runat="server" >
                                            <input type="hidden" id="txtContact_No4" runat="server" >
                                            <input type="hidden" id="txtContact_No5" runat="server" >
										
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
						
										<h2 class="panel-title"> Delivery Performa</h2>
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
                                <ItemStyle HorizontalAlign="Left"  Width="5%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("date") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="9%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>             
                            <asp:TemplateField HeaderText="Consignement ID" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblConsignementID" runat="server" Text='<%#Eval("ConsignementId") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="12%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField> 
                          
                          
                             <asp:TemplateField HeaderText="Consigner Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblConsignerName" runat="server" Text='<%#Eval("Consigner_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="12%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>  
                           
                             <asp:TemplateField HeaderText="Delivery Time" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblDeliveryTime" runat="server" Text='<%#Eval("Delivery_Time") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="12%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>  
                             <asp:TemplateField HeaderText="Receivers Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblReceiversName" runat="server" Text='<%#Eval("Receivers_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="12%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>  
                             <asp:TemplateField HeaderText="Any Extra Amount" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblAnyExtraAmount" runat="server" Text='<%#Eval("Any_Extra_Amount") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="10%" CssClass="style1"></ItemStyle>
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
