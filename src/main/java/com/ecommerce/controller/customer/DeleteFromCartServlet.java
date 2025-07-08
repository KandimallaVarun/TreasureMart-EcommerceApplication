package com.ecommerce.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.dao.ProductDAO;

/**
 * Servlet implementation class DeleteFromCartServlet
 */
@WebServlet("/DeleteFromCartServlet")
public class DeleteFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFromCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cartId = Integer.parseInt(request.getParameter("cartId"));

		CartDAO dao = new CartDAO();
		boolean flag = dao.deleteCartItemByCartId(cartId);
		if (flag == true) {
			response.sendRedirect("/EcommerceWebsite/view/customer/ViewCart.jsp?res=1");
		} else {
			response.sendRedirect("/EcommerceWebsite/view/customer/ViewCart.jsp?res=0");
		}
	}

}
