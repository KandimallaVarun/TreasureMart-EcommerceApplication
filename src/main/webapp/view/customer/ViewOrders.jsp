<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ecommerce.model.CustomerOrders"%>
<%@page import="com.ecommerce.dao.CustomerOrdersDAO"%>
<%@ page import="com.ecommerce.model.Customers"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<title>My Orders</title>
<jsp:include page="../admin/Header.jsp" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
:root {
    --primary: #2c3e50;
    --secondary: #3498db;
    --accent: #e74c3c;
    --light: #ecf0f1;
    --dark: #2c3e50;
  }
body {
	padding-top: 80px;
	background-color: #f5f7fa;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.sidebar{
	margin: 0 auto;
	width: 80% !important;
}

.order-container {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
}

.order-card {
	background: white;
	border-radius: 10px;
	padding: 20px;
	margin-bottom: 20px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
	transition: all 0.3s ease;
}

.order-card:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
}

.order-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
	padding-bottom: 15px;
	border-bottom: 1px solid #eee;
}

.order-title {
	font-size: 1.2rem;
	font-weight: 600;
	color: #2c3e50;
}

.order-number {
	color: #7f8c8d;
	font-size: 0.9rem;
}

.status-badge {
	padding: 5px 12px;
	border-radius: 20px;
	font-size: 0.85rem;
	font-weight: 500;
}

.status-pending {
	background: #fff3cd;
	color: #856404;
}

.status-completed {
	background: #d4edda;
	color: #155724;
}

.status-cancelled {
	background: #f8d7da;
	color: #721c24;
}

.order-detail-row {
	display: flex;
	margin-bottom: 12px;
	padding-bottom: 12px;
	border-bottom: 1px dashed #eee;
}

.order-detail-row:last-child {
	border-bottom: none;
}

.detail-label {
	width: 150px;
	color: #7f8c8d;
	font-size: 0.9rem;
}

.detail-value {
	flex: 1;
	color: #34495e;
	font-weight: 500;
}

.detail-value.amount {
	font-weight: 600;
	color: #2c3e50;
}

.detail-icon {
	width: 20px;
	margin-right: 10px;
	color: #95a5a6;
	text-align: center;
}

.order-actions {
	margin-top: 20px;
	padding-top: 15px;
	border-top: 1px solid #eee;
	display: flex;
	justify-content: flex-end;
}

.btn-outline {
	border: 1px solid #ddd;
	background: none;
	padding: 6px 12px;
	border-radius: 4px;
	font-size: 0.85rem;
	margin-left: 10px;
	transition: 0.2s ease;
}

.btn-outline:hover {
	background: #f8f9fa;
}

.btn-outline.primary {
	border-color: #3498db;
	color: #3498db;
}

.btn-outline.primary:hover {
	background: #e3f2fd;
}

.btn-outline.danger {
	border-color: #e74c3c;
	color: #e74c3c;
}

.btn-outline.danger:hover {
	background: #fde8e6;
}

