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

import com.ecommerce.dbutil.GlobalVariables;
import com.ecommerce.model.Customers;

/**
 * Servlet implementation class SendOTPServlet
 */
@WebServlet("/SendOTPServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
maxFileSize = 1024 * 1024 * 10, // 10 MB
maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class SendOTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendOTPServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstName = request.getParameter("firstName");
	    String lastName = request.getParameter("lastName");
	    String mobileNumber = request.getParameter("mobileNumber");
	    String emailId = request.getParameter("emailId");
	    String password = request.getParameter("password");

	    Part filePart = request.getPart("profilePic");
	    String fileName = java.util.UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();
//	    String uploadPath = "D:\\uploads\\";
	    String uploadPath = GlobalVariables.uploadPath;
	    filePart.write(uploadPath + fileName);
//	    System.currentTimeMillis()
	    Timestamp registerDate = new Timestamp(System.currentTimeMillis());
	    String registerDateStr = registerDate.toString();

	    // Create Customer object (assuming you have a Customer model class)
	    Customers customer = new Customers();
	    customer.setFirstName(firstName);
	    customer.setLastName(lastName);
	    customer.setMobileNumber(mobileNumber);
	    customer.setEmailId(emailId);
	    customer.setPassword(password);
	    customer.setProfilePic(fileName);
	    customer.setRegisterDate(registerDateStr);
	    
		HttpSession session = request.getSession();
		session.setAttribute("customer_data", customer);
		
		Random rd = new Random();
		String otp = ""+rd.nextInt(100000,999999);
		session.setAttribute("otp", otp);
		String toMailId = emailId;
		String subject = "Ecommerce Registration - OTP";
		String content = "Hi! Customer,\n"
				+ "Thanks for Registration in oue site \n"
				+ "Your OTP : "+otp+" \n"
						+ "to complete registration"
						+ "Thank You";
		
		boolean status = SendMail.sendMail(toMailId, subject, content);
		if(status)
				response.sendRedirect("/EcommerceWebsite/view/home/OTPVerify.jsp");
		else
			response.sendRedirect("/EcommerceWebsite/view/home/CustomerLogin.jsp?n=9");
	}

}
