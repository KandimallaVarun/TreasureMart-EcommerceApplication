<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	:root {
            --primary-color: #6c5ce7;
            --secondary-color: #a29bfe;
            --dark-color: #2d3436;
            --light-color: #f5f6fa;
            --success-color: #00b894;
            --warning-color: #fdcb6e;
            --danger-color: #d63031;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            overflow-x: hidden;
        }
        
        .main-content {
            margin-left: 250px;
            padding: 20px;
            transition: all 0.3s;
        }
        
        
	.sidebar {
            min-height: 100vh;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 250px;
            transition: all 0.3s;
            z-index: 1000;
        }
        
        .sidebar-header {
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.1);
        }
        
        .sidebar-menu {
            padding: 0;
            list-style: none;
        }
        
        .sidebar-menu li {
            margin: 5px 0;
        }
        
        .sidebar-menu a {
            color: white;
            padding: 12px 20px;
            display: block;
            text-decoration: none;
            transition: all 0.3s;
            border-radius: 5px;
            margin: 0 10px;
        }
        
        .sidebar-menu a:hover, .sidebar-menu a.active {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateX(3px);
        }
        
        .sidebar-menu a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        @media (max-width: 768px) {
            .sidebar {
                margin-left: -250px;
            }
            .sidebar.active {
                margin-left: 0;
            }
            .main-content {
                margin-left: 0;
            }
            .main-content.active {
                margin-left: 250px;
            }
        }
</style>
</head>
<body>
<div class="sidebar">
            <div class="sidebar-header text-center py-4">
                <h3>TreasureMart Admin</h3>
            </div>
            <ul class="sidebar-menu">
                <li>
                    <a href="Dashboard.jsp">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="mt-3">
                    <a href="#categorySubmenu" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-list"></i> Category
                    </a>
                    <ul class="collapse list-unstyled ms-3" id="categorySubmenu">
                        <li>
                            <a href="AddCategory.jsp">
                                <i class="fas fa-plus-circle"></i> Add Category
                            </a>
                        </li>
                        <li>
                            <a href="ViewCategories.jsp">
                                <i class="fas fa-eye"></i> View Categories
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="mt-3">
                    <a href="#productSubmenu" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-box"></i> Products
                    </a>
                    <ul class="collapse list-unstyled ms-3" id="productSubmenu">
                        <li>
                            <a href="AddProduct.jsp">
                                <i class="fas fa-plus-circle"></i> Add Product
                            </a>
                        </li>
                        <li>
                            <a href="ViewProducts.jsp">
                                <i class="fas fa-eye"></i> View Products
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="mt-3">
    <a href="#employeeSubmenu" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
        <i class="fas fa-users"></i> Employees
    </a>
    <ul class="collapse list-unstyled ms-3" id="employeeSubmenu">
        <li>
            <a href="AddEmployee.jsp">
                <i class="fas fa-plus-circle"></i> Add Employee
            </a>
        </li>
        <li>
            <a href="ViewEmployees.jsp">
                <i class="fas fa-eye"></i> View Employees
            </a>
        </li>
    </ul>
</li>
<li class="mt-3">
    <a href="#customerSubmenu" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
        <i class="fas fa-user"></i> Customers
    </a>
    <ul class="collapse list-unstyled ms-3" id="customerSubmenu">
        <li>
            <a href="ViewCustomers.jsp">
                <i class="fas fa-eye"></i> View Customers
            </a>
        </li>
    </ul>
</li>
<li class="mt-3">
    <a href="#feedbackSubmenu" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
        <i class="fas fa-comments"></i> Feedbacks
    </a>
    <ul class="collapse list-unstyled ms-3" id="feedbackSubmenu">
        <li>
            <a href="ViewFeedbacks.jsp">
                <i class="fas fa-eye"></i> View Feedbacks
            </a>
        </li>
    </ul>
</li>
				<li class="mt-3">
                    <a href="ViewOrders.jsp">
                        <i class="fas fa-shopping-bag"></i> View Orders
                    </a>
                </li>
                <li class="mt-3">
                    <a href="#">
                        <i class="fas fa-cog"></i> Settings
                    </a>
                </li>
                <li class="mt-3">
                    <a href="/EcommerceWebsite/AdminLogout">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
        
</body>
</html>