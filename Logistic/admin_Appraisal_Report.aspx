<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_Appraisal_Report.aspx.cs" Inherits="Logistic.admin_Appraisal_Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style type="text/css">
    .style1
        { 
            padding: 4px 10px 4px 4px;
 
        }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
						
										<h2 class="panel-title"> Appraisal Report</h2>
									</header>
									<div class="panel-body">
									
                                       <div class="row">
                                        <div class="col-sm-5 col-xs-5">
                                             <div class="dataTables_length">
                                           <label class="col-md-3 control-label">Appraisal </label>
												    <div class="col-md-6">
													     <asp:DropDownList ID="ddlAppraisal" class="form-control populate" runat="server">
                                                         </asp:DropDownList>
												    </div>
                                             

                                    </div>
                                       </div>
                                        <div class="col-sm-7 col-xs-7">
                                        <div class="dataTables_filter">
                                        <label><div class="input-group" >
                                               <asp:LinkButton ID="lnkSearch" runat="server" CssClass="btn btn-primary"  onclick="lnkSearch_Click" > Search</asp:LinkButton> &nbsp; &nbsp; &nbsp; &nbsp;
                                          
                                               <asp:Button ID="btnExport" runat="server"  Enabled="false" CssClass="btn btn-primary" Text="Export To Excel" OnClick = "ExportToExcel"></asp:Button>
                                            
                                        </div></label>
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
                        ForeColor="Black" DataKeyNames="Name" Font-Names="Myriad Pro"
                  
                  PageSize="30" >
                        <AlternatingRowStyle />
                        <Columns>     
                         <asp:TemplateField HeaderText = "S.No." ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                </ItemTemplate>
                                 <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="3%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Employee Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="30%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField>             
                            <asp:TemplateField HeaderText="Self Appraisal" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblSelfAppraisal" runat="server" Text='<%#Eval("Self_Appraisal") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="20%" CssClass="style1"></ItemStyle>
                            </asp:TemplateField> 
                          
                           
                             <asp:TemplateField HeaderText="Manager Appraisal" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Label ID="lblManagerAppraisal" runat="server" Text='<%#Eval("Manager_Appraisal") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="style1"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Left"  Width="20%" CssClass="style1"></ItemStyle>
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
         <asp:BoundField DataField="Name" HeaderText="Employee Name" ItemStyle-Width="200px" />
         <asp:BoundField DataField="Self_Appraisal" HeaderText="Self_Appraisal" ItemStyle-Width="150px" />
         <asp:BoundField DataField="Manager_Appraisal" HeaderText="Manager_Appraisal" ItemStyle-Width="150px" />
       
         
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
</asp:Content>