.no-orders {
	text-align: center;
	padding: 50px 20px;
	background: white;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.no-orders-icon {
	font-size: 3rem;
	color: #bdc3c7;
	margin-bottom: 15px;
}

.section-title {
	text-align: center;
	margin-bottom: 30px;
	position: relative;
}

.section-title h2 {
	display: inline-block;
	background: lightgrey;
	padding: 5px 20px;
	position: relative;
	z-index: 1;
	font-weight: 600;
	color: var(--accent);
	border-radius: 5px;
}

.section-title:after {
	content: "";
	position: absolute;
	top: 50%;
	left: 0;
	right: 0;
	height: 1px;
	background: #eee;
	z-index: 0;
}
        @media (max-width: 991.98px) {
    .sidebar {
        display: none;
    }
}
</style>
</head>

<body>
	<jsp:include page="../home/Navbar.jsp" />
                    <!-- Mobile toggle button -->
<button class="btn btn-dark mb-3 d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#customerSidebar" aria-controls="customerSidebar">
  <i class="bi bi-list"></i>
</button>
	<%
    Customers customer = (Customers) session.getAttribute("customer");
    if (customer == null) {
    %>

    <div class="container mx-auto text-center bg-light w-50 p-3"
        style="border-radius: 10px;">
        <h4>Sorry! You have not Logged in</h4>
        <p>Please Login to view your orders</p>
        <a class="btn btn-success btn-md"
            href="/EcommerceWebsite/view/home/CustomerLogin.jsp">Login</a>
    </div>
    <%
    session.setAttribute("redirectAfterLogin", "/EcommerceWebsite/view/customer/ViewCart.jsp");
    return;
    }
    %>
	<div class="container-fluid">
		<div class="row">
		<jsp:include page="Sidebar.jsp"></jsp:include>

		<div class="col-md-9">
			<div class="section-title">
				<h2>
					<i class="fas fa-box-open mr-2"></i> My Orders
				</h2>
			</div>

			<div class="container-fluid order-container">
				<%
				CustomerOrdersDAO orderDAO = new CustomerOrdersDAO();
				ArrayList<CustomerOrders> orderList = orderDAO.getAllOrders();

				if (orderList.isEmpty()) {
				%>
				<div class="no-orders">
					<div class="no-orders-icon">
						<i class="fas fa-box-open"></i>
					</div>
					<h3>No Orders Yet</h3>
					<p class="text-muted">You haven't placed any orders yet. Start
						shopping now!</p>
					<a href="/products" class="btn btn-primary mt-3">Browse
						Products</a>
				</div>
				<%
				} else {
				for (CustomerOrders order : orderList) {
					if(order.getCustomerId() == customer.getCustomerId()){
				%>
				<div class="order-card">
					<div class="order-header">
						<div>
							<div class="order-title">
								Order #<%=order.getOrderNumber()%></div>
							<div class="order-number">
								Invoice:
								<%=order.getInvoiceNumber()%></div>
						</div>
						<div>
							<span
							  class="status-badge 
							  <%=order.getOrderStatus().equalsIgnoreCase("Pending") ? "status-pending"
							  : order.getOrderStatus().equalsIgnoreCase("Confirmed") ? "status-confirmed"
							  : order.getOrderStatus().equalsIgnoreCase("Shipped") ? "status-shipped"
							  : order.getOrderStatus().equalsIgnoreCase("Completed") ? "status-completed"
							  : "status-cancelled"%>">
							  
							  <i class="fas 
							  <%=order.getOrderStatus().equalsIgnoreCase("Pending") ? "fa-clock"
							  : order.getOrderStatus().equalsIgnoreCase("Confirmed") ? "fa-check-double"
							  : order.getOrderStatus().equalsIgnoreCase("Shipped") ? "fa-shipping-fast"
							  : order.getOrderStatus().equalsIgnoreCase("Completed") ? "fa-check"
							  : "fa-times"%> mr-1"></i>
							  
							  <%=order.getOrderStatus()%>
							</span>

						</div>
					</div>

					<div class="order-details">
						<div class="order-detail-row">
							<div class="detail-label">
								<i class="far fa-calendar-alt detail-icon"></i>Order Date
							</div>
							<div class="detail-value"><%=order.getOrderDateTime()%></div>
						</div>
						<div class="order-detail-row">
							<div class="detail-label">
								<i class="fas fa-barcode detail-icon"></i>Product Code
							</div>
							<div class="detail-value"><%=order.getProductCode()%></div>
						</div>
						<div class="order-detail-row">
							<div class="detail-label">
								<i class="fas fa-tag detail-icon"></i>Price
							</div>
							<div class="detail-value">
								₹<%=order.getCost()%></div>
						</div>
						<div class="order-detail-row">
							<div class="detail-label">
								<i class="fas fa-percentage detail-icon"></i>Quantity
							</div>
							<div class="detail-value"><%=order.getQuantity()%></div>
						</div>
						<div class="order-detail-row">
							<div class="detail-label">
								<i class="fas fa-tags detail-icon"></i>Discount
							</div>
							<div class="detail-value">
								- ₹<%=order.getDiscountAmount()%></div>
						</div>
						<div class="order-detail-row">
							<div class="detail-label">
								<i class="fas fa-receipt detail-icon"></i>GST
							</div>
							<div class="detail-value">
								+ ₹<%=order.getGstAmount()%></div>
						</div>
						<div class="order-detail-row">
							<div class="detail-label">
								<i class="fas fa-money-bill-wave detail-icon"></i>Total
							</div>
							<div class="detail-value amount">
								₹<%=order.getBillAmount()%></div>
						</div>
					</div>

					<div class="order-actions">
						<a href="/EcommerceWebsite/view/customer/Invoice.jsp?invoiceNumber=<%=order.getInvoiceNumber() %>" class="btn-outline primary">
							<i class="fas fa-file-invoice mr-1"></i> Invoice
						</a>
						<%
						if (order.getOrderStatus().equalsIgnoreCase("Pending")) {
						%>
						<button class="btn-outline danger">
							<i class="fas fa-times-circle mr-1"></i> Cancel Order
						</button>
						<%
						}
						%>
					</div>
				</div>
				<%
				} // end for
				} // end else
				} // end else
				%>
			</div>
		</div>
	</div>
	</div>

	<jsp:include page="../home/Footer.jsp" />
</body>
</html>
