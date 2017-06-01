<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" EnableEventValidation="false"
     CodeBehind="admin_Appraisal.aspx.cs" Inherits="Logistic.admin_Appraisal" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function DeleteItem() {
        if (confirm("Are you sure you want to delete Appraisal ...?")) {
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
<style type="text/css">     
        .ratingStar
        {
            font-size: 0pt;
            width: 40px;
            height: 40px;           
            cursor: pointer;
            display: block;
            background-repeat: no-repeat;
        }
        .filledStar
        {
            background-image: url(images/Filled_Star.png);
        }
        .emptyStar
        {
            background-image: url(Images/Empty_Star.png);
        }
        .savedStar
        {
            background-image: url(Images/Saved_Star.png);
        }
        .auto-style1 {
            height: 50px;
        }
    </style>
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
						
										<h2 class="panel-title">Appraisal</h2>
									</header>
									<div class="panel-body">
										<form class="form-horizontal form-bordered" action="#">
                                       <div class="form-group">
												    <label class="col-md-3 control-label">Employee Name</label>
												    <div class="col-md-6">
													     <asp:DropDownList ID="ddlEmployee" class="form-control populate" runat="server">
                                                         </asp:DropDownList>
                                                          <asp:RequiredFieldValidator ControlToValidate="ddlEmployee" ID="RequiredFieldValidator17"
                                                   ValidationGroup="abc" ForeColor="Red"  ErrorMessage="Please select Employee" InitialValue="0" runat="server"  Display="Dynamic"></asp:RequiredFieldValidator>
												    </div>
											    </div>
                                        <h5 class="panel-title">Quality of Work</h5>
                                        <hr />

                                            <div class="form-group">
												    <label class="col-md-3 control-label">Rating </label>
												    <div class="col-md-6">
													    <asp:Rating ID="Rating1" runat="server" Height="20px" StarCssClass="ratingStar" WaitingStarCssClass="savedStar"
                                                                FilledStarCssClass="filledStar" EmptyStarCssClass="emptyStar" AutoPostBack="true" CurrentRating="0" MaxRating="5" OnChanged="Rating1_Changed"></asp:Rating>
												    </div>
                                                     
											  </div>
											 <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize"></label>
												<div class="col-md-6">
													 <label><span style="color:#F00;">&nbsp;</span></label>	
                                                        <div style="float:left">You rated <asp:Label ID="lbl_point1" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label></div>
                                                        
												</div>
											</div>
                       
                                             <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize">Remark</label>
												<div class="col-md-6">
													<textarea class="form-control" rows="4" runat="server" id="txtRemark1" ></textarea>
                                                   
												</div>
											</div>
                                             <h5 class="panel-title">Productivity</h5>
                                             <hr />
                                             <div class="form-group">
												    <label class="col-md-3 control-label">Rating </label>
												    <div class="col-md-6">
													    <asp:Rating ID="Rating2" runat="server" Height="20px" StarCssClass="ratingStar" WaitingStarCssClass="savedStar"
                                                                FilledStarCssClass="filledStar" EmptyStarCssClass="emptyStar" AutoPostBack="true" CurrentRating="0" MaxRating="5" OnChanged="Rating2_Changed"></asp:Rating>
												    </div>
                                                     
											  </div>
											 <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize"></label>
												<div class="col-md-6">
													 <label><span style="color:#F00;">&nbsp;</span></label>	
                                                        <div style="float:left">You rated <asp:Label ID="lbl_point2" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label></div>
                                                        

												</div>
											</div>
                       
                                             <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize">Remark</label>
												<div class="col-md-6">
													<textarea class="form-control" rows="4" runat="server" id="txtRemark2" ></textarea>
                                                   
												</div>
											</div>
                                             <h5 class="panel-title">Punctuality</h5>
                                             <hr />
                                             <div class="form-group">
												    <label class="col-md-3 control-label">Rating </label>
												    <div class="col-md-6">
													    <asp:Rating ID="Rating3" runat="server" Height="20px" StarCssClass="ratingStar" WaitingStarCssClass="savedStar"
                                                                FilledStarCssClass="filledStar" EmptyStarCssClass="emptyStar" AutoPostBack="true" CurrentRating="0" MaxRating="5" OnChanged="Rating3_Changed"></asp:Rating>
												    </div>
                                                     
											  </div>
											 <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize"></label>
												<div class="col-md-6">
													 <label><span style="color:#F00;">&nbsp;</span></label>	
                                                        <div style="float:left">You rated <asp:Label ID="lbl_point3" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label></div>
                                                        

												</div>
											</div>
                       
                                             <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize">Remark</label>
												<div class="col-md-6">
													<textarea class="form-control" rows="4" runat="server" id="txtRemark3" ></textarea>
                                                  
												</div>
											</div>
                                             <h5 class="panel-title">New Initiatives</h5>
                                             <hr />
                                             <div class="form-group">
												    <label class="col-md-3 control-label">Rating </label>
												    <div class="col-md-6">
													    <asp:Rating ID="Rating4" runat="server" Height="20px" StarCssClass="ratingStar" WaitingStarCssClass="savedStar"
                                                                FilledStarCssClass="filledStar" EmptyStarCssClass="emptyStar" AutoPostBack="true" CurrentRating="0" MaxRating="5" OnChanged="Rating4_Changed"></asp:Rating>
												    </div>
                                                     
											  </div>
											 <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize"></label>
												<div class="col-md-6">
													 <label><span style="color:#F00;">&nbsp;</span></label>	
                                                        <div style="float:left">You rated <asp:Label ID="lbl_point4" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label></div>
                                                        

												</div>
											</div>
                       
                                             <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize">Remark</label>
												<div class="col-md-6">
													<textarea class="form-control" rows="4" runat="server" id="txtRemark4" ></textarea>
                                                 
												</div>
											</div>
                                             <h5 class="panel-title">KRA</h5>
                                             <hr />
                                             <div class="form-group">
												    <label class="col-md-3 control-label">Rating </label>
												    <div class="col-md-6">
													    <asp:Rating ID="Rating5" runat="server" Height="20px" StarCssClass="ratingStar" WaitingStarCssClass="savedStar"
                                                                FilledStarCssClass="filledStar" EmptyStarCssClass="emptyStar" AutoPostBack="true" CurrentRating="0" MaxRating="5" OnChanged="Rating5_Changed"></asp:Rating>
												    </div>
                                                     
											  </div>
											 <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize"></label>
												<div class="col-md-6">
													 <label><span style="color:#F00;">&nbsp;</span></label>	
                                                        <div style="float:left">You rated <asp:Label ID="lbl_point5" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label></div>
                                                        

												</div>
											</div>
                       
                                             <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize">Remark</label>
												<div class="col-md-6">
													<textarea class="form-control" rows="4" runat="server" id="txtRemark5" ></textarea>
                                                  
												</div>
											</div>
                                            <hr />
                                             <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize">Other</label>
												<div class="col-md-6">
													<textarea class="form-control" rows="4" runat="server" id="txtOther" ></textarea>
                                                   
												</div>
											</div>
                                            <hr />
                                              <div class="form-group">
												<label class="col-md-3 control-label" for="textareaAutosize">File Upload</label>
												<div class="col-md-6">
													<asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
                                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="abc"  ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.doc|.docx|.pdf)$"
    ControlToValidate="FileUpload1" runat="server" ForeColor="Red" ErrorMessage="Please select a valid Word or PDF File ."
    Display="Dynamic" />
												
                                                </div>
											</div>
                                             <hr />
                                              <div class="form-group">
												    <label class="col-md-3 control-label">Manager </label>
												    <div class="col-md-6">
													     <asp:DropDownList ID="ddlManager" class="form-control populate" runat="server">
                                                         </asp:DropDownList>
                                                    </div>
											    </div>
                                            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                            </asp:ToolkitScriptManager>
                                             
										</form>
                                   
									</div>
                                     <footer class="panel-footer">
                                             <asp:LinkButton ID="btnsubmit" onclick="btnsubmit_Click1" CssClass="mb-xs mt-xs mr-xs btn btn-primary" ValidationGroup="abc" runat="server"> Submit</asp:LinkButton>
                                            <asp:LinkButton ID="btnCancel" onclick="btnCancel_Click" CssClass="mb-xs mt-xs mr-xs btn btn-primary" runat="server"> Cancel</asp:LinkButton>
                                             <asp:Label ID="lblId" runat="server" Text="Label" Visible="False"></asp:Label>
                                              <input id="txtFileUpload" runat="server" type="hidden">
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
						
										<h2 class="panel-title">Appraisal List</h2>
									</header>
									<div class="panel-body">
									
                                        <div class="row"><div class="col-sm-8 col-xs-5">
                            <div class="dataTables_length" id="example-datatable_length">
                                  <asp:LinkButton ID="lnkAdd" runat="server"  CssClass="btn btn-primary" onclick="lnkAdd_Click"><i class="gi gi-show_big_thumbnails sidebar-nav-icon"></i> Create&nbsp;&nbsp;</asp:LinkButton>

                            </div></div><div class="col-sm-4 col-xs-7"><div id="example-datatable_filter" class="dataTables_filter">
                            <label><div class="input-group">
                              <asp:TextBox ID="txtSearch" runat="server" class="form-control"  AutoPostBack="True" Height="42px" placeholder="Search" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
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
                                    <asp:Label ID="lbldate" runat="server" Text='<%#Eval("date","{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="9%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>           
                              <asp:TemplateField HeaderText="EmployeeName" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeName" runat="server" Text='<%#Eval("EmployeeName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="15%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>   
                             <asp:TemplateField HeaderText="Designation" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblDesignation" runat="server" Text='<%#Eval("Designation") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="15%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Levels" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lbllevels" runat="server" Text='<%#Eval("levels") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="6%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>    
                            <asp:TemplateField HeaderText="Appraisal By" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblType" runat="server" Text='<%#Eval("type") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="7%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>  
                             
                                             
                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Actions" ItemStyle-VerticalAlign="Top">
                                                    <ItemTemplate>
                                                    <div class="btn-group">
                                                   <asp:LinkButton ID="lnkView" runat="server" CssClass="btn btn-default" CommandName="View" Font-Size="18px" CommandArgument='<%#Eval("Id")%>'  AlternateText="Edit"><i class="fa fa-folder-open-o" aria-hidden="true"></i></asp:LinkButton>
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
