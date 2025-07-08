<%@page import="com.ecommerce.model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="Header.jsp"></jsp:include>
</head>
<body>
<% Category category = (Category)session.getAttribute("category"); %>
	<div class="wrapper">
		<jsp:include page="Sidebar.jsp"></jsp:include>
		<div class="main-content">
			<button class="btn btn-primary d-md-none float-end"
				id="sidebarToggle">
				<i class="fas fa-bars"></i>
			</button>
			<div class="container d-flex flex-column justify-content-center"
				style="height: 90vh">
				<div class="row justify-content-center">
					<div class="col-md-6">
						<div class="card shadow">
							<div class="card-header bg-primary text-white">
								<h4 class="card-title mb-0">Add New Category</h4>
							</div>
							<div class="card-body">
								<form action="/EcommerceWebsite/Admin/UpdateCategory" method="POST">
									<div class="mb-3">
										<label for="categoryId" class="form-label">Category ID</label>
										<input type="text" class="form-control" id="categoryId"
											name="categoryId" value="<%=category.getCategoryId() %>" required readonly>
									</div>
									<div class="mb-3">
										<label for="categoryName" class="form-label">Category
											Name</label> <input type="text" class="form-control"
											id="categoryName" name="categoryName" value="<%=category.getCategoryName() %>" required>
									</div>
									<div class="d-grid gap-2">
										<button type="submit" class="btn btn-primary">Update</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	// Sidebar toggle (as before)
	document.getElementById('sidebarToggle').addEventListener('click', function () {
		document.querySelector('.sidebar').classList.toggle('active');
		document.querySelector('.main-content').classList.toggle('active');
	});

</script>


</body>
</html>