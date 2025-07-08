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

import com.ecommerce.dao.EmployeeDAO;
import com.ecommerce.dbutil.GlobalVariables;
import com.ecommerce.model.Employees;

/**
 * Servlet implementation class AddEmployee
 */
@WebServlet("/Admin/AddEmployee")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
maxFileSize = 1024 * 1024 * 10, // 10 MB
maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String gender = request.getParameter("gender");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String designation = request.getParameter("designation");
		int salary = Integer.parseInt(request.getParameter("salary"));
		String password = request.getParameter("password");

		// image upload
		/* Receive file uploaded to the Servlet from the HTML5 form */
		Part filePart = request.getPart("employeePic");

		// Generate a unique file name or use the original file name
		String fileName = java.util.UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();

//		String uploadPath = "D:\\uploads\\";
		String uploadPath = GlobalVariables.uploadPath;

	    filePart.write(uploadPath + fileName);

		Employees employees = new Employees();
		employees.setFirstName(firstName);
		employees.setLastName(lastName);
		employees.setGender(gender);
		employees.setMobile(mobile);
		employees.setEmail(email);
		employees.setDesignation(designation);
		employees.setSalary(salary);
		employees.setPassword(password);
		employees.setEmployeePic(fileName);

		EmployeeDAO dao = new EmployeeDAO();
		int n = dao.addEmployee(employees);

		response.sendRedirect("/EcommerceWebsite/view/admin/AddEmployee.jsp?res=" + n);
	}

}
