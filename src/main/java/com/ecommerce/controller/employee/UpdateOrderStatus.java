package com.ecommerce.controller.employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ecommerce.dao.CustomerOrdersDAO;

/**
 * Servlet implementation class UpdateOrderStatus
 */
@WebServlet("/UpdateOrderStatus")
public class UpdateOrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderStatus() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		long invoiceNumber = Long.parseLong(request.getParameter("invoiceNumber"));
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		String orderStatus = request.getParameter("orderStatus");
		
		CustomerOrdersDAO dao = new CustomerOrdersDAO();
		boolean flag = dao.updateOrderStatus(invoiceNumber, productCode, orderStatus);
		
		if(flag == true) {
			response.sendRedirect("/EcommerceWebsite/view/employee/ViewOrders.jsp?res=3");
		}else {
			response.sendRedirect("/EcommerceWebsite/view/employee/ViewOrders.jsp?res=2");
		}
	}

}
