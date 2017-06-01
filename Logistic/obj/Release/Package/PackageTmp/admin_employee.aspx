<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_employee.aspx.cs" Inherits="Logistic.admin_employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function DeleteItem() {
        if (confirm("Are you sure you want to delete Employee ...?")) {
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
       <div class="col-sm-12 portlets ui-sortable">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>

										<h2 class="panel-title">Employee Form</h2>
										
									</header>
									<div class="panel-body">
                                     <div class="col-sm-6 portlets ui-sortable">
										<div class="form-group">
											<label class="col-sm-4 control-label">Employee Name: </label>
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
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                        ControlToValidate="txtMobile" ErrorMessage="*" ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
                                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Height="2px" Font-Size="Small" runat="server" ControlToValidate="txtMobile" 
                                                         ErrorMessage="Please Enter Correct Mobile No " ForeColor="Red" ValidationGroup="abc" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$"></asp:RegularExpressionValidator>

											</div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label">Employee Id: </label>
											<div class="col-sm-8">
												 <input type="text" id="txtUserId" runat="server" class="form-control placeholder-no-fix" placeholder="Employee Id (Login Id)">
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
                                        <hr />
                                        
                                       <div class="form-group">
											<label class="col-sm-4 control-label">Load Request Role: </label>
											<div class="col-sm-8">
												 <asp:DropDownList ID="ddlLoadRequest_role" class="form-control placeholder-no-fix" runat="server">
                                                                <asp:ListItem></asp:ListItem>
                                                                 <asp:ListItem>No</asp:ListItem>
                                                                 <asp:ListItem>Yes</asp:ListItem>
                                                             </asp:DropDownList>
						                                
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Vehicle Request Role: </label>
											<div class="col-sm-8">
												 <asp:DropDownList ID="ddlVehicleRequest_role" class="form-control placeholder-no-fix" runat="server">
                                                                <asp:ListItem></asp:ListItem>
                                                                 <asp:ListItem>No</asp:ListItem>
                                                                 <asp:ListItem>Yes</asp:ListItem>
                                                             </asp:DropDownList>
						                                
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Ask For Vehicle Role: </label>
											<div class="col-sm-8">
												 <asp:DropDownList ID="ddlAskForVehicle_role" class="form-control placeholder-no-fix" runat="server">
                                                                <asp:ListItem></asp:ListItem>
                                                                 <asp:ListItem>No</asp:ListItem>
                                                                 <asp:ListItem>Yes</asp:ListItem>
                                                             </asp:DropDownList>
						                                
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Consignement Role: </label>
											<div class="col-sm-8">
												 <asp:DropDownList ID="ddlConsignement" class="form-control placeholder-no-fix" runat="server">
                                                                 <asp:ListItem></asp:ListItem>
                                                                 <asp:ListItem>No</asp:ListItem>
                                                                 <asp:ListItem>Yes</asp:ListItem>
                                                             </asp:DropDownList>
						                                
											</div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label">Bill  Role: </label>
											<div class="col-sm-8">
												 <asp:DropDownList ID="ddlBill_role" class="form-control placeholder-no-fix" runat="server">
                                                                <asp:ListItem></asp:ListItem>
                                                                 <asp:ListItem>No</asp:ListItem>
                                                                 <asp:ListItem>Yes</asp:ListItem>
                                                             </asp:DropDownList>
						                                
											</div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label">Delivery Performa  Role: </label>
											<div class="col-sm-8">
												 <asp:DropDownList ID="ddlDeliveryPerforma_role" class="form-control placeholder-no-fix" runat="server">
                                                                 <asp:ListItem></asp:ListItem>
                                                                 <asp:ListItem>No</asp:ListItem>
                                                                 <asp:ListItem>Yes</asp:ListItem>
                                                             </asp:DropDownList>
						                                
											</div>
										</div>
                                        </div>
                                         <div class="col-sm-6 portlets ui-sortable">
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
                                          <div class="form-group">
											<label class="col-sm-4 control-label">Address: </label>
											<div class="col-sm-8">
                                                  <textarea id="txtAddress" runat="server" class="form-control placeholder-no-fix" rows="3" cols="20"></textarea>
												
                                                  <input type="hidden" value="">
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Designation : </label>
											<div class="col-sm-8">
												 <asp:DropDownList ID="ddlDesignation" class="form-control placeholder-no-fix" runat="server">
                                                                  <asp:ListItem></asp:ListItem>
                                                                  <asp:ListItem>Director</asp:ListItem>
                                                                  <asp:ListItem>CEO</asp:ListItem>
                                                                  <asp:ListItem>VP - Operation</asp:ListItem>
                                                                  <asp:ListItem>VP - Marketing</asp:ListItem>
                                                                  <asp:ListItem>GM - Operation</asp:ListItem>
                                                                  <asp:ListItem>National Logistic Head</asp:ListItem>
                                                                  <asp:ListItem>DGM </asp:ListItem>
                                                                  <asp:ListItem>Circle Manager</asp:ListItem>
                                                                  <asp:ListItem>SR. Manager</asp:ListItem>
                                                                  <asp:ListItem>Manager</asp:ListItem>
                                                                  <asp:ListItem>Assit- Manager</asp:ListItem>
                                                                  <asp:ListItem>Sr. Executive</asp:ListItem>
                                                                  <asp:ListItem>Executive </asp:ListItem>
                                                                 
                                                             </asp:DropDownList>
						                                 <asp:RequiredFieldValidator ControlToValidate="ddlDesignation" ID="RequiredFieldValidator1"
                                                   ValidationGroup="abc" ForeColor="Red"  ErrorMessage="Please select Designation" runat="server" ></asp:RequiredFieldValidator>
                
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Levels: </label>
											<div class="col-sm-8">
												 <asp:DropDownList ID="ddlLevels" class="form-control placeholder-no-fix" runat="server">
                                                                 <asp:ListItem></asp:ListItem>
                                                                 <asp:ListItem>1</asp:ListItem>
                                                                 <asp:ListItem>2</asp:ListItem>
                                                                 <asp:ListItem>3</asp:ListItem>
                                                                 <asp:ListItem>4</asp:ListItem>
                                                                 <asp:ListItem>5</asp:ListItem>
                                                                 <asp:ListItem>6</asp:ListItem>
                                                                 <asp:ListItem>7</asp:ListItem>
                                                                 <asp:ListItem>8</asp:ListItem>
                                                                 <asp:ListItem>9</asp:ListItem>
                                                                 <asp:ListItem>10</asp:ListItem>
                                                                 <asp:ListItem>11</asp:ListItem>
                                                               
                                                             </asp:DropDownList>
						                                 <asp:RequiredFieldValidator ControlToValidate="ddlLevels" ID="RequiredFieldValidator2"
                                                   ValidationGroup="abc" ForeColor="Red"  ErrorMessage="Please select Levels" runat="server" ></asp:RequiredFieldValidator>
                
											</div>
										</div>
                                        
                                            <div class="form-group">
												<label class="col-md-4 control-label">Name Of Circle: </label>
												<div class="col-md-6">
													 <asp:DropDownList ID="ddlCity" class="form-control populate" runat="server">
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
                                                
                                                <div class="col-md-2">
                                                 <asp:CheckBox ID="chkAll" runat="server" /> 
                                                  <asp:LinkButton ID="btnImage" runat="server" CssClass="btn btn-xs btn-success" onclick="btnImage_Click"><i class="icon-plus icon-white"></i> Add</asp:LinkButton>
                                          
                                                </div>
											</div>
                                            
                                          <div class="form-group">
											<label class="col-sm-4 control-label"></label>
											<div class="col-sm-8" style="overflow-y:hidden">                        
	                                          <asp:GridView ID="GridViewImage" runat="server" AutoGenerateColumns="False" AllowPaging="false"
                                                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"   
                                                CellPadding="3"  GridLines="Vertical">  
                                                <AlternatingRowStyle BackColor="#DCDCDC" />  
                                                <Columns>  
         
                                                 <asp:TemplateField HeaderText="">    
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnRemove" ImageUrl="~/images/delete.png" ForeColor="Red" CommandName="Delete1" AlternateText="-" OnClick="MyButtonClick" runat="server" />
                                                        </ItemTemplate>  
                                                    </asp:TemplateField>  
                                                    <asp:TemplateField Visible="false" HeaderText="ID">    
                                                        <ItemTemplate>  
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>  
                                                        </ItemTemplate>  
                                                    </asp:TemplateField>  
                                                    <asp:TemplateField HeaderText="Name"> 
                                                        <ItemTemplate>  
                                                            <asp:Label ID="Label2" runat="server" Width="310px" Text='<%# Eval("Name") %>'></asp:Label>  
                                                        </ItemTemplate>  
                                                    </asp:TemplateField>  
        
                                                </Columns>  
                                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />  
                                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />  
                                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />  
                                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />  
                                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />  
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />  
                                                <SortedAscendingHeaderStyle BackColor="#0000A9" />  
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />  
                                                <SortedDescendingHeaderStyle BackColor="#000065" />  
                                            </asp:GridView>                         
											</div>
										</div>
                                        
                                          <div class="form-group">
											<label class="col-sm-4 control-label">DEPARTEMENT: </label>
											<div class="col-sm-8">
												 <asp:DropDownList ID="ddlDepartement" class="form-control placeholder-no-fix" 
                                                    runat="server" AutoPostBack="True" 
                                                    onselectedindexchanged="ddlDepartement_SelectedIndexChanged">
                                                                 <asp:ListItem></asp:ListItem>
                                                                 <asp:ListItem>Warehouse Operation - Capex</asp:ListItem>
                                                                 <asp:ListItem>Warehouse Operation - Opex</asp:ListItem>
                                                                 <asp:ListItem>EDP</asp:ListItem>
                                                                 <asp:ListItem>Logistic</asp:ListItem>
                                                                 <asp:ListItem>FINANCE</asp:ListItem>
                                                                 <asp:ListItem>HR</asp:ListItem>
                                                                 <asp:ListItem>Marketing</asp:ListItem>
                                                                 <asp:ListItem>Administration</asp:ListItem>
                                                                 <asp:ListItem>Purchase</asp:ListItem>
                                                                 <asp:ListItem>Support</asp:ListItem>
                                                             </asp:DropDownList>
						                               
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Sub-Division: </label>
											<div class="col-sm-6">
												 <asp:DropDownList ID="ddlSubDivision" class="form-control placeholder-no-fix" runat="server">            
                                                 </asp:DropDownList>
						                               
											</div>
                                            <div class="col-md-2">
                                                
                                                  <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-xs btn-success" onclick="btnImage1_Click"><i class="icon-plus icon-white"></i> Add</asp:LinkButton>
                                          
                                                </div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label"></label>
											<div class="col-sm-8" style="overflow-y:hidden">                        
	                                          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" AllowPaging="false"
                                                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"   
                                                CellPadding="3"  GridLines="Vertical">  
                                                <AlternatingRowStyle BackColor="#DCDCDC" />  
                                                <Columns>  
         
                                                 <asp:TemplateField HeaderText="">    
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnRemove" ImageUrl="~/images/delete.png" ForeColor="Red" CommandName="Delete1" AlternateText="-" OnClick="MyButtonClick1" runat="server" />
                                                        </ItemTemplate>  
                                                    </asp:TemplateField>  
                                                    <asp:TemplateField Visible="false" HeaderText="ID">    
                                                        <ItemTemplate>  
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>  
                                                        </ItemTemplate>  
                                                    </asp:TemplateField>  
                                                    <asp:TemplateField HeaderText="Departement"> 
                                                        <ItemTemplate>  
                                                            <asp:Label ID="Label2" runat="server" Width="200px" Text='<%# Eval("Departement") %>'></asp:Label>  
                                                        </ItemTemplate>  
                                                    </asp:TemplateField>  
                                                    <asp:TemplateField HeaderText="SubDivision"> 
                                                        <ItemTemplate>  
                                                            <asp:Label ID="Label3" runat="server" Width="200px" Text='<%# Eval("SubDivision") %>'></asp:Label>  
                                                        </ItemTemplate>  
                                                    </asp:TemplateField> 
                                                </Columns>  
                                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />  
                                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />  
                                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />  
                                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />  
                                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />  
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />  
                                                <SortedAscendingHeaderStyle BackColor="#0000A9" />  
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />  
                                                <SortedDescendingHeaderStyle BackColor="#000065" />  
                                            </asp:GridView>                         
											</div>
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
						
										<h2 class="panel-title">Employee</h2>
									</header>
									<div class="panel-body">
									
                                        <div class="row"><div class="col-sm-9 col-xs-5">
                            <div class="dataTables_length" id="example-datatable_length">
                                  <asp:LinkButton ID="lnkAdd" runat="server"  CssClass="btn btn-primary" onclick="lnkAdd_Click"><i class="gi gi-show_big_thumbnails sidebar-nav-icon"></i> Create&nbsp;&nbsp;</asp:LinkButton>
                                   <asp:Button ID="btnExport" runat="server" Enabled="false" CssClass="btn btn-default" Text="Export To Excel" OnClick = "ExportToExcel" />
                            </div></div><div class="col-sm-3 col-xs-7"><div id="example-datatable_filter" class="dataTables_filter">
                            <label><div class="input-group">
                              <asp:TextBox ID="txtSearch" runat="server" class="form-control"  AutoPostBack="True" Height="42px" placeholder="Search" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
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
                             <asp:TemplateField HeaderText="Employee Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("EmployeeName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="12%" CssClass="style1"></ItemStyle>
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
                                <ItemStyle HorizontalAlign="Left"  Width="8%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField> 
                            <asp:TemplateField HeaderText="Designation" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblDesignation" runat="server" Text='<%#Eval("Designation") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="6%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField> 
                            <asp:TemplateField HeaderText="Levels" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lbllevels" runat="server" Text='<%#Eval("levels") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="4%" CssClass="style1"></ItemStyle>
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
         <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" ItemStyle-Width="150px" />
         <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="200px" />
         <asp:BoundField DataField="Mobile" HeaderText="Mobile (LoginId)" ItemStyle-Width="150px" />
         <asp:BoundField DataField="Password" HeaderText="Password" ItemStyle-Width="150px" />
         <asp:BoundField DataField="City" HeaderText="City" ItemStyle-Width="150px" />
         <asp:BoundField DataField="State" HeaderText="State" ItemStyle-Width="150px" />
         <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="250px" />
         <asp:BoundField DataField="Designation" HeaderText="Designation" ItemStyle-Width="150px" />
         <asp:BoundField DataField="levels" HeaderText="Levels" ItemStyle-Width="150px" />       
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
