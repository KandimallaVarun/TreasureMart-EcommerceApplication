package com.ecommerce.controller.home;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Random;

import com.ecommerce.dao.CustomerDAO;
import com.ecommerce.dbutil.GlobalVariables;
import com.ecommerce.model.Customers;

/**
 * Servlet implementation class CustomerRegistration
 */
@WebServlet("/CustomerRegistration")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
maxFileSize = 1024 * 1024 * 10, // 10 MB
maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class CustomerRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstName = request.getParameter("firstName");
	    String lastName = request.getParameter("lastName");
	    String mobileNumber = request.getParameter("mobileNumber");
	    String emailId = request.getParameter("emailId");
	    String password = request.getParameter("password");
	    String encryptedPassword = PasswordEncoderDecoder.encoder(password);

	    Part filePart = request.getPart("profilePic");
	    String fileName;
	    if(filePart == null || filePart.getSubmittedFileName() == null || filePart.getSubmittedFileName().isEmpty()) {
	    	fileName = "default_customer.png";
	    }
	    else {
	    fileName = java.util.UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();
//	    String uploadPath = "D:\\uploads\\";
	    String uploadPath = GlobalVariables.uploadPath;
	    filePart.write(uploadPath + fileName);
	    }
//	    System.currentTimeMillis()
	    Timestamp registerDate = new Timestamp(System.currentTimeMillis());
	    String registerDateStr = registerDate.toString();

	    // Create Customer object (assuming you have a Customer model class)
	    Customers customer = new Customers();
	    customer.setFirstName(firstName);
	    customer.setLastName(lastName);
	    customer.setMobileNumber(mobileNumber);
	    customer.setEmailId(emailId);
	    customer.setPassword(encryptedPassword);
	    customer.setProfilePic(fileName);
	    customer.setRegisterDate(registerDateStr);
	    
		HttpSession session = request.getSession();
		session.setAttribute("customer_data", customer);
		
		Random rd = new Random();
		String otp = ""+rd.nextInt(100000,999999);
		session.setAttribute("otp", otp);
		String toMailId = emailId;
		String subject = "TreasureMart Registration - OTP";

		String content = "<div style='font-family: Arial, sans-serif; padding: 15px; border: 1px solid #ddd; border-radius: 8px;'>"
		        + "<h2 style='color: #2E86C1;'>Welcome to Ecommerce!</h2>"
		        + "<p>Dear Customer,</p>"
		        + "<p>Thank you for registering on our site. We're glad to have you as part of our community!</p>"
		        + "<p style='font-size: 16px;'>Your One-Time Password (OTP) for completing the registration process is:</p>"
		        + "<h1 style='color: #E74C3C;'>" + otp + "</h1>"
		        + "<p>Please enter this OTP to verify your account and complete the registration process.</p>"
		        + "<br>"
		        + "<p style='color: #555;'>If you didn't initiate this request, please ignore this email.</p>"
		        + "<br>"
		        + "<p style='font-size: 14px; color: #999;'>Regards,<br>TreasureMart Support Team</p>"
		        + "</div>";

		
		boolean status = SendMail.sendMail(toMailId, subject, content);
		if(status)
				response.sendRedirect("/EcommerceWebsite/view/home/OTPVerify.jsp");
		else
			response.sendRedirect("/EcommerceWebsite/view/home/CustomerLogin.jsp?n=9");
		
		
//	    String firstName = request.getParameter("firstName");
//	    String lastName = request.getParameter("lastName");
//	    String mobileNumber = request.getParameter("mobileNumber");
//	    String emailId = request.getParameter("emailId");
//	    String password = request.getParameter("password");
//
//	    Part filePart = request.getPart("profilePic");
//	    String fileName = java.util.UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();
////	    String uploadPath = "D:\\uploads\\";
//	    String uploadPath = GlobalVariables.uploadPath;
//	    filePart.write(uploadPath + fileName);
////	    System.currentTimeMillis()
//	    Timestamp registerDate = new Timestamp(System.currentTimeMillis());
//	    String registerDateStr = registerDate.toString();
//
//	    // Create Customer object (assuming you have a Customer model class)
//	    Customers customer = new Customers();
//	    customer.setFirstName(firstName);
//	    customer.setLastName(lastName);
//	    customer.setMobileNumber(mobileNumber);
//	    customer.setEmailId(emailId);
//	    customer.setPassword(password);
//	    customer.setProfilePic(fileName);
//	    customer.setRegisterDate(registerDateStr);
		
//		HttpSession session = request.getSession(false);
//		Customers customer = (Customers) session.getAttribute("customer_data");
//
//	    // Save to DB via CustomerDAO
//	    CustomerDAO dao = new CustomerDAO();
//	    int n = dao.addCustomer(customer);
//
//	    // Redirect with result
//	    response.sendRedirect("/EcommerceWebsite/view/home/CustomerLogin.jsp?res=" + n);
	}


}
