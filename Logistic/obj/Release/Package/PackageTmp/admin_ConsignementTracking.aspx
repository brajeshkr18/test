<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_ConsignementTracking.aspx.cs" Inherits="Logistic.admin_ConsignementTracking" %>
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
											<label class="col-sm-4 control-label">Way Bill 1: </label>
											<div class="col-sm-8">
												 <input type="text" id="txtWayBill1" runat="server" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Way Bill 2: </label>
											<div class="col-sm-8">
												 <input type="text" id="txtWayBill2" runat="server" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                          <div class="form-group">
											<label class="col-sm-4 control-label">Way Bill 3: </label>
											<div class="col-sm-8">
												  <input type="text" id="txtWayBill3" runat="server" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Way Bill 4: </label>
											<div class="col-sm-8">
												  <input type="text" id="txtWayBill4" runat="server" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                        <hr />
                                        <div class="form-group">
												<label class="col-md-4 control-label">Name Of Circle: </label>
												<div class="col-md-8">
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
                                                      <asp:RequiredFieldValidator ControlToValidate="ddlCity" ID="RequiredFieldValidator2"
                                                                     ValidationGroup="abc" ForeColor="Red"  ErrorMessage="Please select Name Of Circle" runat="server" ></asp:RequiredFieldValidator>
												</div>
                                              
											</div>
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
                                        </div>


                                        <div class="col-sm-6 portlets ui-sortable">

                                         <div class="form-group">
											<label class="col-sm-4 control-label">Freight Amount: </label>
											<div class="col-sm-8">
												<input type="text" id="txtFreightAmount" runat="server" readonly="readonly" class="form-control" name="username" onkeypress="return isNumberKey(event)" data-bv-field="username">
                                               
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Advance Freight: </label>
											<div class="col-sm-8">
												<input type="text" id="txtAdvanceFreight" runat="server" readonly="readonly" class="form-control" name="username" onkeypress="return isNumberKey(event)" data-bv-field="username">
                                               
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Loading: </label>
											<div class="col-sm-8">
												<input type="text" id="txtLoading" runat="server" readonly="readonly" class="form-control" name="username" onkeypress="return isNumberKey(event)" data-bv-field="username">
                                               
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Unloading: </label>
											<div class="col-sm-8">
												<input type="text" id="txtUnloading" runat="server" readonly="readonly" class="form-control" name="username" onkeypress="return isNumberKey(event)" data-bv-field="username">
                                   
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Octroi/Varai/Toll/Others: </label>
											<div class="col-sm-8">
												<input type="text" id="txtOthers" runat="server" readonly="readonly" class="form-control" name="username" onkeypress="return isNumberKey(event)" data-bv-field="username">
                                    
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Extra Amount: </label>
											<div class="col-sm-8">
												<input type="text" id="txtExtraAmount" runat="server" readonly="readonly" class="form-control" name="username" onkeypress="return isNumberKey(event)" data-bv-field="username">
                                            
											</div>
										</div>
                                        <div class="form-group">
											<label class="col-sm-4 control-label">Total Amount: </label>
											<div class="col-sm-8">
												<input type="text" id="txtTotalAmount" runat="server" readonly="readonly" class="form-control" name="username" onkeypress="return isNumberKey(event)" data-bv-field="username">
                                             
											</div>
										</div>
                                        <hr />
                                        <div class="form-group">
											<label class="col-sm-4 control-label">Contact Number 1: </label>
											<div class="col-sm-8">
												<input type="text" id="txtContactNumber1" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                          <div class="form-group">
											<label class="col-sm-4 control-label">Contact Number 2: </label>
											<div class="col-sm-8">
												<input type="text" id="txtContactNumber2" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                          <div class="form-group">
											<label class="col-sm-4 control-label">Contact Number 3: </label>
											<div class="col-sm-8">
												<input type="text" id="txtContactNumber3" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                          <div class="form-group">
											<label class="col-sm-4 control-label">Contact Number 4: </label>
											<div class="col-sm-8">
												<input type="text" id="txtContactNumber4" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                          <div class="form-group">
											<label class="col-sm-4 control-label">Contact Number 5: </label>
											<div class="col-sm-8">
												<input type="text" id="txtContactNumber5" runat="server" readonly="readonly" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                             <div class="form-group">
											<label class="col-sm-4 control-label">Vehicle No: </label>
											<div class="col-sm-8">
												  <input type="text" id="txtVehicleNo" runat="server" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                                <div class="form-group">
											<label class="col-sm-4 control-label">Vehicle Type: </label>
											<div class="col-sm-8">
												  <asp:DropDownList ID="ddlType" class="form-control" runat="server">
                                                   </asp:DropDownList>
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Weight: </label>
											<div class="col-sm-8">
												  <asp:DropDownList ID="ddlWeight" class="form-control" runat="server">
                                                    <asp:ListItem></asp:ListItem>
                                                    <asp:ListItem>Less than 250 Grams</asp:ListItem>
                                                    <asp:ListItem>250 to 500 Grams</asp:ListItem>
                                                    <asp:ListItem>500 to 999 Grams</asp:ListItem>
                                                    <asp:ListItem>1Kg to 5Kg</asp:ListItem>
                                                    <asp:ListItem>5Kg to 10Kg</asp:ListItem>
                                                    <asp:ListItem>10Kg to 50Kg</asp:ListItem>
                                                    <asp:ListItem>50Kg to 100Kg</asp:ListItem>
                                                    <asp:ListItem>100Kg to 500Kg</asp:ListItem>
                                                    <asp:ListItem>Less than 1Ton</asp:ListItem>
                                                    <asp:ListItem>1Ton</asp:ListItem>
                                                    <asp:ListItem>1.5Ton</asp:ListItem>
                                                    <asp:ListItem>2Ton</asp:ListItem>
                                                    <asp:ListItem>2.5Ton</asp:ListItem>
                                                    <asp:ListItem>3.5Ton</asp:ListItem>
                                                    <asp:ListItem>4Ton</asp:ListItem>
                                                    <asp:ListItem>5Ton</asp:ListItem>
                                                    <asp:ListItem>6.5Ton</asp:ListItem>
                                                    <asp:ListItem>7.5Ton</asp:ListItem>
                                                    <asp:ListItem>9Ton</asp:ListItem>
                                                    <asp:ListItem>10Ton</asp:ListItem>
                                                    <asp:ListItem>12Ton</asp:ListItem>
                                                    <asp:ListItem>15Ton</asp:ListItem>
                                                    <asp:ListItem>20Ton</asp:ListItem>
                                                    <asp:ListItem>21Ton</asp:ListItem>
                                                    <asp:ListItem>24Ton</asp:ListItem>
                                                    <asp:ListItem>27Ton</asp:ListItem>
                                                    <asp:ListItem>40Ton</asp:ListItem>
                                                    <asp:ListItem>50 to 100Ton</asp:ListItem>
                                                    <asp:ListItem>100 to 200Ton</asp:ListItem>
                                                    <asp:ListItem>200Ton 0r above</asp:ListItem>
                                               </asp:DropDownList>
                                    
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">MIN No: </label>
											<div class="col-sm-8">
												  <input type="text" id="txtMinNo" runat="server" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">OGP No: </label>
											<div class="col-sm-8">
												  <input type="text" id="txtOGP" runat="server" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Blank 1: </label>
											<div class="col-sm-8">
												  <input type="text" id="txtBlank1" runat="server" class="form-control" name="username" data-bv-field="username">
                                    
											</div>
										</div>
                                         <div class="form-group">
											<label class="col-sm-4 control-label">Blank 2: </label>
											<div class="col-sm-8">
												  <input type="text" id="txtBlank2" runat="server" class="form-control" name="username" data-bv-field="username">
                                    
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
                                                       <asp:ListItem>Consigner Name</asp:ListItem>
                                                        <asp:ListItem>LR/GR Number</asp:ListItem>
                                                        <asp:ListItem>Vechile Number</asp:ListItem>
                                                </asp:DropDownList>
										</div>
											<div class="col-sm-3">
                                                <input id="txtToDate" runat="server" readonly="readonly" type="text"  placeholder="From date" data-plugin-datepicker class="form-control">
                                               	</div>
                                        <div class="col-sm-3">
                                         <input id="txtFromDate" runat="server" readonly="readonly" type="text" placeholder="To date" data-plugin-datepicker class="form-control">
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
                             <asp:TemplateField HeaderText="Total Amount" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalAmount" runat="server" Text='<%#Eval("TotalAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="10%" CssClass="style1"></ItemStyle>
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

