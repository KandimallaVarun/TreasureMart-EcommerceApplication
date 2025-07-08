<%@page import="com.ecommerce.model.Customers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Customers customer = (Customers) session.getAttribute("customer");
if (customer == null) {
	response.sendRedirect("/EcommerceWebsite/view/home/CustomerLogin.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
:root {
            --primary: #4361ee;
            --primary-light: #4cc9f0;
            --secondary: #3f37c9;
            --success: #4bb543;
            --warning: #f8961e;
            --danger: #f94144;
            --light: #f8f9fa;
            --dark: #212529;
        }
.sidebar {
	position: sticky;
	top: 80px;
	height: calc(100vh - 120px);
	overflow-y: auto;
	width: 90%;
	background: var(--light);
	padding: 20px;
	border-radius: 2px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
}

.profile-pic-main {
	width: 50px;
	height: 50px;
	object-fit: cover;
	border-radius: 50%;
	border: 3px solid #ddd;
}

.sidebar h2 {
	font-size: 1.6rem;
	margin-bottom: 1rem;
	color: #34495e;
	font-weight: 700;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar ul li {
	margin: 0;
}

.sidebar ul li a {
	display: block;
	text-decoration: none;
	color: #2c3e50;
	font-size: 1.05rem;
	padding: 14px 16px;
	border-radius: 10px;
	transition: all 0.3s ease;
	margin-bottom: 8px;
}

.sidebar ul li a:hover {
	background: linear-gradient(135deg, #11e6ec30, #e74c3c20);
	color: #e74c3c !important;
}
/* Sidebar desktop styling */
.custom-sidebar {
  background: #ffffff;
  box-shadow: 0 5px 15px rgba(0,0,0,0.05);
  border-radius: 12px;
  padding: 20px;
  min-height: calc(100vh - 80px);
}

/* Sidebar links styling */
.custom-sidebar a {
  display: flex;
  align-items: center;
  padding: 10px 0;
  color: #333;
  font-weight: 500;
  text-decoration: none;
  transition: all 0.2s ease;
}

.custom-sidebar a i {
  margin-right: 10px;
  font-size: 1.2rem;
  color: #4361ee;
}

.custom-sidebar a:hover {
  color: #3f37c9;
  transform: translateX(3px);
}

/* Mobile offcanvas body link spacing */
.offcanvas-body a {
  padding: 12px 0;
}

/* Active link example (optional) */
.custom-sidebar a.active {
  color: #3f37c9;
  font-weight: 600;
}

/* Make sidebar sticky on desktop (optional) */
@media (min-width: 992px) {
  .custom-sidebar {
    position: sticky;
    top: 80px;
  }
}

</style>
</head>
<body>
	<!-- Sidebar -->
	<div class="col-md-3">
		<div class="sidebar">
			<h2>
				<img src="/uploads/<%=customer.getProfilePic()%>"
					alt="Profile Picture" class="profile-pic-main">
				<%=customer.getFirstName()%>
				<%=customer.getLastName()%></h2>
			<ul>
				<li><a href="Dashboard.jsp"><i class="bi bi-person-fill"></i>
						Dashboard</a></li>
				<li><a href="MyProfile.jsp"><i class="bi bi-person-fill"></i>
						My Profile</a></li>
				<li><a href="ViewOrders.jsp"><i class="bi bi-bag-fill"></i> My Orders</a></li>
				<li><a href="#"><i class="bi bi-heart-fill"></i> Wishlist</a></li>
				<li><a href="#"><i class="bi bi-lock-fill"></i> Change
						Password</a></li>
				<li><a href="/EcommerceWebsite/CustomerLogout"><i
						class="bi bi-box-arrow-right"></i> Logout</a></li>
			</ul>
		</div>
	</div>
	
	<!-- Offcanvas sidebar for mobile -->
<div class="offcanvas offcanvas-start" tabindex="-1" id="customerSidebar">
  <div class="offcanvas-header">
    <h2>
				<img src="/uploads/<%=customer.getProfilePic()%>"
					alt="Profile Picture" class="profile-pic-main">
				<%=customer.getFirstName()%>
				<%=customer.getLastName()%></h2>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
  </div>
  <div class="offcanvas-body">
    <a href="Dashboard.jsp" class="d-flex align-items-center mb-3 text-dark text-decoration-none">
      <i class="bi bi-house-door me-2"></i> Dashboard
    </a>
    <a href="MyProfile.jsp" class="d-flex align-items-center mb-3 text-dark text-decoration-none">
      <i class="bi bi-person-fill me-2"></i> My Profile
    </a>
    <a href="ViewOrders.jsp" class="d-flex align-items-center mb-3 text-dark text-decoration-none">
      <i class="bi bi-bag-fill me-2"></i> My Orders
    </a>
    <a href="#" class="d-flex align-items-center mb-3 text-dark text-decoration-none">
      <i class="bi bi-heart-fill me-2"></i> Wishlist
    </a>
    <a href="#" class="d-flex align-items-center mb-3 text-dark text-decoration-none">
      <i class="bi bi-lock-fill me-2"></i> Change Password
    </a>
    <a href="/EcommerceWebsite/CustomerLogout" class="d-flex align-items-center text-dark text-decoration-none">
      <i class="bi bi-box-arrow-right me-2"></i> Logout
    </a>
  </div>
</div>
</body>
</html>