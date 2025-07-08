<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="../admin/Header.jsp"></jsp:include>
  <style>
body {
    background-color: #f0f4f8; /* very soft light grey-blue */
}
.login-container {
    margin-top: 90px;
}
.login-card {
    border: none;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
}
.login-card:hover {
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
}
.login-header {
    background-color: #1abc9c; /* teal */
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
    border: 1px solid #ced4da;
}
.form-control:focus {
    box-shadow: 0 0 0 0.25rem rgba(26, 188, 156, 0.25);
    border-color: #1abc9c;
}
.btn-login {
    background-color: #36cd9b; /* coral orange */
    border: none;
    border-radius: 8px;
    padding: 12px;
    font-weight: 600;
    letter-spacing: 0.5px;
    color: white;
}
.btn-login:hover {
    background-color: #059767; /* darker coral */
    color: white;
}
.forgot-link {
    color: #1abc9c;
    transition: all 0.3s ease;
}
.forgot-link:hover {
    color: #16a085;
    text-decoration: underline;
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
                        <form action="/EcommerceWebsite/EmployeeLoginValidate" method="POST">
                            <div class="mb-4">
                                <label for="emailId" class="form-label">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" class="form-control" id="email" name="email" required placeholder="example@domain.com">
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
                        <!-- <div class="text-center mt-4">
                            <p class="mb-0">Don't have an account? <a href="#" class="forgot-link" data-bs-toggle="modal" data-bs-target="#employeeRegisterModal">Sign up</a></p>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
