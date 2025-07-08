package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;

import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.model.Category;

import com.ecommerce.dbutil.GlobalVariables;

/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/Admin/AddCategory")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String categoryName = request.getParameter("categoryName");
		// image upload
		/* Receive file uploaded to the Servlet from the HTML5 form */
		Part filePart = request.getPart("categoryImage");

		// Generate a unique file name or use the original file name
		String fileName = java.util.UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();

//		String uploadPath = "D:\\uploads\\";
		String uploadPath = GlobalVariables.uploadPath;
		filePart.write(uploadPath + fileName);

		Category category = new Category();
		category.setCategoryName(categoryName);
		category.setCategoryImage(fileName);

		CategoryDAO dao = new CategoryDAO();
		int n = dao.addcategory(category);

		response.sendRedirect("/EcommerceWebsite/view/admin/AddCategory.jsp?res=" + n);
	}

}
