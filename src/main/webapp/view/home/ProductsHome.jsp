<%@page import="com.ecommerce.model.Customers"%>
<%@page import="com.ecommerce.model.Cart"%>
<%@page import="com.ecommerce.dao.CartDAO"%>
<%@page import="com.ecommerce.model.Category"%>
<%@page import="com.ecommerce.dao.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecommerce.model.Products"%>
<%@page import="com.ecommerce.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../admin/Header.jsp"></jsp:include>
<style>
:root {
  --primary: #2c3e50;
  --secondary: #3498db;
  --accent: #e74c3c;
  --light: #f8f9fa;
  --dark: #34495e;
  --success: #27ae60;
  --warning: #f39c12;
  --danger: #c0392b;
  --text-color: #555;
  --background: #f0f4f8;
  --card-bg: #ffffff;
  --border-radius: 10px;
  --box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

body {
  padding-top: 60px !important;
  background-color: var(--background);
}

.sidebar {
  position: sticky;
  top: 80px !important;
  height: calc(100vh - 120px);
  overflow-y: auto;
  width: 250px;
  background: var(--light);
  padding: 20px;
  border-radius: var(--border-radius);
  box-shadow: var(--box-shadow);
}

.sidebar h2 {
  font-size: 1.5rem;
  margin-bottom: 1rem;
  color: var(--dark);
}

.sidebar ul {
  list-style: none;
  padding: 0;
}

.sidebar ul li {
  margin: 10px 0;
}

.sidebar ul li a {
  display: block;
  text-decoration: none;
  color: var(--primary);
  font-size: 1.1rem;
  padding: 8px 12px;
  border-radius: 6px;
  transition: all 0.2s ease;
}

.sidebar ul li a:hover {
  color: var(--accent) !important;
  background-color: rgba(231,76,60,0.1);
}

.product-card {
  display: flex;
  flex-direction: column;
  background-color: white;
  border-radius: 5px;
  overflow: hidden;
  transition: all 0.3s ease;
  font-weight: 600;
}

.product-card:hover {
  box-shadow: 0 6px 20px rgba(0,0,0,0.12);
}

.product-image-container {
  height: 280px;
  overflow: hidden;
  border-radius: 8px;
  margin: 10px;
  padding: 5px;
}

.carousel {
  height: 100%;
  width: 100%;
}

.carousel-inner {
  height: 100%;
  width: 100%;
  margin: 0 auto;
}

.carousel-item {
  height: 100%;
  width: 100%;
}

.product-image-container img {
  max-height: 100%;
  max-width: 100%;
  object-fit: contain;
  border-radius: 5px;
}

.custom-control-btn {
  background-color: rgba(0, 0, 0, 0.5);
  border-radius: 50%;
  width: 36px;
  height: 36px;
  padding: 6px;
  top: 45%;
  transform: translateY(-50%);
}

.custom-control-btn:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

.carousel-control-prev-icon,
.carousel-control-next-icon {
  background-size: 70% 70%;
}

.card-title {
  font-size: 1.3rem;
  color: var(--primary);
  font-weight: 600;
}

.rating {
  display: flex;
  align-items: center;
  gap: 4px;
  margin-bottom: 0.5rem;
}

.rating-stars {
  color: #ffc107;
  font-size: 1.1rem;
}

.rating-value {
  font-size: 0.9rem;
  color: var(--text-color);
}

.card-text {
  color: var(--text-color);
  font-size: 0.95rem;
}

.price-info big {
  font-size: 1.4rem;
  color: var(--accent);
  margin-right: 10px;
}

.price-info small {
  font-size: 0.9rem;
  color: #888;
}

.discount {
  font-size: 0.95rem;
  font-weight: 500;
  color: var(--success);
}

.card-footer {
  border-top: 1px solid #eaeaea;
  padding: 0.75rem 0 0 0;
  text-align: right;
}

.container-title {
  font-size: 2rem;
  font-weight: 700;
  margin: 2rem 0 1.5rem;
  color: #11e6ec;
  text-align: center;
  border-bottom: 3px solid var(--accent);
  display: inline-block;
  padding-bottom: 0.3rem;
}

/* Mobile view adjustments */
@media (max-width: 768px) {
  .sidebar {
    position: fixed;
    z-index: 90;
    top: auto;
    height: 100px;
    width: 95%;
    margin-top: 1rem;
    margin-bottom: 2rem;
    padding: 0 10px;
    overflow-x: auto;
    overflow-y: hidden;
  }

  .sidebar ul {
    display: flex;
    gap: 10px;
    margin: 0;
    display: flex;
    align-items: center;
  }

  .sidebar ul li {
    margin: 0;
    background-color: grey;
    border-radius: 10%;
  }

  .sidebar ul li a {
    padding: 8px 12px;
    font-size: 0.95rem;
    white-space: nowrap;
    border-radius: 20px;
  }

  .main{
  	margin-top: 100px;
  }
  
  .container-title{
  	margin-bottom: 2.5rem;
  }
  .product-card{
  	margin: auto;
  	width: 90%;
  }
}

@keyframes slideInOutRight {
  0% {
    opacity: 0;
    transform: translateX(100%);
  }
  10% {
    opacity: 1;
    transform: translateX(0);
  }
  80% {
    opacity: 1;
    transform: translateX(0);
  }
  100% {
    opacity: 0;
    transform: translateX(100%);
  }
}
.alert {
  animation: slideInOutRight 3s ease forwards;
}
</style>
</head>

<body>
<jsp:include page="Navbar.jsp"></jsp:include>

<div class="container">
  <div class="row">
    <!-- Sidebar -->
    <div class="col-md-3 mt-4">
      <div class="sidebar">
        <h2 class="text-danger">Categories</h2>
        <ul>
          <%
          CategoryDAO catDAO = new CategoryDAO();
          ArrayList<Category> catList = catDAO.getAllCategories();
          for (Category cat : catList) {
          %>
          <li><a href="/EcommerceWebsite/view/home/ProductsHome.jsp?categoryName=<%= cat.getCategoryName()%>"><%=cat.getCategoryName()%></a></li>
          <%
          }
          %>
        </ul>
      </div>
    </div>

    <!-- Product Grid -->
    <div class="col-md-9 main">
      <h1 class="container-title">Products</h1>
      <div class="row gy-4">
        <%
        String categoryName = request.getParameter("categoryName");
        ProductDAO dao = new ProductDAO();
        ArrayList<Products> prodList = dao.getAllProducts();
        for (Products prod : prodList) {
          if (prod.getCategoryName().equals(categoryName)) {
        %>
        <div class="product-card mb-4 p-0 d-flex flex-column flex-md-row">
          <div class="product-image-container flex-shrink-0" style="flex: 0 0 280px; max-width: 100%;">
            <div id="carousel<%=prod.getProductCode()%>" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2500">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src='/uploads/<%=prod.getProductImage1()%>' class="d-block w-100 img-fluid h-100" alt="Product Image 1">
                </div>
                <div class="carousel-item">
                  <img src='/uploads/<%=prod.getProductImage2()%>' class="d-block w-100 img-fluid" alt="Product Image 2">
                </div>
                <div class="carousel-item">
                  <img src='/uploads/<%=prod.getProductImage3()%>' class="d-block w-100 img-fluid" alt="Product Image 3">
                </div>
              </div>
              <button class="carousel-control-prev custom-control-btn" type="button" data-bs-target="#carousel<%=prod.getProductCode()%>" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              </button>
              <button class="carousel-control-next custom-control-btn" type="button" data-bs-target="#carousel<%=prod.getProductCode()%>" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
              </button>
            </div>
          </div>
          <div class="d-flex flex-column justify-content-between p-3 flex-grow-1">
            <div>
              <h5 class="card-title"><%=prod.getProductName()%></h5>
              <p class="card-text"><%=prod.getDescription()%></p>
              <p class="price-info">
                <big>₹<%=prod.getCost() - (prod.getCost() * prod.getDiscount() / 100)%></big>
                <small>MRP: <del>₹<%=prod.getCost()%></del></small>
              </p>
              <p class="discount">Save <%=prod.getDiscount()%>%</p>
              <div class="rating">
                <div class="rating-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                <div class="rating-value">(4.0)</div>
              </div>
            </div>
            <div class="card-footer bg-transparent p-0 mt-3">
            <%
            Customers customer = (Customers)session.getAttribute("customer");
            	CartDAO daoCart = new CartDAO();
            	ArrayList<Cart> cartList = daoCart.getAllCartItems();
            	boolean found = false;
            	for(Cart cart : cartList){
            		if(customer!=null){
            		if(cart.getProductCode() == prod.getProductCode() && cart.getCustomerId() == customer.getCustomerId()){
            			found = true;
            			break;
            		}
            		}
            	}
            	if(!found){
            %>            
              <a href="/EcommerceWebsite/AddToCartServlet?productCode=<%=prod.getProductCode() %>" class="btn btn-warning w-25">Add to Cart</a>
              
              <%
            	}
            	else{
              %>
              <a href="/EcommerceWebsite/view/customer/ViewCart.jsp" class="btn btn-warning w-25">Go to Cart</a>
              
              <%
            	}
            	%>
            </div>
          </div>
        </div>
        <%
          }
        }
        %>
      </div>
    </div>
  </div>
</div>

<%
  if (request.getParameter("added") != null) {
    int added = Integer.parseInt(request.getParameter("added"));
    if (added == 0) {
%>
<div class="alert alert-danger alert-dismissible position-fixed top-0 end-0 m-3" style="width: 400px; z-index: 9999;">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <strong>Failed!</strong> Unable to Add product to cart!.
</div>
<%
    } else if (added == 1) {
%>
<div class="alert alert-success alert-dismissible position-fixed top-0 end-0 m-3" style="width: 400px; z-index: 9999;">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <strong>Success!</strong> Added to Cart.
</div>
<%
    }
  }
%>

<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
