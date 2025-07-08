package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.model.Category;

/**
 * Servlet implementation class EditCategory
 */
@WebServlet("/Admin/EditCategory")
public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCategory() {
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

		Category category = dao.getCategoryBycategoryId(categoryId);
		if (category == null) { // not found
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewCalegories.jsp?res=2");
		} else {
			// found
			HttpSession session = request.getSession();
			session.setAttribute("category", category);

			response.sendRedirect("/EcommerceWebsite/view/admin/EditCategory.jsp");
		}
	}
}
