package com.ecommerce.controller.home;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ecommerce.dao.CustomerDAO;
import com.ecommerce.model.Customers;


/**
 * Servlet implementation class OTPVerifyServlet
 */
@WebServlet("/OTPVerifyServlet")
public class OTPVerifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OTPVerifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String user_otp = request.getParameter("user_otp");
	HttpSession session = request.getSession(false);
	String actual_otp = (String) session.getAttribute("otp");
	
	if(user_otp.equals(actual_otp))
	{
		Customers customer = (Customers) session.getAttribute("customer_data");

	    // Save to DB via CustomerDAO
	    CustomerDAO dao = new CustomerDAO();
	    int n = dao.addCustomer(customer);

	    // Redirect with result
	    response.sendRedirect("/EcommerceWebsite/view/home/CustomerLogin.jsp?res=" + n);
	}
	else
		response.sendRedirect("/EcommerceWebsite/view/home/OTPVerify.jsp?n=5");
		
	}

}
