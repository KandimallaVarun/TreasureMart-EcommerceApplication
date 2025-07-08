<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>
	<%
	int employeeId = Integer.parseInt(request.getParameter("employeeId"));
	%>
	<div class="wrapper">
		<jsp:include page="Sidebar.jsp"></jsp:include>
		<div class="main-content">
			<button class="btn btn-primary d-md-none float-end"
				id="sidebarToggle">
				<i class="fas fa-bars"></i>
			</button>
			<div class="container mt-5 card">
				<form action="/EcommerceWebsite/Admin/UpdateEmployeePic" method="POST"
					enctype="multipart/form-data">
					<input type="hidden" name="employeeId" value="<%=employeeId%>">
					<div class="mb-3">
						<label for="emppic" class="form-label">Upload Employee Pic
							to Update</label> <input type="file" class="form-control" id="employeePic"
							name="employeePic" accept="image/*" required>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>

				</form>
			</div>
		</div>
	</div>
</body>
</html>