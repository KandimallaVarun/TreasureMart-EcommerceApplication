<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
request.setAttribute("currentPage", "contact");
%>
<jsp:include page="../admin/Header.jsp"></jsp:include>
<title>Contact Us | Your E-Commerce Store</title>

<style>
body {
	padding-top: 60px;
	background-color: #f8f9fa;
}

.contact-card {
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s;
}

.contact-card:hover {
	transform: translateY(-5px);
}

.contact-icon {
	font-size: 2rem;
	margin-bottom: 1rem;
	color: #0d6efd;
}

.form-control:focus {
	border-color: #0d6efd;
	box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
}

.submit-btn {
	background-color: #0d6efd;
	border: none;
	padding: 10px 20px;
}

.submit-btn:hover {
	background-color: #0b5ed7;
}
</style>
</head>
<body>
	<!-- Navigation Bar (You can include your header here) -->
	<jsp:include page="Navbar.jsp"></jsp:include>

	<!-- Contact Page Content -->
	<div class="container my-5">
		<div class="row">
			<div class="col-lg-6 mb-4">
				<div class="card contact-card h-100 p-4">
					<div class="card-body text-center">
						<i class="fas fa-map-marker-alt contact-icon"></i>
						<h3 class="card-title">Our Location</h3>
						<p class="card-text">
							123 E-Commerce Street<br> Tech City, TC 10001<br>
							India
						</p>
						<div class="mt-4">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d352.65218015591034!2d79.60506281076118!3d17.968509647329274!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a3345e35fa9ddc9%3A0x280f8e715b07331!2sback%20side%2C%20Railway%20station%2C%2016-10-61%2C%20Shiva%20Nagar%2C%20Warangal%2C%20Telangana%20506002!5e0!3m2!1sen!2sin!4v1750004468765!5m2!1sen!2sin"
								width="100%" height="250" style="border: 0;" allowfullscreen=""
								loading="lazy"></iframe>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card contact-card h-100 p-4">
					<div class="card-body">
						<h3 class="card-title text-center mb-4">Get In Touch</h3>
						<form action="ContactServlet" method="POST">
							<div class="mb-3">
								<label for="name" class="form-label">Name</label> <input
									type="text" class="form-control" id="name" name="name" required>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email</label> <input
									type="email" class="form-control" id="email" name="email"
									required>
							</div>
							<div class="mb-3">
								<label for="subject" class="form-label">Subject</label> <input
									type="text" class="form-control" id="subject" name="subject"
									required>
							</div>
							<div class="mb-3">
								<label for="message" class="form-label">Message</label>
								<textarea class="form-control" id="message" name="message"
									rows="4" required></textarea>
							</div>
							<div class="text-center">
								<button type="submit" class="btn submit-btn text-white">
									<i class="fas fa-paper-plane me-2"></i> Send Message
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col-md-4 mb-4">
				<div class="card contact-card h-100 p-4">
					<div class="card-body text-center">
						<i class="fas fa-phone-alt contact-icon"></i>
						<h4>Call Us</h4>
						<p class="mb-0">+91 98765 43210</p>
						<p>Mon-Fri, 9AM-6PM</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-4">
				<div class="card contact-card h-100 p-4">
					<div class="card-body text-center">
						<i class="fas fa-envelope contact-icon"></i>
						<h4>Email Us</h4>
						<p class="mb-0">support@treasuremart.com</p>
						<p>sales@treasuremart.com</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-4">
				<div class="card contact-card h-100 p-4">
					<div class="card-body text-center">
						<i class="fas fa-comments contact-icon"></i>
						<h4>Live Chat</h4>
						<p class="mb-0">Click the chat icon below</p>
						<p>Available 24/7</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>