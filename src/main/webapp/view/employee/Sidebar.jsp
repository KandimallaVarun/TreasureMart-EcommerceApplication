<%@page import="com.ecommerce.model.Employees"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Employees employee = (Employees) session.getAttribute("employee");
	if(employee == null){
		response.sendRedirect("/EcommerceWebsite/view/home/EmployeeLogin.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
:root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4895ef;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4cc9f0;
            --warning: #f8961e;
            --danger: #f72585;
            --gray: #adb5bd;
        }
* {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            display: flex;
            min-height: 100vh;
            background-color: #f5f7fb;
            overflow-x: hidden;
        }

	/* Sidebar */
        .sidebar {
            width: 250px;
            background: white;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            height: 100vh;
            position: sticky;
            top: 0;
            overflow-y: auto;
        }
        
        .logo {
            text-align: center;
            padding: 20px 0;
            margin-bottom: 10px;
            border-bottom: 1px solid #eee;
            position: sticky;
            top: 0;
            background: white;
            z-index: 1;
        }
        
        .logo h2 {
            color: var(--primary);
            font-weight: 700;
        }
        
        .nav-menu {
            flex: 1;
            overflow-y: auto;
            padding-bottom: 20px;
        }
        
        .nav-item {
            padding: 12px 25px;
            display: flex;
            align-items: center;
            color: var(--dark);
            text-decoration: none;
            transition: all 0.3s;
            margin: 5px 0;
        }
        
        .nav-item:hover, .nav-item.active {
            background-color: rgba(67, 97, 238, 0.1);
            color: var(--primary);
            border-left: 3px solid var(--primary);
        }
        
        .nav-item i {
            margin-right: 15px;
            font-size: 18px;
            width: 20px;
            text-align: center;
        }
        
        .sidebar-footer {
            padding: 15px;
            border-top: 1px solid #eee;
            position: sticky;
            bottom: 0;
            background: white;
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .user-profile:hover {
            background-color: rgba(67, 97, 238, 0.1);
        }
        
        .user-profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
            object-fit: cover;
        }
        
        .user-info h4 {
            font-size: 14px;
            margin-bottom: 3px;
        }
        
        .user-info p {
            font-size: 12px;
            color: var(--gray);
        }
        
         /* Main Content */
        .main-content {
            flex: 1;
            padding: 25px;
            overflow-y: auto;
        }
</style>
</head>
<body>
<div class="sidebar">
        <div class="logo">
            <h2>TreasureMart</h2>
        </div>
        
        <div class="nav-menu">
            <a href="Dashboard.jsp" class="nav-item active">
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
            <a href="ViewOrders.jsp" class="nav-item">
                <i class="fas fa-shopping-bag"></i>
                <span>Orders</span>
            </a>
            <a href="#" class="nav-item">
                <i class="fas fa-box-open"></i>
                <span>Products</span>
            </a>
            <a href="#" class="nav-item">
                <i class="fas fa-users"></i>
                <span>Customers</span>
            </a>
            <a href="#" class="nav-item">
                <i class="fas fa-chart-line"></i>
                <span>Analytics</span>
            </a>
            <a href="#" class="nav-item">
                <i class="fas fa-tags"></i>
                <span>Discounts</span>
            </a>
            <a href="#" class="nav-item">
                <i class="fas fa-comments"></i>
                <span>Reviews</span>
            </a>
            <a href="MyProfile.jsp" class="nav-item">
                <i class="fas fa-user-circle"></i>
                <span>My Profile</span>
            </a>
            <a href="#" class="nav-item">
                <i class="fas fa-cog"></i>
                <span>Settings</span>
            </a>
            <a href="/EcommerceWebsite/EmployeeLogout" class="nav-item">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </div>
        
        <div class="sidebar-footer">
            <div class="user-profile">
                <img src="/uploads/<%=employee.getEmployeePic() %>" alt="User">
                <div class="user-info">
                    <h4><%=employee.getFirstName() %> <%=employee.getLastName() %></h4>
                    <p><%=employee.getDesignation() %></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>