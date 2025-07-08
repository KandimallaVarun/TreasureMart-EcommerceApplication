package com.ecommerce.controller.employee;

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
import com.ecommerce.dao.EmployeeDAO;
import com.ecommerce.dbutil.GlobalVariables;
import com.ecommerce.model.Employees;

/**
 * Servlet implementation class UpdateEmployeePicture
 */
@WebServlet("/UpdateEmployeePicture")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
maxFileSize = 1024 * 1024 * 10, // 10 MB
maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UpdateEmployeePicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployeePicture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int employeeId = Integer.parseInt(request.getParameter("employeeId"));

		// image upload
		/* Receive file uploaded to the Servlet from the HTML5 form */
		Part filePart = request.getPart("employeePic");

		// Generate a unique file name or use the original file name
		String fileName = java.util.UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();
//		String uploadPath = "D:\\uploads\\";
		String uploadPath = GlobalVariables.uploadPath;

		filePart.write(uploadPath + fileName);

		// update picname in db
		EmployeeDAO dao = new EmployeeDAO();
		dao.updateEmployeePicByEmployeeId(employeeId, fileName);
		
		Employees employee = dao.getEmployeeByEmployeeId(employeeId);
		HttpSession session = request.getSession();
		session.setAttribute("employee", employee);
		response.sendRedirect("/EcommerceWebsite/view/employee/MyProfile.jsp?res=4");
	}

}
