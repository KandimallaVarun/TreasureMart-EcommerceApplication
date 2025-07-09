<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="../admin/Header.jsp"></jsp:include>
  <style>
body {
            background-color: #f8f9fa;
        }
        .login-container{
        	margin-top: 90px;
        }
        .login-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .login-card:hover {
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }
        .login-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1rem;
            text-align: center;
        }
        .login-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: white;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
        }
        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(102, 126, 234, 0.25);
            border-color: #667eea;
        }
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        .btn-login:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            color:white;
        }
        .forgot-link {
            color: #667eea;
            transition: all 0.3s ease;
        }
        .forgot-link:hover {
            color: #764ba2;
            text-decoration: underline;
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

 <div class="container login-container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card login-card">
                    <div class="login-header">
                        <div class="login-icon">
                            <i class="fas fa-user-circle"></i>
                        </div>
                        <h2>Welcome Back</h2>
                        <p class="mb-0">Please login to your account</p>
                    </div>
                    <div class="card-body p-4">
                        <form action="/EcommerceWebsite/CustomerLoginValidate" method="POST">
                            <div class="mb-4">
                                <label for="emailId" class="form-label">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" class="form-control" id="emailId" name="emailId" required placeholder="example@domain.com">
                                </div>
                            </div>
                            <div class="mb-4">
                                <label for="password" class="form-label">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <input type="password" class="form-control" id="password" name="password" required placeholder="••••••••">
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                                    <label class="form-check-label" for="rememberMe">Remember me</label>
                                </div>
                                <a href="#" class="forgot-link">Forgot password?</a>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-login btn-block">Login</button>
                            </div>
                        </form>
                        <div class="text-center mt-4">
                            <p class="mb-0">Don't have an account? <a href="#" class="forgot-link" data-bs-toggle="modal" data-bs-target="#customerRegisterModal">Sign up</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- Customer Registration Modal -->
<div class="modal fade" id="customerRegisterModal" tabindex="-1" aria-labelledby="customerRegisterModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg"> <!-- Large and centered -->
    <div class="modal-content rounded-4 shadow-lg">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="customerRegisterModalLabel">Customer Registration</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <form action="/EcommerceWebsite/CustomerRegistration" method="post" enctype="multipart/form-data">
        <div class="modal-body p-4">
          <div class="row g-3">
          <!-- <div class="col-md-12">
  <label for="customerId" class="form-label">Customer ID</label>
  <input type="number" class="form-control" id="customerId" name="customerId" placeholder="Enter Customer Id" required>
</div> -->
          
            <div class="col-md-6">
              <label for="firstName" class="form-label">First Name</label>
              <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter First Name" required>
            </div>
            <div class="col-md-6">
              <label for="lastName" class="form-label">Last Name</label>
              <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter Last Name" required>
            </div>
            <div class="col-md-6">
              <label for="mobileNumber" class="form-label">Mobile Number</label>
              <input type="tel" class="form-control" id="mobileNumber" name="mobileNumber" placeholder="Enter Mobile Number" pattern="[6-9]{1}[0-9]{9}" required>
            </div>
            <div class="col-md-6">
              <label for="emailId" class="form-label">Email Address</label>
              <input type="email" class="form-control" id="emailId" name="emailId" placeholder="Enter Email" required>
            </div>
            <div class="col-md-6">
              <label for="password" class="form-label">Password</label>
              <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
            </div>
            <div class="col-md-6">
              <label for="profilePic" class="form-label">Profile Picture</label>
              <input type="file" class="form-control" id="profilePic" name="profilePic" accept="image/*" >
            </div>
          </div>
        </div>

        <div class="modal-footer p-3">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-success">Register</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%
	if (request.getParameter("res") != null) {
		int res = Integer.parseInt(request.getParameter("res"));
		if (res == 5) {
	%>
	<div
		class="alert alert-danger alert-dismissible position-fixed top-0 end-0 m-3"
		style="width: 400px; z-index: 9999;">
		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		<strong>Failed!</strong> Invalid Login details.
	</div>

	<%
	}
	}
	%>
	
	<%
	if (request.getParameter("n") != null) {
		int n = Integer.parseInt(request.getParameter("n"));
		if (n == 9) {
	%>
	<div
		class="alert alert-danger alert-dismissible position-fixed top-0 end-0 m-3"
		style="width: 400px; z-index: 9999;">
		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		<strong>Failed!</strong> Enter correct details for Registration.
	</div>

	<%
	}
	}
	%>
</body>
</html>
