<%@page import="com.ecommerce.model.Category"%>
<%@page import="com.ecommerce.dao.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="Header.jsp"></jsp:include>
<style>
.form-container {
	max-width: 800px;
}

.image-upload {
	border: 1px dashed #ccc;
	padding: 20px;
	border-radius: 5px;
	background-color: #f9f9f9;
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
	<div class="wrapper">
		<jsp:include page="Sidebar.jsp"></jsp:include>
		<div class="main-content">
			<button class="btn btn-primary d-md-none float-end"
				id="sidebarToggle">
				<i class="fas fa-bars"></i>
			</button>
			<div class="container py-5">
				<div class="row justify-content-center">
					<div class="col form-container">
						<div class="card shadow">
							<div class="card-header bg-primary text-white">
								<h3 class="card-title mb-0">Add New Product</h3>
							</div>
							<div class="card-body">
								<form action="/EcommerceWebsite/Admin/AddProduct" method="POST"
									enctype="multipart/form-data">
									<!-- Basic Product Information -->
									<div class="row mb-4">
										<!-- <div class="col-md-6 mb-3">
											<label for="productCode" class="form-label">Product
												Code</label> <input type="number" class="form-control"
												id="productCode" name="productCode" required>
										</div> -->
										<div class="col-md-6 mb-3">
											<label for="categoryName" class="form-label">Category
												Name</label> <select class="form-select" id="categoryName"
												name="categoryName" required>
												<option value="" selected disabled>Select Category</option>
												<%
												CategoryDAO dao = new CategoryDAO();
												ArrayList<Category> catList = dao.getAllCategories();
												for (Category category : catList) {
												%>
												<option value="<%=category.getCategoryName()%>"><%=category.getCategoryName()%></option>
												<%
												}
												%>
											</select>
										</div>
										<div class="col-12 mb-3">
											<label for="productName" class="form-label">Product
												Name</label> <input type="text" class="form-control"
												id="productName" name="productName" required>
										</div>
										<div class="col-12 mb-3">
											<label for="description" class="form-label">Description</label>
											<textarea class="form-control" id="description"
												name="description" rows="3"></textarea>
										</div>
									</div>

									<!-- Pricing and Inventory -->
									<div class="row mb-4">
										<div class="col-md-6 mb-3">
											<label for="discount" class="form-label">Discount (%)</label>
											<input type="number" class="form-control" id="discount"
												name="discount">
										</div>
										<div class="col-md-6 mb-3">
											<label for="count" class="form-label">cost (₹)</label> <input
												type="number" class="form-control" id="cost" name="cost"
												min="0" required>
										</div>
									</div>

									<!-- Product Images -->
									<div class="mb-4 image-upload">
										<h5 class="mb-3">Product Images</h5>
										<div class="row">
											<div class="col-md-4 mb-3">
												<label for="productImage1" class="form-label">Primary
													Image</label> <input type="file" class="form-control"
													id="productImage1" name="productImage1" accept="image/*"
													required>
											</div>
											<div class="col-md-4 mb-3">
												<label for="productImage2" class="form-label">Secondary
													Image</label> <input type="file" class="form-control"
													id="productImage2" name="productImage2" accept="image/*">
											</div>
											<div class="col-md-4 mb-3">
												<label for="productImage3" class="form-label">Additional
													Image</label> <input type="file" class="form-control"
													id="productImage3" name="productImage3" accept="image/*">
											</div>
										</div>
									</div>

									<!-- Form Actions -->
									<div class="d-flex justify-content-between">
										<button type="reset" class="btn btn-secondary">Reset</button>
										<button type="submit" class="btn btn-primary">Add
											Product</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<% if (request.getParameter("res") != null) {
	int res = Integer.parseInt(request.getParameter("res"));
	if (res == 1) {
%>
<div class="alert alert-success alert-dismissible position-fixed top-0 end-0 m-3"
     style="width: 400px; z-index: 9999;">
	<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	<strong>Success!</strong> Product was added.
</div>
<% } else if (res == 0) { %>
<div class="alert alert-danger alert-dismissible position-fixed top-0 end-0 m-3"
     style="width: 400px; z-index: 9999;">
	<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	<strong>Failed!</strong> Product not added.
</div>
<% } } %>
<script type="text/javascript">
	// Sidebar toggle (as before)
	document.getElementById('sidebarToggle').addEventListener('click', function () {
		document.querySelector('.sidebar').classList.toggle('active');
		document.querySelector('.main-content').classList.toggle('active');
	});

</script>
</body>
</html>