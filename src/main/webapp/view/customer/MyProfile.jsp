<%@page import="com.ecommerce.model.Customers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Customers customer = (Customers) session.getAttribute("customer");
if (customer == null) {
	response.sendRedirect("CustomerLogin.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Customer Dashboard</title>
<jsp:include page="../admin/Header.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>
body {
	padding-top: 60px;
}

.dashboard-content {
	padding: 25px;
}

.dashboard-title {
	font-size: 2.3rem;
	font-weight: 800;
	margin-bottom: 2rem;
	color: #11e6ec;
	border-bottom: 3px solid #e74c3c;
	display: inline-block;
	padding-bottom: 0.5rem;
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


.card {
	border: none;
	border-radius: 20px;
	background: rgba(255, 255, 255, 0.7);
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.07);
	backdrop-filter: blur(10px);
	transition: all 0.3s ease;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 12px 36px rgba(0, 0, 0, 0.12);
}

.card-body {
	text-align: center;
}

.card-body i {
	font-size: 3rem;
	color: #11e6ec;
	margin-bottom: 12px;
}

.card-title {
	font-size: 1.3rem;
	font-weight: 700;
	color: #333;
}

.card-text {
	color: #444;
	font-size: 1rem;
	font-weight: 600;
}

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

.form-label {
	font-weight: 600;
	color: #495057;
	display: flex;
	align-items: center;
}

.form-label i {
	color: #0d6efd;
	margin-right: 8px;
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

.edit-icon {
	font-size: 20px;
	color: #007bff;
	text-decoration: none;
}

.edit-icon:hover {
	color: #0056b3;
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

        @media (max-width: 991.98px) {
    .sidebar {
        display: none;
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

<script type="text/javascript">
$(document).ready(function(){
  $(".edit-icon").click(function(){
    $(".inputs").each(function(){
      const input = $(this);
      const isReadonly = input.prop("readonly");
      input.prop("readonly", !isReadonly);

      if(!isReadonly){
        input.css("border", "1px solid #ced4da");
      } else {
        input.css("border", "2px solid #0d6efd");
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
<jsp:include page="../home/Navbar.jsp"></jsp:include>
                <!-- Mobile toggle button -->
<button class="btn btn-dark mb-3 d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#customerSidebar" aria-controls="customerSidebar">
  <i class="bi bi-list"></i>
</button>
<div class="container">
  <div class="row">
    <jsp:include page="Sidebar.jsp"></jsp:include>

    <div class="col-md-9">
      <div class="profile-card">
        <div class="text-center mb-5">
          <a href="#" data-bs-toggle="modal" data-bs-target="#profilePicModal">
            <img src="/uploads/<%=customer.getProfilePic()%>" alt="Profile Picture" class="profile-pic">
          </a>
        </div>

        <div class="profile-header my-3">
          <h4 class="mx-2"><i class="bi bi-person-circle"></i> My Profile</h4>
          <button class="edit-icon" title="Edit Profile" style="border:none;">
            <i class="bi bi-pencil-square"></i>
          </button>
        </div>

        <form action="/EcommerceWebsite/UpdateCustomerProfile" method="post">
          <input type="hidden" name="customerId" value="<%=customer.getCustomerId()%>">

          <div class="mb-2 row p-3">
            <label class="form-label col-md-4">
              <i class="bi bi-person"></i> First Name
            </label>
            <input type="text" class="col-md-8 inputs" name="firstName" value="<%=customer.getFirstName()%>" required readonly>
          </div>

          <div class="mb-2 row p-3">
            <label class="form-label col-md-4">
              <i class="bi bi-person"></i> Last Name
            </label>
            <input type="text" class="col-md-8 inputs" name="lastName" value="<%=customer.getLastName()%>" required readonly>
          </div>

          <div class="mb-2 row p-3">
            <label class="form-label col-md-4">
              <i class="bi bi-telephone-fill"></i> Mobile Number
            </label>
            <input type="text" class="col-md-8 inputs" name="mobileNumber" value="<%=customer.getMobileNumber()%>" required readonly>
          </div>

          <div class="mb-2 row p-3">
            <label class="form-label col-md-4">
              <i class="bi bi-envelope"></i> Email ID
            </label>
            <input type="email" class="col-md-8 inputs" name="emailId" value="<%=customer.getEmailId()%>" required readonly>
          </div>

          <div class="mb-3 row p-3">
            <label class="form-label col-md-4">
              <i class="bi bi-lock-fill"></i> Password
            </label>
            <input type="password" class="col-md-8 inputs" name="password" value="<%=customer.getPassword()%>" required readonly>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary">Update</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="profilePicModal" tabindex="-1" aria-labelledby="profilePicModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form action="/EcommerceWebsite/UpdateProfilePic" method="post" enctype="multipart/form-data">
        <div class="modal-header">
          <h5 class="modal-title" id="profilePicModalLabel">
            <i class="bi bi-image"></i> Update Profile Picture
          </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>

        <div class="modal-body text-center">
          <img src="/uploads/<%=customer.getProfilePic()%>" alt="Current Profile Picture" class="img-fluid rounded-circle mb-3" style="width: 150px; height: 150px; object-fit: cover; border: 3px solid #ddd;">

          <div class="mb-3">
            <label for="profilePicInput" class="form-label">Choose New Profile Picture</label>
            <input type="file" class="form-control" id="profilePicInput" name="profilePic" accept="image/*" required>
          </div>
          <input type="hidden" name="customerId" value="<%=customer.getCustomerId()%>">
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-primary">Upload</button>
        </div>
      </form>
    </div>
  </div>
</div>

<jsp:include page="../home/Footer.jsp"></jsp:include>


<%
	if (request.getParameter("res") != null) {
		int res = Integer.parseInt(request.getParameter("res"));
		if (res == 3) {
	%>
	<div
		class="alert alert-success alert-dismissible position-fixed top-0 end-0 m-3"
		style="width: 400px; z-index: 9999;">
		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		<strong>Success!</strong> Profile Updated.
	</div>
	<%
	} else if (res == 2) {
	%>
	<div
		class="alert alert-danger alert-dismissible position-fixed top-0 end-0 m-3"
		style="width: 400px; z-index: 9999;">
		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		<strong>Failed!</strong> Profile not updated.
	</div>
	<%
	}
	}
	%>
</body>
</html>
