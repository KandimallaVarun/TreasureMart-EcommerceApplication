<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../admin/Header.jsp"></jsp:include>
</head>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>
	<div class="container">
    <div class="row justify-content-center align-items-center min-vh-100">
      <div class="col-md-6">
        <div class="card shadow-lg border-0 rounded-4 d-flex flex-row align-items-center row">
        <div class="card-body col-5">
			        <img src="../../images/admin.svg" class="img-fluid rounded-start">
        </div>
          <div class="card-body col-7">
            <h3 class="card-title text-center mb-4">Admin Login</h3>
            <form action="/EcommerceWebsite/AdminLoginValidate" method="post">
              <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input 
                  type="text" 
                  class="form-control" 
                  id="username" 
                  name="username" 
                  placeholder="Enter username" 
                  required>
              </div>
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input 
                  type="password" 
                  class="form-control" 
                  id="password" 
                  name="password" 
                  placeholder="Enter password" 
                  required>
              </div>
              <div class="d-grid">
                <button type="submit" class="btn btn-primary">Login</button>
              </div>
            </form>
            <%
            	if(request.getParameter("res")!=null){
            		int res = Integer.parseInt(request.getParameter("res"));
            		if(res==0){
            			%>
            			<h3 class="text-danger">Invalid username/password</h3>
            		<%	
            		}
            	}
            %>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>