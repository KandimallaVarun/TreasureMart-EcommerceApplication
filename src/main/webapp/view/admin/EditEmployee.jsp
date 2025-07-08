<%@page import="com.ecommerce.model.Employees"%>
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

</style>
</head>
<body>
<%Employees employees = (Employees)session.getAttribute("employees"); %>
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
            <h4 class="mb-0">Edit Employee</h4>
        </div>
        <div class="card-body">
            <form action="/EcommerceWebsite/Admin/UpdateEmployee" method="post">

                <div class="mb-3">
                    <label class="form-label">Employee ID</label>
                    <input type="number" class="form-control" name="employeeId" value="<%=employees.getEmployeeId() %>" required readonly>
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <label class="form-label">First Name</label>
                        <input type="text" class="form-control" name="firstName" value="<%=employees.getFirstName() %>" required>
                    </div>
                    <div class="col">
                        <label class="form-label">Last Name</label>
                        <input type="text" class="form-control" name="lastName" value="<%=employees.getLastName() %>" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Gender</label>
                    <select class="form-select" name="gender" required>
                        <option value="<%=employees.getGender() %>" selected><%=employees.getGender() %></option>
                        <option>Male</option>
                        <option>Female</option>
                        <option>Other</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Mobile</label>
                    <input type="tel" class="form-control" name="mobile" value="<%=employees.getMobile()%>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" value="<%=employees.getEmail()%>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Designation</label>
                    <input type="text" class="form-control" name="designation" value="<%=employees.getDesignation()%>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Salary</label>
                    <input type="number" class="form-control" name="salary" value="<%=employees.getSalary()%>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" value="<%=employees.getPassword()%>" required>
                </div>

                <div class="d-flex">
                    <button type="submit" class="btn btn-success mx-auto w-25">Update</button>
                </div>

            </form>
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