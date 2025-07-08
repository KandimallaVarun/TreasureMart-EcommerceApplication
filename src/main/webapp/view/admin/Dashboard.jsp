<%@page import="com.ecommerce.model.Products"%>
<%@page import="com.ecommerce.dao.ProductDAO"%>
<%@page import="com.ecommerce.model.Category"%>
<%@page import="com.ecommerce.dao.CategoryDAO"%>
<%@page import="com.ecommerce.model.Customers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecommerce.dao.CustomerDAO"%>
<%@page import="com.ecommerce.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Admin admin = (Admin)session.getAttribute("admin");
if(admin == null){
	response.sendRedirect("/EcommerceWebsite/view/home/AdminLogin.jsp");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>    
    <title>Admin Dashboard | E-commerce</title>
    <jsp:include page="Header.jsp"></jsp:include>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <!-- Custom CSS -->
    <style>
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
        
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 20px;
            overflow: hidden;
        }
        
        .card:hover {
            transform: scale(1.04);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .card-icon {
            font-size: 2.5rem;
            opacity: 0.7;
        }
        
        .stat-card-1 {
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            color: white;
        }
        
        .stat-card-2 {
            background: linear-gradient(45deg, #11998e, #38ef7d);
            color: white;
        }
        
        .stat-card-3 {
            background: linear-gradient(45deg, #f12711, #f5af19);
            color: white;
        }
        
        .stat-card-4 {
            background: linear-gradient(45deg, #654ea3, #eaafc8);
            color: white;
        }
        
        .welcome-card {
            background: white;
            border-left: 5px solid var(--primary-color);
        }
        
        .recent-activity {
            max-height: 400px;
            overflow-y: auto;
        }
        
        .activity-item {
            border-left: 3px solid var(--primary-color);
            padding-left: 15px;
            margin-bottom: 15px;
        }
        
        .activity-time {
            font-size: 0.8rem;
            color: #6c757d;
        }
        
        .chart-container {
            position: relative;
            height: 250px;
            width: 100%;
        }
        
        .quick-action-btn {
            transition: all 0.2s;
        }
        
        .quick-action-btn:hover {
            transform: scale(1.03);
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
    <div class="wrapper">
        <!-- Sidebar -->
        <jsp:include page="Sidebar.jsp"></jsp:include>

        <!-- Main Content -->
        <div class="main-content">
            <div class="container-fluid">
                <!-- Top Bar -->
                <div class="row mb-4">
                    <div class="col-md-12">
                        <div class="d-flex justify-content-between align-items-center">
                            <h2>Dashboard Overview</h2>
                            <div>
                                <span class="me-3">Last updated: <%= new java.text.SimpleDateFormat("MMM dd, yyyy HH:mm").format(new java.util.Date()) %></span>
                                <button class="btn btn-primary d-md-none" id="sidebarToggle">
                                    <i class="fas fa-bars"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Welcome Card -->
                <div class="row mb-4">
                    <div class="col-md-12">
                        <div class="card welcome-card p-4">
                            <div class="row align-items-center">
                                <div class="col-md-8">
                                    <h3>Welcome back, <%=admin.getUsername() %>!</h3>
                                    <p class="text-muted mb-0">Here's what's happening with your store today.</p>
                                </div>
                                <div class="col-md-4 text-end">
                                    <div class="d-flex align-items-center justify-content-end">
                                        <div class="me-3 text-end">
                                            <div class="fw-bold"><%=admin.getUsername() %></div>
                                            <small class="text-muted">Super Admin</small>
                                        </div>
                                        <img src="https://ui-avatars.com/api/?name=Admin&background=6c5ce7&color=fff" 
                                             alt="Admin" class="rounded-circle" width="60">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Stats Cards -->
                <div class="row mb-4">
                    <div class="col-md-3">
                        <div class="card stat-card-1 text-white p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6>Total Products</h6>
                                    <%
                                    	ProductDAO pdao = new ProductDAO();
                                    	ArrayList<Products> pList = pdao.getAllProducts();
                                    	out.println("<h2>"+ pList.size()+"</h2>");
                                    %>
                                    <small class="opacity-75">+12% from last month</small>
                                </div>
                                <i class="fas fa-box card-icon"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card stat-card-2 text-white p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6>Total Categories</h6>
                                    <%
                                    	CategoryDAO cdao = new CategoryDAO();
                                    	ArrayList<Category> cList = cdao.getAllCategories();
                                    	out.println("<h2>"+ cList.size()+"</h2>");
                                    %>
                                    <small class="opacity-75">+2 new this month</small>
                                </div>
                                <i class="fas fa-list card-icon"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card stat-card-3 text-white p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6>Today's Orders</h6>
                                    <h2>56</h2>
                                    <small class="opacity-75">+5% from yesterday</small>
                                </div>
                                <i class="fas fa-shopping-cart card-icon"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card stat-card-4 text-white p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6>Revenue</h6>
                                    <h2>$3,287</h2>
                                    <small class="opacity-75">+8% from last week</small>
                                </div>
                                <i class="fas fa-dollar-sign card-icon"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Charts and Quick Actions -->
                <div class="row">
                    <!-- Sales Chart -->
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Sales by Category</h5>
                                <select class="form-select form-select-sm w-auto">
                                    <option>This Month</option>
                                    <option>Last Month</option>
                                    <option>This Year</option>
                                </select>
                            </div>
                            <div class="card-body">
                                <div class="chart-container">
                                    <canvas id="salesChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Products Chart -->
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Products Distribution</h5>
                                <select class="form-select form-select-sm w-auto">
                                    <option>All Categories</option>
                                    <option>Electronics</option>
                                    <option>Clothing</option>
                                    <option>Home & Garden</option>
                                </select>
                            </div>
                            <div class="card-body">
                                <div class="chart-container">
                                    <canvas id="productsChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Recent Activity and Quick Actions -->
                <div class="row mt-4">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h5>Recent Activity</h5>
                            </div>
                            <div class="card-body recent-activity">
                                <div class="activity-item">
                                    <h6>New order received #ORD-1254</h6>
                                    <p>Customer: John Doe ordered 3 items (Total: $124.99)</p>
                                    <div class="activity-time">10 minutes ago</div>
                                </div>
                                <div class="activity-item">
                                    <h6>Product added: Wireless Headphones</h6>
                                    <p>New product added to Electronics category by Admin</p>
                                    <div class="activity-time">2 hours ago</div>
                                </div>
                                <div class="activity-item">
                                    <h6>New category created: Home Appliances</h6>
                                    <p>Category created with 12 initial products</p>
                                    <div class="activity-time">5 hours ago</div>
                                </div>
                                <div class="activity-item">
                                    <h6>Order shipped #ORD-1253</h6>
                                    <p>Order has been shipped to customer (Tracking: #USPS12345)</p>
                                    <div class="activity-time">Yesterday</div>
                                </div>
                                <div class="activity-item">
                                    <h6>System update completed</h6>
                                    <p>Latest security patches installed (v2.5.1)</p>
                                    <div class="activity-time">2 days ago</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h5>Quick Actions</h5>
                            </div>
                            <div class="card-body">
                                <a href="AddProduct.jsp" class="btn btn-primary btn-block mb-3 quick-action-btn">
                                    <i class="fas fa-plus me-2"></i> Add Product
                                </a>
                                <a href="AddCategory.jsp" class="btn btn-success btn-block mb-3 quick-action-btn">
                                    <i class="fas fa-list me-2"></i> Add Category
                                </a>
                                <a href="ViewProducts.jsp" class="btn btn-info btn-block mb-3 quick-action-btn">
                                    <i class="fas fa-box me-2"></i> Manage Products
                                </a>
                                <a href="ViewCategories.jsp" class="btn btn-warning btn-block mb-3 quick-action-btn">
                                    <i class="fas fa-tags me-2"></i> Manage Categories
                                </a>
                                <a href="#" class="btn btn-danger btn-block quick-action-btn mb-3 ">
                                    <i class="fas fa-chart-pie me-2"></i> View Reports
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Custom JS -->
    <script>
        // Toggle sidebar on mobile
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            document.querySelector('.sidebar').classList.toggle('active');
            document.querySelector('.main-content').classList.toggle('active');
        });
        
        // Initialize Charts
        document.addEventListener('DOMContentLoaded', function() {
    <% 
        CategoryDAO dao = new CategoryDAO();
        ArrayList<Category> catList = dao.getAllCategories();
        ProductDAO dao2 = new ProductDAO();
        ArrayList<Products> prodList = dao2.getAllProducts();
    %>

    if (typeof Chart === 'undefined') {
        console.error('Chart.js not loaded!');
        return;
    }

    const labels_list = [];
    const data_list = [];

    <% 
        for(Category cat : catList){
            int ct = 0;
            for(Products prod : prodList){
                if(prod.getCategoryName().equals(cat.getCategoryName())){
                    ct++;
                }
            }
    %>
        labels_list.push("<%= cat.getCategoryName() %>");
        data_list.push(<%= ct %>);
    <% } %>

    const salesCtx = document.getElementById('salesChart');
    if (salesCtx) {
        new Chart(salesCtx, {
            type: 'pie',
            data: {
                labels: labels_list,
                datasets: [{
                    data: data_list,
                    backgroundColor: [
                        '#6a11cb',
                        '#11998e',
                        '#f12711',
                        '#654ea3',
                        '#fdcb6e',
                        'red',
                        'blue',
                        'orange',
                        'green'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'right' },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                const label = context.label || '';
                                const value = context.raw || 0;
                                const total = context.dataset.data.reduce((a, b) => a + b, 0);
                                const percentage = Math.round((value / total) * 100);
                                return `${label}: ${percentage}% (${value})`;
                            }
                        }
                    }
                }
            }
        });
    } else {
        console.error('salesChart element not found');
    }

    // Products Chart
    const productsCtx = document.getElementById('productsChart');
    if (productsCtx) {
        new Chart(productsCtx, {
            type: 'doughnut',
            data: {
                labels: ['In Stock', 'Low Stock', 'Out of Stock', 'On Sale'],
                datasets: [{
                    data: [856, 124, 32, 242],
                    backgroundColor: [
                        '#00b894',
                        '#fdcb6e',
                        '#d63031',
                        '#6c5ce7'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'right' },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                const label = context.label || '';
                                const value = context.raw || 0;
                                const total = context.dataset.data.reduce((a, b) => a + b, 0);
                                const percentage = Math.round((value / total) * 100);
                                return `${label}: ${percentage}% (${value})`;
                            }
                        }
                    }
                }
            }
        });
    } else {
        console.error('productsChart element not found');
    }
});
        
    </script>
</body>
</html>