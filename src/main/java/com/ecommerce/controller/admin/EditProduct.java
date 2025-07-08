package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Products;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/Admin/EditProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		ProductDAO dao = new ProductDAO();
		
		Products products = dao.getProductByProductCode(productCode);
		if(products == null) {  // not found
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewProducts.jsp?res=2");
		}else {
			//found
			HttpSession session = request.getSession();
			session.setAttribute("products", products);
			
			response.sendRedirect("/EcommerceWebsite/view/admin/EditProduct.jsp");
		}
	}


}
