<%@page import="com.ecommerce.model.Employees"%>
<%@page import="com.ecommerce.model.Customers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Employees employee = (Employees) session.getAttribute("employee");
if (employee == null) {
    response.sendRedirect("CustomerLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../admin/Header.jsp"></jsp:include>
<title>Employee Dashboard</title>
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>

.profile-card {
    max-width: 700px;
    margin: 40px auto;
    padding: 25px;
    border-radius: 5px;
    box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
    background-color: #fff;
}

.profile-pic {
    width: 130px;
    height: 130px;
    object-fit: cover;
    border-radius: 50%;
    border: 3px solid #ddd;
}

.profile-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.profile-header h4 {
	color: #0d6efd;
	font-weight: 700;
	display: inline-block;
}

.edit-icon {
	font-size: 20px;
	color: #007bff;
	text-decoration: none;
	float:right;
	background-color: white;
}

.edit-icon:hover {
	color: #0056b3;
}

.profile-header h4 i {
	margin-right: 8px;
}

.profile-header h4 i {
    margin-right: 10px;
}

.modal-title i {
    margin-right: 10px;
    color: #0d6efd;
}

.form-label i {
    margin-right: 8px;
    color: #11e6ec;
    font-size: 20px;
}

.profile-details p {
    margin-bottom: 10px;
    font-size: 16px;
}

.profile-details span {
    font-weight: 500;
}

.form-label {
    font-weight: 500;
}

.inputs {
    border: 1px solid #ced4da;
    border-radius: 5px;
    padding: 6px 10px;
    transition: all 0.3s ease;
}

.inputs:read-only:focus {
    border: 1px solid #ced4da;
    box-shadow: none;
    outline: none;
}

.inputs:focus {
    border: 2px solid #0d6efd;
    box-shadow: none;
    outline: none;
}

@media (max-width: 768px) {
    .sidebar {
        position: relative;
        top: auto;
        height: auto;
        width: 100%;
        margin-bottom: 1.5rem;
    }
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	  $(".edit-icon").click(function(){
	    $(".inputs").each(function(){
	      const input = $(this);
	      
	      if(input.is("input")){
	        const isReadonly = input.prop("readonly");
	        input.prop("readonly", !isReadonly);
	        if(isReadonly){
	          input.css("border", "2px solid #0d6efd");
	        } else {
	          input.css("border", "1px solid #ced4da");
	        }
	      }

	      if(input.is("select")){
	        const isDisabled = input.prop("disabled");
	        input.prop("disabled", !isDisabled);
	        if(isDisabled){
	          input.css("border", "2px solid #0d6efd");
	        } else {
	          input.css("border", "1px solid #ced4da");
	        }
	      }

	    });

	    const icon = $(this).find("i");
	    if(icon.hasClass("bi-pencil-square")){
	      icon.removeClass("bi-pencil-square").addClass("bi-lock");
	    } else {
	      icon.removeClass("bi-lock").addClass("bi-pencil-square");
	    }
	  });
	});

</script>
</head>

<body>
<jsp:include page="Sidebar.jsp"></jsp:include>
<div class="main-content">
    <div class="profile-card">
        <div class="text-center mb-5">
            <a href="#" data-bs-toggle="modal" data-bs-target="#profilePicModal">
                <img src="/uploads/<%=employee.getEmployeePic()%>" alt="Profile Picture" class="profile-pic">
            </a>
        </div>

        <div class="profile-header my-3">
            <h4 class="mx-2"><i class="bi bi-person-circle"></i>My Profile</h4>
            <button class="edit-icon" title="Edit Profile" style="border:none;">
                <i class="bi bi-pencil-square"></i>
            </button>
        </div>

        <form action="/EcommerceWebsite/UpdateEmployeeProfile" method="post">
            <input type="hidden" name="employeeId" value="<%=employee.getEmployeeId()%>">

            <div class="mb-2 row p-3">
                <label class="form-label col-md-4"><i class="bi bi-person"></i>First Name</label>
                <input type="text" class="col-md-8 inputs" name="firstName" value="<%=employee.getFirstName()%>" required readonly>
            </div>

            <div class="mb-2 row p-3">
                <label class="form-label col-md-4"><i class="bi bi-person"></i>Last Name</label>
                <input type="text" class="col-md-8 inputs" name="lastName" value="<%=employee.getLastName()%>" required readonly>
            </div>
            
            <div class="mb-2 row p-3">
                    <label class="form-label">Gender</label>
                    <select class="form-select inputs" name="gender" required disabled>
                        <option value="<%=employee.getGender() %>" disabled selected><%=employee.getGender() %></option>
                        <option>Male</option>
                        <option>Female</option>
                        <option>Other</option>
                    </select>
                </div>

            <div class="mb-2 row p-3">
                <label class="form-label col-md-4"><i class="bi bi-telephone"></i>Mobile Number</label>
                <input type="text" class="col-md-8 inputs" name="mobile" value="<%=employee.getMobile()%>" required readonly>
            </div>

            <div class="mb-2 row p-3">
                <label class="form-label col-md-4"><i class="bi bi-envelope"></i>Email ID</label>
                <input type="email" class="col-md-8 inputs" name="email" value="<%=employee.getEmail()%>" required readonly>
            </div>

            <div class="mb-3 row p-3">
                <label class="form-label col-md-4"><i class="bi bi-lock"></i>Password</label>
                <input type="password" class="col-md-8 inputs" name="password" value="<%=employee.getPassword()%>" required readonly>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    </div>
</div>

<!-- Profile Picture Modal -->
<div class="modal fade" id="profilePicModal" tabindex="-1" aria-labelledby="profilePicModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form action="/EcommerceWebsite/UpdateEmployeePicture" method="post" enctype="multipart/form-data">
        <div class="modal-header">
          <h5 class="modal-title" id="profilePicModalLabel">
            <i class="bi bi-image"></i>Update Profile Picture
          </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>

        <div class="modal-body text-center">
          <img src="/uploads/<%=employee.getEmployeePic()%>" alt="Current Profile Picture" class="img-fluid rounded-circle mb-3" style="width: 150px; height: 150px; object-fit: cover; border: 3px solid #ddd;">
          <div class="mb-3">
            <label for="profilePicInput" class="form-label">Choose New Profile Picture</label>
            <input type="file" class="form-control" id="employeePic" name="employeePic" accept="image/*" required>
          </div>
          <input type="hidden" name="employeeId" value="<%=employee.getEmployeeId()%>">
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-primary">Upload</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
