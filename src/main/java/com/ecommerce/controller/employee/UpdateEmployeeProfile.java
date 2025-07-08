package com.ecommerce.controller.employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.ecommerce.dao.EmployeeDAO;
import com.ecommerce.model.Employees;

/**
 * Servlet implementation class UpdateEmployeeProfile
 */
@WebServlet("/UpdateEmployeeProfile")
public class UpdateEmployeeProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployeeProfile() {
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
        String password = request.getParameter("password");

        // Set data to Customers object
        Employees employee = new Employees();
        employee.setEmployeeId(employeeId);
        employee.setFirstName(firstName);
        employee.setLastName(lastName);
        employee.setGender(gender);
        employee.setMobile(mobile);
        employee.setEmail(email);
        employee.setPassword(password);

        // Update via DAO
        EmployeeDAO dao = new EmployeeDAO();
        boolean flag = dao.updateEmployeeByEmployeeId(employeeId, employee);

        if (flag) {
            // Update session attribute too if needed
        	EmployeeDAO dao1 = new EmployeeDAO();
        	Employees updated_employee = dao1.getEmployeeByEmployeeId(employeeId);
            request.getSession().setAttribute("employee", updated_employee);

            response.sendRedirect("/EcommerceWebsite/view/employee/MyProfile.jsp?res=3");
        } else {
            response.sendRedirect("/EcommerceWebsite/view/employee/MyProfile.jsp?res=2");
        }
        
        pw.close();
	}

}
