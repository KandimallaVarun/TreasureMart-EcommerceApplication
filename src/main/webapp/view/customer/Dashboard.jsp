<%@page import="com.ecommerce.model.CustomerOrders"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecommerce.dao.CustomerOrdersDAO"%>
<%@page import="com.ecommerce.model.Customers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Customers customer = (Customers) session.getAttribute("customer");
if (customer == null) {
    response.sendRedirect("/EcommerceWebsite/view/home/CustomerLogin.jsp");
    return;
}
CustomerOrdersDAO dao = new CustomerOrdersDAO();
ArrayList<CustomerOrders> custList = dao.getAllOrders();
int totalOrders = 0;
int pendingOrders = 0;
for(CustomerOrders cust : custList){
	if(cust.getCustomerId() == customer.getCustomerId()){
		totalOrders++;
		if(cust.getOrderStatus().equalsIgnoreCase("pending")){
			pendingOrders++;
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Dashboard | E-Commerce</title>
    <jsp:include page="../admin/Header.jsp"></jsp:include>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

    <style>
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

        body {
            background-color: #f5f7ff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding-top: 80px;
            color: #333;
        }

        .dashboard-container {
            padding-bottom: 40px;
        }

        .welcome-section {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 20px rgba(67, 97, 238, 0.15);
            position: relative;
            overflow: hidden;
        }

        .welcome-section::before {
            content: "";
            position: absolute;
            top: -50px;
            right: -50px;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }

        .welcome-section::after {
            content: "";
            position: absolute;
            bottom: -80px;
            left: -80px;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }

        .welcome-title {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 5px;
            position: relative;
            z-index: 1;
        }

        .welcome-subtitle {
            font-size: 1rem;
            opacity: 0.9;
            font-weight: 400;
            position: relative;
            z-index: 1;
        }

        .stats-card {
            border: none;
            border-radius: 12px;
            background: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            height: 100%;
            overflow: hidden;
            position: relative;
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .stats-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
        }

        .stats-card.orders::before {
            background: rgba(0,0,255,0.6);
        }

        .stats-card.pending::before {
            background: var(--warning);
        }

        .stats-card.wishlist::before {
            background: var(--danger);
        }

        .card-body {
    padding: 15px;
    text-align: center;
    position: relative;
}

.card-icon {
    font-size: 2.8rem; /* Slightly larger for better presence */
    margin-bottom: 5px;
    display: inline-block;
    transition: all 0.3s ease;
    filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1)); /* Soft shadow for depth */
}

/* Gradient backgrounds with improved contrast */
.stats-card.orders .card-icon {
    background: linear-gradient(135deg, var(--primary), #3a56e8);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
}

.stats-card.pending .card-icon {
    background: linear-gradient(135deg, #f8961e, #f9b342);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
}

.stats-card.wishlist .card-icon {
    background: linear-gradient(135deg, #f94144, #ff6b6b);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* Hover effects */
.stats-card:hover .card-icon {
    transform: scale(1.1); /* Subtle grow effect */
    filter: drop-shadow(0 4px 6px rgba(0,0,0,0.15));
}

/* Pulse animation for pending orders */
.stats-card.pending .card-icon {
    animation: pulse 2s infinite ease-in-out;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}

        .card-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #555;
            margin-bottom: 5px;
        }

        .card-value {
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 0;
        }

        .card-footer-link {
            display: block;
            padding: 10px;
            background: rgba(0, 0, 0, 0.02);
            color: var(--primary);
            font-weight: 500;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .card-footer-link:hover {
            background: rgba(67, 97, 238, 0.1);
            color: var(--secondary);
        }

        .card-footer-link i {
            transition: transform 0.2s ease;
        }

        .card-footer-link:hover i {
            transform: translateX(3px);
        }

        @media (max-width: 768px) {
            .welcome-section {
                padding: 20px;
                text-align: center;
            }
            
            .welcome-title {
                font-size: 1.8rem;
            }
            
            .card-body {
                padding: 20px;
            }
            
            .card-value {
                font-size: 1.8rem;
            }
            .card-icon {
        font-size: 2.2rem;
    }
            
        }
        
        @media (max-width: 991.98px) {
    .sidebar {
        display: none;
    }
}


        /* Animation classes */
        .animate-delay-1 {
            animation-delay: 0.1s;
        }
        .animate-delay-2 {
            animation-delay: 0.2s;
        }
        .animate-delay-3 {
            animation-delay: 0.3s;
        }
    </style>
</head>

<body>
    <jsp:include page="../home/Navbar.jsp"></jsp:include>

    <div class="container dashboard-container">
                <!-- Mobile toggle button -->
<button class="btn btn-dark mb-3 d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#customerSidebar" aria-controls="customerSidebar">
  <i class="bi bi-list"></i>
</button>
        <div class="row">
            <!-- Sidebar -->
            <jsp:include page="Sidebar.jsp"></jsp:include>
            

            <!-- Dashboard Content -->
            <div class="col-lg-9">
                <div class="welcome-section animate__animated animate__fadeIn">
                    <h1 class="welcome-title">Welcome back, <%=customer.getFirstName()%>!</h1>
                    <p class="welcome-subtitle">Here's what's happening with your account today</p>
                </div>

                <div class="row gy-4">
                    <!-- Orders Card -->
                    <div class="col-md-4 animate__animated animate__fadeInUp animate-delay-1">
                        <div class="stats-card orders">
                            <div class="card-body">
                                <i class="bi bi-cart-check-fill card-icon" style="color: #4361ee;"></i>
                                <h5 class="card-title">Total Orders</h5>
                                <p class="card-value"><%=totalOrders %></p>
                            </div>
                            <a href="#" class="card-footer-link">
                                View all orders <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>

                    <!-- Pending Orders Card -->
                    <div class="col-md-4 animate__animated animate__fadeInUp animate-delay-2">
                        <div class="stats-card pending">
                            <div class="card-body">
                                <i class="bi bi-clock-history card-icon" style="color: #f8961e;"></i>
                                <h5 class="card-title">Pending Orders</h5>
                                <p class="card-value"><%=pendingOrders %></p>
                            </div>
                            <a href="#" class="card-footer-link">
                                Track orders <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>

                    <!-- Wishlist Card -->
                    <div class="col-md-4 animate__animated animate__fadeInUp animate-delay-3">
                        <div class="stats-card wishlist">
                            <div class="card-body">
                                <i class="bi bi-heart-fill card-icon" style="color: #f94144;"></i>
                                <h5 class="card-title">Wishlist Items</h5>
                                <p class="card-value">5</p>
                            </div>
                            <a href="#" class="card-footer-link">
                                View wishlist <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../home/Footer.jsp"></jsp:include>

    <script>
        // Add hover effects dynamically
        document.querySelectorAll('.stats-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-5px)';
                this.style.boxShadow = '0 10px 25px rgba(0, 0, 0, 0.1)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = '';
                this.style.boxShadow = '0 5px 15px rgba(0, 0, 0, 0.05)';
            });
        });
    </script>
</body>
</html>