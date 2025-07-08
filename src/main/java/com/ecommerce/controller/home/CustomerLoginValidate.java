package com.ecommerce.controller.home;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ecommerce.dao.AdminDAO;
import com.ecommerce.dao.CustomerDAO;
import com.ecommerce.model.Admin;
import com.ecommerce.model.Customers;

/**
 * Servlet implementation class CustomerLoginValidate
 */
@WebServlet("/CustomerLoginValidate")
public class CustomerLoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLoginValidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		String encryptedPassword = PasswordEncoderDecoder.encoder(password);
		System.out.println(emailId+" "+password+" "+encryptedPassword);
		
		Customers customer = new Customers();
		customer.setEmailId(emailId);
		customer.setPassword(encryptedPassword);
		
		CustomerDAO dao = new CustomerDAO();
		Customers customer_new = dao.loginValidate(customer);
		
//		if(customer_new == null) {  //user not found
//			response.sendRedirect("/EcommerceWebsite/view/home/AdminLogin.jsp?res=0");
//		}else { //found 
//			HttpSession session = request.getSession();
//			session.setAttribute("customer", customer_new);
//			response.sendRedirect("/EcommerceWebsite/view/customer/Dashboard.jsp");
//		}
		

		if(customer_new != null){
			HttpSession session = request.getSession();
			session.setAttribute("customer", customer_new);

		    // Check if redirectAfterLogin was set
		    String redirectURL = (String) session.getAttribute("redirectAfterLogin");
		    if(redirectURL != null){
		        session.removeAttribute("redirectAfterLogin");
		        response.sendRedirect(redirectURL);
		    } else {
		    	response.sendRedirect("/EcommerceWebsite/view/customer/Dashboard.jsp");
		    }
		} else {
			response.sendRedirect("/EcommerceWebsite/view/home/CustomerLogin.jsp?res=0");
		}

	}

}
