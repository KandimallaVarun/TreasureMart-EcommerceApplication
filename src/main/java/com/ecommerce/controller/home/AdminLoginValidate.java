package com.ecommerce.controller.home;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ecommerce.dao.AdminDAO;
import com.ecommerce.model.Admin;

/**
 * Servlet implementation class AdminLoginValidate
 */
@WebServlet("/AdminLoginValidate")
public class AdminLoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginValidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		AdminDAO dao = new AdminDAO();
		Admin admin_new = dao.loginValidate(admin);
		
		if(admin_new == null) {  //user not found
			response.sendRedirect("/EcommerceWebsite/view/home/AdminLogin.jsp?res=0");
		}else { //found
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin_new);
			response.sendRedirect("/EcommerceWebsite/view/admin/Dashboard.jsp");
		}
		
		
	}

}
