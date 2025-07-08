package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.model.Category;

/**
 * Servlet implementation class UpdateCategory
 */
@WebServlet("/Admin/UpdateCategory")
public class UpdateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("categoryName");
		
		Category  category = new Category();
		category.setCategoryId(categoryId);
		category.setCategoryName(categoryName);
		
		CategoryDAO dao = new CategoryDAO();
		boolean flag = dao.updatecategoryByCategoryId(categoryId, category);
		
		if(flag == true) {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewCategories.jsp?res=3");
		}else {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewCategories.jsp?res=2");
		}
	}

}
