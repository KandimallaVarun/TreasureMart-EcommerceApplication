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
<html lang="en">
<head>
<jsp:include page="../admin/Header.jsp"></jsp:include>
    <title>Employee Dashboard | E-Commerce</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .header h1 {
            color: var(--dark);
            font-size: 24px;
        }
        
        .header-actions {
            display: flex;
            align-items: center;
        }
        
        .search-bar {
            position: relative;
            margin-right: 20px;
        }
        
        .search-bar input {
            padding: 10px 15px 10px 40px;
            border: 1px solid #ddd;
            border-radius: 30px;
            width: 250px;
            outline: none;
            transition: all 0.3s;
        }
        
        .search-bar input:focus {
            border-color: var(--primary);
        }
        
        .search-bar i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
        }
        
        .notification {
            position: relative;
            margin-right: 20px;
            color: var(--dark);
            font-size: 20px;
        }
        
        .notification .badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: var(--danger);
            color: white;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            font-size: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        /* Dashboard Widgets */
        .dashboard-widgets {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .widget {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }
        
        .widget:hover {
            transform: translateY(-5px);
        }
        
        .widget-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .widget-title {
            font-size: 14px;
            color: var(--gray);
            font-weight: 500;
        }
        
        .widget-icon {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
        
        .widget-icon.blue {
            background-color: var(--primary);
        }
        
        .widget-icon.green {
            background-color: var(--success);
        }
        
        .widget-icon.orange {
            background-color: var(--warning);
        }
        
        .widget-icon.pink {
            background-color: var(--danger);
        }
        
        .widget-value {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 5px;
            color: var(--dark);
        }
        
        .widget-change {
            font-size: 12px;
            display: flex;
            align-items: center;
        }
        
        .widget-change.positive {
            color: #2ecc71;
        }
        
        .widget-change.negative {
            color: #e74c3c;
        }
        
        /* Main Sections */
        .main-sections {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
        }
        
        .section {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .section-title {
            font-size: 18px;
            font-weight: 600;
            color: var(--dark);
        }
        
        .section-actions a {
            color: var(--primary);
            text-decoration: none;
            font-size: 14px;
            display: flex;
            align-items: center;
        }
        
        .section-actions a i {
            margin-left: 5px;
        }
        
        /* Recent Orders Table */
        .orders-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .orders-table th {
            text-align: left;
            padding: 12px 15px;
            background-color: #f8f9fa;
            color: var(--gray);
            font-weight: 500;
            font-size: 14px;
        }
        
        .orders-table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }
        
        .order-status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .status-completed {
            background-color: #d4edda;
            color: #155724;
        }
        
        .status-processing {
            background-color: #cce5ff;
            color: #004085;
        }
        
        /* Activity Feed */
        .activity-feed {
            list-style: none;
        }
        
        .activity-item {
            display: flex;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        
        .activity-item:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(67, 97, 238, 0.1);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            flex-shrink: 0;
        }
        
        .activity-content h4 {
            font-size: 14px;
            margin-bottom: 5px;
            color: var(--dark);
        }
        
        .activity-content p {
            font-size: 13px;
            color: var(--gray);
            margin-bottom: 5px;
        }
        
        .activity-time {
            font-size: 12px;
            color: var(--gray);
        }
        
        /* Employee Profile Card */
        .profile-card {
            text-align: center;
            padding: 30px 20px;
        }
        
        .profile-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 15px;
            border: 3px solid var(--primary);
        }
        
        .profile-name {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .profile-role {
            color: var(--primary);
            font-size: 14px;
            margin-bottom: 15px;
            font-weight: 500;
        }
        
        .profile-stats {
            display: flex;
            justify-content: space-around;
            margin: 25px 0;
        }
        
        .stat-item h3 {
            font-size: 20px;
            margin-bottom: 5px;
        }
        
        .stat-item p {
            font-size: 12px;
            color: var(--gray);
        }
        
        .profile-contact {
            text-align: left;
            margin-top: 20px;
        }
        
        .contact-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .contact-item i {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: rgba(67, 97, 238, 0.1);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
        }
        
        .contact-info h4 {
            font-size: 13px;
            color: var(--gray);
            margin-bottom: 3px;
        }
        
        .contact-info p {
            font-size: 14px;
            color: var(--dark);
        }
        
        /* Quick Actions */
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin-top: 15px;
        }
        
        .action-item {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            transition: all 0.3s;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
        }
        
        .action-item:hover {
            background: #e9ecef;
            transform: translateY(-2px);
        }
        
        .action-icon {
            width: 40px;
            height: 40px;
            background-color: rgba(67, 97, 238, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 10px;
            color: var(--primary);
        }
        
        .action-label {
            font-size: 13px;
            color: var(--dark);
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <jsp:include page="Sidebar.jsp"></jsp:include>
    
    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1>Employee Dashboard</h1>
            <div class="header-actions">
                <div class="search-bar">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search...">
                </div>
                <div class="notification">
                    <i class="fas fa-bell"></i>
                    <span class="badge">3</span>
                </div>
                <div class="user-avatar">
                    <img src="/uploads/<%=employee.getEmployeePic() %>" alt="User" width="40" height="40" style="border-radius: 50%;">
                </div>
            </div>
        </div>
        
        <!-- Dashboard Widgets -->
        <div class="dashboard-widgets">
            <div class="widget">
                <div class="widget-header">
                    <div class="widget-title">Total Sales</div>
                    <div class="widget-icon blue">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                </div>
                <div class="widget-value">$24,780</div>
                <div class="widget-change positive">
                    <i class="fas fa-arrow-up"></i> 12.5% from last month
                </div>
            </div>
            
            <div class="widget">
                <div class="widget-header">
                    <div class="widget-title">New Orders</div>
                    <div class="widget-icon green">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                </div>
                <div class="widget-value">1,245</div>
                <div class="widget-change positive">
                    <i class="fas fa-arrow-up"></i> 8.3% from last month
                </div>
            </div>
            
            <div class="widget">
                <div class="widget-header">
                    <div class="widget-title">Products</div>
                    <div class="widget-icon orange">
                        <i class="fas fa-boxes"></i>
                    </div>
                </div>
                <div class="widget-value">856</div>
                <div class="widget-change negative">
                    <i class="fas fa-arrow-down"></i> 2.1% from last month
                </div>
            </div>
            
            <div class="widget">
                <div class="widget-header">
                    <div class="widget-title">Customers</div>
                    <div class="widget-icon pink">
                        <i class="fas fa-users"></i>
                    </div>
                </div>
                <div class="widget-value">5,421</div>
                <div class="widget-change positive">
                    <i class="fas fa-arrow-up"></i> 15.7% from last month
                </div>
            </div>
        </div>
        
        <!-- Main Sections -->
        <div class="main-sections">
            <div class="left-section">
                <div class="section">
                    <div class="section-header">
                        <div class="section-title">Recent Orders</div>
                        <div class="section-actions">
                            <a href="#">View All <i class="fas fa-chevron-right"></i></a>
                        </div>
                    </div>
                    <table class="orders-table">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer</th>
                                <th>Date</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#ORD-7841</td>
                                <td>John Smith</td>
                                <td>May 15, 2023</td>
                                <td>$245.99</td>
                                <td><span class="order-status status-completed">Completed</span></td>
                                <td><i class="fas fa-ellipsis-v"></i></td>
                            </tr>
                            <tr>
                                <td>#ORD-7840</td>
                                <td>Emily Johnson</td>
                                <td>May 15, 2023</td>
                                <td>$189.50</td>
                                <td><span class="order-status status-processing">Processing</span></td>
                                <td><i class="fas fa-ellipsis-v"></i></td>
                            </tr>
                            <tr>
                                <td>#ORD-7839</td>
                                <td>Michael Brown</td>
                                <td>May 14, 2023</td>
                                <td>$320.00</td>
                                <td><span class="order-status status-pending">Pending</span></td>
                                <td><i class="fas fa-ellipsis-v"></i></td>
                            </tr>
                            <tr>
                                <td>#ORD-7838</td>
                                <td>Sarah Wilson</td>
                                <td>May 14, 2023</td>
                                <td>$145.75</td>
                                <td><span class="order-status status-completed">Completed</span></td>
                                <td><i class="fas fa-ellipsis-v"></i></td>
                            </tr>
                            <tr>
                                <td>#ORD-7837</td>
                                <td>David Lee</td>
                                <td>May 13, 2023</td>
                                <td>$89.99</td>
                                <td><span class="order-status status-completed">Completed</span></td>
                                <td><i class="fas fa-ellipsis-v"></i></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <div class="section" style="margin-top: 20px;">
                    <div class="section-header">
                        <div class="section-title">Recent Activities</div>
                        <div class="section-actions">
                            <a href="#">View All <i class="fas fa-chevron-right"></i></a>
                        </div>
                    </div>
                    <ul class="activity-feed">
                        <li class="activity-item">
                            <div class="activity-icon">
                                <i class="fas fa-shopping-cart"></i>
                            </div>
                            <div class="activity-content">
                                <h4>New order received</h4>
                                <p>Order #ORD-7842 from Robert Taylor for $156.99</p>
                                <div class="activity-time">10 minutes ago</div>
                            </div>
                        </li>
                        <li class="activity-item">
                            <div class="activity-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div class="activity-content">
                                <h4>Order completed</h4>
                                <p>Order #ORD-7838 has been delivered successfully</p>
                                <div class="activity-time">1 hour ago</div>
                            </div>
                        </li>
                        <li class="activity-item">
                            <div class="activity-icon">
                                <i class="fas fa-user-plus"></i>
                            </div>
                            <div class="activity-content">
                                <h4>New customer registered</h4>
                                <p>Jennifer Adams created an account</p>
                                <div class="activity-time">3 hours ago</div>
                            </div>
                        </li>
                        <li class="activity-item">
                            <div class="activity-icon">
                                <i class="fas fa-box-open"></i>
                            </div>
                            <div class="activity-content">
                                <h4>Product added</h4>
                                <p>New product "Wireless Headphones" added to inventory</p>
                                <div class="activity-time">5 hours ago</div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            
            <div class="right-section">
                <div class="section">
                    <div class="profile-card">
                        <img src="/uploads/<%=employee.getEmployeePic() %>" alt="Profile" class="profile-img">
                        <h3 class="profile-name"><%=employee.getFirstName() %> <%=employee.getLastName() %></h3>
                        <p class="profile-role"><%=employee.getDesignation() %></p>
                        
                        <div class="profile-stats">
                            <div class="stat-item">
                                <h3>1,245</h3>
                                <p>Orders</p>
                            </div>
                            <div class="stat-item">
                                <h3>856</h3>
                                <p>Products</p>
                            </div>
                            <div class="stat-item">
                                <h3>98%</h3>
                                <p>Rating</p>
                            </div>
                        </div>
                        
                        <div class="profile-contact">
                            <div class="contact-item">
                                <i class="fas fa-envelope"></i>
                                <div class="contact-info">
                                    <h4>Email</h4>
                                    <p><%=employee.getEmail() %></p>
                                </div>
                            </div>
                            <div class="contact-item">
                                <i class="fas fa-phone"></i>
                                <div class="contact-info">
                                    <h4>Phone</h4>
                                    <p><%=employee.getMobile() %></p>
                                </div>
                            </div>
                            <div class="contact-item">
                                <i class="fas fa-user"></i>
                                <div class="contact-info">
                                    <h4>Gender</h4>
                                    <p><%=employee.getGender() %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="section" style="margin-top: 20px;">
                    <div class="section-header">
                        <div class="section-title">Quick Actions</div>
                    </div>
                    <div class="quick-actions">
                        <a href="#" class="action-item">
                            <div class="action-icon">
                                <i class="fas fa-plus"></i>
                            </div>
                            <p class="action-label">Add Product</p>
                        </a>
                        <a href="#" class="action-item">
                            <div class="action-icon">
                                <i class="fas fa-tags"></i>
                            </div>
                            <p class="action-label">Create Discount</p>
                        </a>
                        <a href="#" class="action-item">
                            <div class="action-icon">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <p class="action-label">View Reports</p>
                        </a>
                        <a href="#" class="action-item">
                            <div class="action-icon">
                                <i class="fas fa-cog"></i>
                            </div>
                            <p class="action-label">Settings</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>