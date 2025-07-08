package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ecommerce.dao.EmployeeDAO;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Employees;
import com.ecommerce.model.Products;

/**
 * Servlet implementation class EditEmployee
 */
@WebServlet("/Admin/EditEmployee")
public class EditEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int employeeId = Integer.parseInt(request.getParameter("employeeId"));
		EmployeeDAO dao = new EmployeeDAO();
		
		Employees employees = dao.getEmployeeByEmployeeId(employeeId);
		if(employees == null) {  // not found
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewEmployees.jsp?res=2");
		}else {
			//found
			HttpSession session = request.getSession();
			session.setAttribute("employees", employees);
			
			response.sendRedirect("/EcommerceWebsite/view/admin/EditEmployee.jsp");
		}
	}

}
