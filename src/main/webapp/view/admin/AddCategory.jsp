<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="Header.jsp"></jsp:include>
<style type="text/css">
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
			<div class="container d-flex flex-column justify-content-center"
				style="height: 90vh">
				<div class="row justify-content-center">
					<div class="col-md-6">
						<div class="card shadow">
							<div class="card-header bg-primary text-white">
								<h4 class="card-title mb-0">Add New Category</h4>
							</div>
							<div class="card-body">
								<form action="/EcommerceWebsite/Admin/AddCategory" method="POST" enctype="multipart/form-data">
									<!-- <div class="mb-3">
										<label for="categoryId" class="form-label">Category ID</label>
										<input type="text" class="form-control" id="categoryId"
											name="categoryId" required>
									</div> -->
									<div class="mb-3">
										<label for="categoryName" class="form-label">Category
											Name</label> <input type="text" class="form-control"
											id="categoryName" name="categoryName" required>
									</div>
									<div class="mb-3">
                    				<label class="form-label">Category Image</label>
                    				<input type="file" class="form-control" name="categoryImage" accept="image/*" required>
                				</div>
									<div class="d-grid gap-2">
										<button type="submit" class="btn btn-primary">Submit</button>
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
	<strong>Success!</strong> Category was added.
</div>
<% } else if (res == 0) { %>
<div class="alert alert-danger alert-dismissible position-fixed top-0 end-0 m-3"
     style="width: 400px; z-index: 9999;">
	<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	<strong>Failed!</strong> Category not added.
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