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
.outer{
	height: 50vh;
	display: flex;
	justify-content: center;
	align-items: center;
}
.inner{
	border-radius: 10px;
	font-weight: 600;
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
				<label class="form-label text-dark">Verify OTP <small>( Sent to you mail )</small></label> <input type="text"
					name="user_otp" class="form-control"> <input type="submit"
					value="Submit" class="btn btn-success mt-2">
			</form>
		</div>
	</div>

	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>