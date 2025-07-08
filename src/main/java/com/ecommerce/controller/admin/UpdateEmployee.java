package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;

import com.ecommerce.dao.EmployeeDAO;
import com.ecommerce.model.Employees;

/**
 * Servlet implementation class UpdateEmployee
 */
@WebServlet("/Admin/UpdateEmployee")
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployee() {
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

		int employeeId = Integer.parseInt(request.getParameter("employeeId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String gender = request.getParameter("gender");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String designation = request.getParameter("designation");
		int salary = Integer.parseInt(request.getParameter("salary"));
		String password = request.getParameter("password");

		Employees employees = new Employees();
		employees.setEmployeeId(employeeId);
		employees.setFirstName(firstName);
		employees.setLastName(lastName);
		employees.setGender(gender);
		employees.setMobile(mobile);
		employees.setEmail(email);
		employees.setDesignation(designation);
		employees.setSalary(salary);
		employees.setPassword(password);

		EmployeeDAO dao = new EmployeeDAO();
		boolean flag = dao.updateEmployeeByEmployeeId(employeeId, employees);

		if(flag == true) {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewEmployees.jsp?res=3");
		}else {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewEmployees.jsp?res=2");
		}
	}

}
