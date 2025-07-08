package com.ecommerce.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.ecommerce.dao.CustomerDAO;
import com.ecommerce.dbutil.GlobalVariables;
import com.ecommerce.model.Customers;

/**
 * Servlet implementation class UpdateProfilePic
 */
@WebServlet("/UpdateProfilePic")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
maxFileSize = 1024 * 1024 * 10, // 10 MB
maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UpdateProfilePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfilePic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int customerId = Integer.parseInt(request.getParameter("customerId"));

		// image upload
		/* Receive file uploaded to the Servlet from the HTML5 form */
		Part filePart = request.getPart("profilePic");

		// Generate a unique file name or use the original file name
		String fileName = java.util.UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();
//		String uploadPath = "D:\\uploads\\";
		String uploadPath = GlobalVariables.uploadPath;

		filePart.write(uploadPath + fileName);

		// update picname in db
		CustomerDAO dao = new CustomerDAO();
		dao.updateCustomerPicByCustomerId(customerId, fileName);
		
		Customers customer = dao.getCustomersByCustomerId(customerId);
		HttpSession session = request.getSession();
		session.setAttribute("customer", customer);
		response.sendRedirect("/EcommerceWebsite/view/customer/MyProfile.jsp?res=4");
	}

}
