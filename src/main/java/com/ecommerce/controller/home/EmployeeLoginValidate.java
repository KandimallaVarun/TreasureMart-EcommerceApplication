package com.ecommerce.controller.home;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ecommerce.dao.CustomerDAO;
import com.ecommerce.dao.EmployeeDAO;
import com.ecommerce.model.Customers;
import com.ecommerce.model.Employees;

/**
 * Servlet implementation class EmployeeLoginValidate
 */
@WebServlet("/EmployeeLoginValidate")
public class EmployeeLoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeLoginValidate() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Employees employee = new Employees();
		employee.setEmail(email);
		employee.setPassword(password);

		EmployeeDAO dao = new EmployeeDAO();
		Employees employee_new = dao.loginValidate(employee);

		if(employee_new == null) {  //employee not found
			response.sendRedirect("/EcommerceWebsite/view/home/EmployeeLogin.jsp?res=0");
		}else { //found 
			HttpSession session = request.getSession();
			session.setAttribute("employee", employee_new);
			response.sendRedirect("/EcommerceWebsite/view/employee/Dashboard.jsp");
		}

	}

}
