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
			<div class="container mt-5 w-75">
    <div class="card shadow">
        <div class="card-header bg-success text-white">
            <h4 class="mb-0">Add New Employee</h4>
        </div>
        <div class="card-body">
            <form action="/EcommerceWebsite/Admin/AddEmployee" method="post" enctype="multipart/form-data">

                <!-- <div class="mb-3">
                    <label class="form-label">Employee ID</label>
                    <input type="number" class="form-control" name="employeeId" required>
                </div> -->

                <div class="row mb-3">
                    <div class="col">
                        <label class="form-label">First Name</label>
                        <input type="text" class="form-control" name="firstName" required>
                    </div>
                    <div class="col">
                        <label class="form-label">Last Name</label>
                        <input type="text" class="form-control" name="lastName" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Gender</label>
                    <select class="form-select" name="gender" required>
                        <option value="" disabled selected>Select Gender</option>
                        <option>Male</option>
                        <option>Female</option>
                        <option>Other</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Mobile</label>
                    <input type="tel" class="form-control" name="mobile" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Designation</label>
                    <input type="text" class="form-control" name="designation" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Salary</label>
                    <input type="number" class="form-control" name="salary" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Employee Picture</label>
                    <input type="file" class="form-control" name="employeePic" accept="image/*" required>
                </div>

                <div class="d-flex">
                    <button type="submit" class="btn btn-success mx-auto w-25">Add Employee</button>
                </div>

            </form>
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
	<strong>Success!</strong> Employee was added.
</div>
<% } else if (res == 0) { %>
<div class="alert alert-danger alert-dismissible position-fixed top-0 end-0 m-3"
     style="width: 400px; z-index: 9999;">
	<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	<strong>Failed!</strong> Employee not added.
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