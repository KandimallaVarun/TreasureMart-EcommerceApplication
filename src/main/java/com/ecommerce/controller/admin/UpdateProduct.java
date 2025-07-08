package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Products;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/Admin/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		String categoryName = request.getParameter("categoryName");
		String productName = request.getParameter("productName");
		String description = request.getParameter("description");
		int discount = Integer.parseInt(request.getParameter("discount"));
		int cost = Integer.parseInt(request.getParameter("cost"));
		
		Products products = new Products();
		products.setProductCode(productCode);
		products.setCategoryName(categoryName);
		products.setProductName(productName);
		products.setDescription(description);
		products.setDiscount(discount);
		products.setCost(cost);
		
		ProductDAO dao = new ProductDAO();
		boolean flag = dao.updateProductByProductCode(productCode, products);
		
		if(flag == true) {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewProducts.jsp?res=3");
		}else {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewProducts.jsp?res=2");
		}
	}

}
