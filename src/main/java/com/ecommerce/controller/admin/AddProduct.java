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

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.dbutil.GlobalVariables;
import com.ecommerce.model.Products;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/Admin/AddProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
maxFileSize = 1024 * 1024 * 10, // 10 MB
maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProduct() {
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
		String productName = request.getParameter("productName");
		String description = request.getParameter("description");
		int discount = Integer.parseInt(request.getParameter("discount"));
		int cost = Integer.parseInt(request.getParameter("cost"));
		// image upload
		/* Receive file uploaded to the Servlet from the HTML5 form */
		Part filePart1 = request.getPart("productImage1");
		Part filePart2 = request.getPart("productImage2");
		Part filePart3 = request.getPart("productImage3");

		// Generate a unique file name or use the original file name
		String fileName1 = java.util.UUID.randomUUID().toString() + "_" + filePart1.getSubmittedFileName();
		String fileName2 = java.util.UUID.randomUUID().toString() + "_" + filePart2.getSubmittedFileName();
		String fileName3 = java.util.UUID.randomUUID().toString() + "_" + filePart3.getSubmittedFileName();

//		String uploadPath = "D:\\uploads\\";
		String uploadPath = GlobalVariables.uploadPath;

	    filePart1.write(uploadPath + fileName1);
	    filePart2.write(uploadPath + fileName2);
	    filePart3.write(uploadPath + fileName3);
//		for (Part part : request.getParts()) {
//			part.write("D:\\uploads\\" + fileName1);
//		}
//		for (Part part : request.getParts()) {
//			part.write("D:\\uploads\\" + fileName2);
//		}
//		for (Part part : request.getParts()) {
//			part.write("D:\\uploads\\" + fileName3);
//		}

		Products products = new Products();
		products.setCategoryName(categoryName);
		products.setProductName(productName);
		products.setDescription(description);
		products.setDiscount(discount);
		products.setCost(cost);
		products.setProductImage1(fileName1);
		products.setProductImage2(fileName2);
		products.setProductImage3(fileName3);

		ProductDAO dao = new ProductDAO();
		int n = dao.addProduct(products);

		response.sendRedirect("/EcommerceWebsite/view/admin/AddProduct.jsp?res=" + n);
	}

}
