package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ecommerce.dao.EmployeeDAO;
import com.ecommerce.dao.ProductDAO;

/**
 * Servlet implementation class DeleteEmployee
 */
@WebServlet("/Admin/DeleteEmployee")
public class DeleteEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmployee() {
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
		boolean flag = dao.deleteEmployeeByEmployeeId(employeeId);
		if (flag == true) {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewEmployees.jsp?res=1");
		} else {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewEmployees.jsp?res=0");
		}
	}

}
