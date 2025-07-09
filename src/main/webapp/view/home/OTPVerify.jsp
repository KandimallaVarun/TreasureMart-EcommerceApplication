<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../admin/Header.jsp"></jsp:include>
<title>OTP Verification</title>

<style>
body {
	padding-top: 60px;
	background-color: #f8f9fa;
}

.outer {
	height: 50vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.inner {
	border-radius: 10px;
	font-weight: 600;
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
	<!-- Navigation Bar (You can include your header here) -->
	<jsp:include page="Navbar.jsp"></jsp:include>

	<!-- Contact Page Content -->
	<div class="container my-5 outer">
		<div class="container inner w-25 bg-light p-3">
			<form action="/EcommerceWebsite/OTPVerifyServlet" method="post">
				<label class="form-label text-dark">Verify OTP <small>( Sent to you mail )</small></label>
					<input type="text" name="user_otp"
					class="form-control"> <input type="submit" value="Submit"
					class="btn btn-success mt-2">
			</form>
		</div>
	</div>

	<jsp:include page="Footer.jsp"></jsp:include>

	<%
	if (request.getParameter("n") != null) {
		int n = Integer.parseInt(request.getParameter("n"));
		if (n == 5) {
	%>
	<div
		class="alert alert-danger alert-dismissible position-fixed top-0 end-0 m-3"
		style="width: 400px; z-index: 9999;">
		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		<strong>Failed!</strong> Invalid OTP.
	</div>

	<%
	}
	}
	%>

</body>
</html>