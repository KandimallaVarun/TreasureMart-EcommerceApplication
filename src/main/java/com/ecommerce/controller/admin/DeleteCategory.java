package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ecommerce.dao.CategoryDAO;

/**
 * Servlet implementation class DeleteCategory
 */
@WebServlet("/Admin/DeleteCategory")
public class DeleteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		CategoryDAO dao = new CategoryDAO();
		boolean flag = dao.deleteCategoryByCategoryId(categoryId);
		if(flag == true) {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewCategories.jsp?res=1");
		}else {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewCategories.jsp?res=0");
		}
	}



}
