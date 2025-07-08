package com.ecommerce.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.SendResult;

import java.io.IOException;

import com.ecommerce.model.Customers;

/**
 * Servlet implementation class ViewCartLoginServlet
 */
@WebServlet("/ViewCartLoginServlet")
public class ViewCartLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCartLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Customers customer = (Customers)session.getAttribute("customer");
		
		if(customer == null) {
			response.sendRedirect("/EcommerceWebsite/view/home/CustomerLogin.jsp");
		}
		else {
			response.sendRedirect("/EcommerceWebsite/view/customer/ViewCart.jsp");
		}
	}

}
