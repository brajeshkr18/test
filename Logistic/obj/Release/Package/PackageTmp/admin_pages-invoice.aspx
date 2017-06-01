<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_pages-invoice.aspx.cs" Inherits="Logistic.admin_pages_invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section role="main" class="content-body">
					
					<!-- start: page -->

					<section class="panel">
						<div class="panel-body">
							<div class="invoice">
								<header class="clearfix">
									<div class="row">
										<div class="col-sm-6 mt-md">
											<h2 class="h2 mt-none mb-sm text-dark text-bold">INVOICE</h2>
											<h4 class="h4 m-none text-dark text-bold"><asp:Label ID="lblSRNNo" runat="server" Text=""></asp:Label></h4>
										</div>
										<div class="col-sm-6 text-right mt-md mb-md">
											<address class="ib mr-xlg">
												CORE LOGISTIC PVT. LTD.
												<br/>
												24 , Jaipur, Rajasthan
												<br/>
												Phone: +12 3 4567-8901
												<br/>
												core@Logistic.com
											</address>
											<div class="ib">
												<img src="assets/images/invoice-logo.png" alt="CORE LOGISTIC" />
											</div>
										</div>
									</div>
								</header>
								<div class="bill-info">
									<div class="row">
										<div class="col-md-6">
											<div class="bill-to">
												<p class="h5 mb-xs text-dark text-semibold">To:</p>
												<address>
													<asp:Label ID="lblNameOfAccount" runat="server" Text=""></asp:Label>
													<br/>
													<asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
													<br/>
													Phone: <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
													
												</address>
											</div>
										</div>
										<div class="col-md-6">
											<div class="bill-data text-right">
												<p class="mb-none">
													<span class="text-dark">Invoice Date:</span>
													<span class="value"><asp:Label ID="lblDate" runat="server" Text=""></asp:Label></span>
												</p>
												
											</div>
										</div>
									</div>
								</div>
							
								<div class="table-responsive">
									<table class="table invoice-items">
										<thead>
											<tr class="h4 text-dark">
												<th id="cell-id"     class="text-semibold">S.No.</th>
												<th id="cell-item"   class="text-semibold">Item</th>
                                                 <th id="cell-item"   class="text-semibold">Invoice Period</th>
												<th id="cell-desc"   class="text-semibold">Description</th>
												<th id="cell-total"  class="text-center text-semibold">Total</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td class="text-semibold text-dark">.</td>
                                                 <td><asp:Label ID="lblInvoicePeriod" runat="server" Text=""></asp:Label></td>
												<td><asp:Label ID="lblConsignementID" runat="server" Text=""></asp:Label></td>
												<td class="text-center"><asp:Label ID="lblTotalAmount" runat="server" Text="0.0"></asp:Label></td>
											</tr>
											
										</tbody>
									</table>
								</div>
							
								<div class="invoice-summary">
									<div class="row">
										<div class="col-sm-4 col-sm-offset-8">
											<table class="table h5 text-dark">
												<tbody>
													
													<tr class="h4">
														<td colspan="2">Grand Total</td>
														<td class="text-left"><asp:Label ID="lblGrandTotal" runat="server" Text="0.0"></asp:Label></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

							<div class="text-right mr-lg">
								<a href="admin_GenerateInvoice.aspx" class="btn btn-default">Back</a>
                                <asp:LinkButton ID="btnPrint" runat="server" target="_blank" 
                                    class="btn btn-primary ml-sm" onclick="btnPrint_Click"><i class="fa fa-print"></i> Print</asp:LinkButton>
                                <asp:Label ID="lblId" runat="server" Visible="false" Text=""></asp:Label>
							</div>
						</div>
					</section>

					<!-- end: page -->
				</section>
</asp:Content>
