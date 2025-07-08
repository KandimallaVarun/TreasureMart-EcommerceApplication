<%@page import="com.ecommerce.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecommerce.model.Customers"%>
<%@ page import="com.ecommerce.dao.CartDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Customers customer = (Customers) session.getAttribute("customer");

int cartCount = 0;
if (customer != null) {
    CartDAO cartDAO = new CartDAO();
    ArrayList<Cart> cartList= cartDAO.getAllCartItems();
    for(Cart cart: cartList){
    	if(cart.getCustomerId() == customer.getCustomerId()){
    		cartCount++;
    	}
    }
}
%>
<head>
  <style>
  :root {
    --primary: #2c3e50;
    --secondary: #3498db;
    --accent: #e74c3c;
    --light: #ecf0f1;
    --dark: #2c3e50;
  }
  body{
  /*background-color: #01032d;*/
  background-color: #133a4f;
  }

 .navbar {
  background: var(--light);
  padding: 0;              /* remove vertical padding */
  height: 60px;            /* fix navbar height, adjust as needed */
  display: flex;           /* use flexbox for alignment */
  align-items: center;     /* vertically center items */
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  box-sizing: border-box;  /* include padding and border in height */
}


  .navbar-brand {
    font-weight: 700;
    font-size: 1.8rem;
    color: var(--accent) !important;
    display: flex;
    align-items: center;
    margin-left: 2rem;
    transition: all 0.3s ease;
  }

  .nav-link {
    color: var(--dark) !important;
    font-weight: 600;
    font-size: 1rem;
    padding: 0.5rem 1.0rem !important;
    margin: 0 0.1rem;
    border-radius: 6px;
    transition: all 0.3s ease;
    position: relative;
  }

  .nav-link:hover {
    color: var(--accent) !important;
    background: rgba(231, 76, 60, 0.1);
    border-radius: 3px;
  }

  .nav-link.active {
    color: var(--accent) !important;
    font-weight: 700;
  }

  .navbar-toggler {
    border: none;
    padding: 0.5rem;
    color: var(--dark);
  }

  .navbar-toggler:focus {
    box-shadow: none;
  }

  .dropdown-menu {
  background: var(--light);
  border: none;
  border-radius: 8px;
  padding: 0.5rem 0;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
  margin-top: 0.5rem !important;
  border: 1px solid rgba(0, 0, 0, 0.05);
  overflow: hidden; /* prevent items from popping out */
}

.dropdown-item {
  color: var(--dark) !important;
  padding: 0.6rem 1.5rem;
  font-weight: 500;
  transition: all 0.2s ease;
  border-radius: 4px;
  transform-origin: center;
}

.dropdown-item:hover {
  color: var(--accent) !important;
  background: rgba(231, 76, 60, 0.1);
  transform: scale(1.05); /* subtle scale */
}


  .login-btn {
    background: var(--accent);
    color: white !important;
    border-radius: 6px;
    padding: 0.5rem 1.5rem !important;
    margin-left: 0.5rem;
    transition: all 0.3s ease;
  }

  .login-btn:hover {
    background: #c0392b;
    color: white !important;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(231, 76, 60, 0.3);
  }

  .dropdown-toggle::after {
    transition: transform 0.3s ease;
  }

  .show .dropdown-toggle::after {
    transform: rotate(180deg);
  }
  
  .cart-badge {
  position: absolute;
  top: 0px;
  right: 40px;
  background: var(--accent);
  color: #fff;
  font-size: 0.7rem;
  padding: 2px 6px;
  border-radius: 50%;
  line-height: 1;
  font-weight: bold;
}
  

  @media (max-width: 991.98px) {
    .navbar-collapse {
      background: var(--light);
      padding: 1rem 2rem;
      margin-top: 1rem;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
    
    .nav-item {
      margin: 0.3rem 0;
    }
    
    .dropdown-menu {
      background: rgba(255, 255, 255, 0.95);
      margin-left: 1rem;
    }
    
    .login-btn {
      margin-left: 0;
      margin-top: 0.5rem;
    }
  }
  
  </style>
</head>

<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="/EcommerceWebsite/view/home/index.jsp">
      <span style="display: inline-flex; align-items: center;">
        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-shop me-2" viewBox="0 0 16 16">
          <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z"/>
        </svg>
        TreasureMart
      </span>
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
      aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ms-auto me-4">
        <li class="nav-item">
  <a class="nav-link <%= "home".equals(request.getAttribute("currentPage")) ? "active" : "" %>" href="/EcommerceWebsite/view/home/index.jsp">
    <i class="bi bi-house me-2"></i>Home
  </a>
</li>
<li class="nav-item">
  <a class="nav-link <%= "about".equals(request.getAttribute("currentPage")) ? "active" : "" %>" href="/EcommerceWebsite/view/home/About.jsp">
    <i class="bi bi-info-circle me-2"></i>About
  </a>
</li>
<li class="nav-item">
  <a class="nav-link <%= "contact".equals(request.getAttribute("currentPage")) ? "active" : "" %>" href="/EcommerceWebsite/view/home/Contact.jsp">
    <i class="bi bi-chat-left-text me-2"></i>Contact
  </a>
</li>

        <% 
        if (customer == null) {
        %>
        	<li class="nav-item <%= "dashboard".equals(request.getAttribute("currentPage")) ? "active" : "" %>">
            <a class="nav-link" href="/EcommerceWebsite/view/home/CustomerLogin.jsp">
              <i class="bi bi-person-circle"></i> Login
            </a>
          </li>
         <%
        }
        else if(customer != null){
        	%>
        	<li class="nav-item <%= "dashboard".equals(request.getAttribute("currentPage")) ? "active" : "" %>">
            <a class="nav-link" href="/EcommerceWebsite/view/customer/Dashboard.jsp">
              <i class="bi bi-person-circle"></i> <%=customer.getFirstName() %>
            </a>
          </li>
        	<%
        }
        %>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle login-btn" href="#" role="button" data-bs-toggle="dropdown"
            aria-expanded="false">
            <i class="bi bi-box-arrow-in-right me-2"></i>Login
          </a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="/EcommerceWebsite/view/home/AdminLogin.jsp"><i class="bi bi-shield-lock me-2"></i>Admin Login</a></li>
            <li><a class="dropdown-item" href="/EcommerceWebsite/view/home/EmployeeLogin.jsp"><i class="bi bi-person-gear me-2"></i>Employee Login</a></li>
            <li><a class="dropdown-item" href="/EcommerceWebsite/view/home/CustomerLogin.jsp"><i class="bi bi-person-circle me-2"></i>Customer Login</a></li>
          </ul>
        </li>
        <li class="nav-item position-relative">
  <a class="nav-link <%= "cart".equals(request.getAttribute("currentPage")) ? "active" : "" %>" href="/EcommerceWebsite/view/customer/ViewCart.jsp">
    <i class="bi bi-cart3"></i> Cart
    <% if (cartCount > 0) { %>
      <span class="cart-badge"><%= cartCount %></span>
    <% } %>
  </a>
</li>

      </ul>
    </div>
  </div>
</nav>