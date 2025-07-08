package com.ecommerce.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.ecommerce.dao.CustomerDAO;
import com.ecommerce.dao.EmployeeDAO;
import com.ecommerce.model.Customers;
import com.ecommerce.model.Employees;

/**
 * Servlet implementation class UpdateCustomerProfile
 */
@WebServlet("/UpdateCustomerProfile")
public class UpdateCustomerProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerProfile() {
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

		int customerId = Integer.parseInt(request.getParameter("customerId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String mobileNumber = request.getParameter("mobileNumber");
        String emailId = request.getParameter("emailId");
        String password = request.getParameter("password");

        // Set data to Customers object
        Customers customer = new Customers();
        customer.setCustomerId(customerId);
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setMobileNumber(mobileNumber);
        customer.setEmailId(emailId);
        customer.setPassword(password);

        // Update via DAO
        CustomerDAO dao = new CustomerDAO();
        boolean flag = dao.updateCustomerByCustomerId(customerId, customer);

        if (flag) {
            // Update session attribute too if needed
        	CustomerDAO dao1 = new CustomerDAO();
        	Customers updated_customer = dao1.getCustomersByCustomerId(customerId);
            request.getSession().setAttribute("customer", updated_customer);

            response.sendRedirect("/EcommerceWebsite/view/customer/MyProfile.jsp?res=3");
        } else {
            response.sendRedirect("/EcommerceWebsite/view/customer/MyProfile.jsp?res=2");
        }


	}

}
