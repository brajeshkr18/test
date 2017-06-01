<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pages-invoice-print.aspx.cs" Inherits="Logistic.pages_invoice_print" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Core Logistic - Invoice Print</title>
		<!-- Web Fonts  -->
		<link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />

		<!-- Invoice Print Style -->
		<link rel="stylesheet" href="assets/stylesheets/invoice-print.css" />
</head>
<body>
    <form id="form1" runat="server">
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
                             <asp:Label ID="lblId" runat="server" Visible="false" Text=""></asp:Label>
		<script>
		    window.print();
		</script>
    </form>
</body>
</html>
