package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ecommerce.dao.EmployeeDAO;
import com.ecommerce.dao.FeedbackDAO;
import com.ecommerce.model.Employees;
import com.ecommerce.model.Feedback;

/**
 * Servlet implementation class EditFeedback
 */
@WebServlet("/Admin/EditFeedback")
public class EditFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditFeedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
		FeedbackDAO dao = new FeedbackDAO();
		
		Feedback feedback = dao.getFeedbackByFeedbackId(feedbackId);
		if(feedback == null) {  // not found
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewEmployees.jsp?res=2");
		}else {
			//found
			HttpSession session = request.getSession();
			session.setAttribute("feedback", feedback);
			
			response.sendRedirect("/EcommerceWebsite/view/admin/EditFeedback.jsp");
		}
	}

}
