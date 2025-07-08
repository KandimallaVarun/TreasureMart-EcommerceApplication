package com.ecommerce.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Timestamp;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.dao.EmployeeDAO;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Cart;
import com.ecommerce.model.Category;
import com.ecommerce.model.Customers;
import com.ecommerce.model.Products;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
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
		String referer = request.getHeader("referer");  // This gets the exact page you came from
		int index = referer.indexOf("&added");
		if(index != -1) {
			referer = referer.substring(0,index);
		}
		if(customer == null) {
			session.setAttribute("redirectAfterLogin", referer);
			response.sendRedirect("/EcommerceWebsite/view/home/CustomerLogin.jsp");
			return;
		}
		
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		
		Timestamp addToCartDate = new Timestamp(System.currentTimeMillis());
	    String addToCartDateStr = addToCartDate.toString();
	    
	    Cart cart = new Cart();
		cart.setProductCode(productCode);
		cart.setCustomerId(customer.getCustomerId());
		cart.setSelectedDate(addToCartDateStr);

		CartDAO dao = new CartDAO();
		int n = dao.addCartItem(cart);
		
		response.sendRedirect(referer+"&added="+n);
		
	}


}
