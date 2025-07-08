<%@page import="com.ecommerce.dao.CategoryDAO"%>
<%@page import="com.ecommerce.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
request.setAttribute("currentPage", "home");
%>
<jsp:include page="../admin/Header.jsp"></jsp:include>
<style type="text/css">
.categories {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 1.5rem;
	padding: 2rem 0;
}

.card {
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
	border-radius: 12px;
	transition: all 0.3s ease;
	overflow: hidden;
}

.card:hover {
	transform: scale(1.03);
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
}

.card-img-top {
	object-fit: cover;
}

.card-title {
	font-size: 1.3rem;
	font-weight: 600;
	color: #2c3e50;
}

.card-text {
	font-size: 0.95rem;
	color: #555;
}

h1.section-title {
	text-align: center;
	margin: 3rem 0 2rem;
	font-size: 2.2rem;
	font-weight: 700;
	color: #11e6ec;
	border-bottom: 3px solid #e74c3c;
	display: inline-block;
	padding-bottom: 0.5rem;
}

.carousel-inner img {
	border-radius: 30px;
}

.carousel {
	margin-top: 60px;
}

.carousel-item {
	border-radius: 10px;
}

  /* Darker carousel indicators */
  .carousel-indicators button {
    background-color: rgb(0,0,0);
     transition: all 0.3s ease;
     border-radius: 30%;
  }

  .carousel-indicators .active {
    background-color: rgba(0,0,0,0.6);
    transform: scale(1.2);
  }

.carousel-indicators button:hover {
  background-color: rgba(0, 0, 0, 0.8);
}


  /* Custom control icons */
  .custom-control-icon {
    background-color: rgba(0, 0, 0, 0.6);
    border-radius: 50%;
    padding: 10px;
    background-size: 50%, 50%;
  }

  .custom-control-icon:hover {
    background-color: rgba(0, 0, 0, 0.8);
  }

@media (max-width: 768px) {
	.categories {
		flex-direction: column;
		align-items: center;
		padding: 1rem 0;
	}
	.card {
		width: 90%;
	}
  .carousel-item img {
    height: 250px !important;
    object-fit: cover;
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
  animation: slideInOutRight 5s ease forwards;
}

</style>
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>

	<!-- Carousel -->
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <!-- Indicators -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
      class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
      aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
      aria-label="Slide 3"></button>
  </div>

  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../../images/caurosel2.jpg" class="d-block w-100 p-4" alt="..." style="height: 500px">
    </div>
    <div class="carousel-item">
      <img src="../../images/caurosel1.jpg" class="d-block w-100 p-4" alt="..." style="height: 500px">
    </div>
    <div class="carousel-item">
      <img src="../../images/caurosel3.jpg" class="d-block w-100 p-4" alt="..." style="height: 500px">
    </div>
  </div>

  <!-- Controls -->
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon custom-control-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>

  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon custom-control-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

	<!-- Categories -->
	<div class="container">
		<h1 class="section-title">Shop by Categories</h1>
		<div class="categories">
			<%
			CategoryDAO dao = new CategoryDAO();
			ArrayList<Category> catList = dao.getAllCategories();
			for (Category cat : catList) {
			%>
			<div class="card" style="width: 18rem; height:370px">
				<img src='/uploads/<%=cat.getCategoryImage() %>' class="card-img-top" alt="category" height="200px">
				<div class="card-body d-flex flex-column justify-content-between">
					<h5 class="card-title"><%=cat.getCategoryName() %></h5>
					<p class="card-text">Explore the best deals and products in this category.</p>
					<a href="/EcommerceWebsite/view/home/ProductsHome.jsp?categoryName=<%= cat.getCategoryName()%>" class="btn btn-dark mt-auto">Explore</a>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>

<%
  if (request.getParameter("res") != null) {
    int res = Integer.parseInt(request.getParameter("res"));
    if (res == 1) {
    	%>
<div class="alert alert-success alert-dismissible position-fixed top-0 end-0 m-3" style="width: 400px; z-index: 9999;">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <strong>Success!</strong> Payment completed. Your order is being prepared.
</div>
<%
    }
  }
%>
	
</body>
</html>
