package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.dao.ProductDAO;

/**
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/Admin/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int productCode = Integer.parseInt(request.getParameter("productCode"));

		ProductDAO dao = new ProductDAO();
		boolean flag = dao.deleteProductByProductCode(productCode);
		if (flag == true) {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewProducts.jsp?res=1");
		} else {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewProducts.jsp?res=0");
		}
	}

}
