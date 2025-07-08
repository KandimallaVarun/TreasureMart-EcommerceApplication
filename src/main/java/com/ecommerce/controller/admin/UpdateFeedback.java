package com.ecommerce.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ecommerce.dao.FeedbackDAO;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Feedback;
import com.ecommerce.model.Products;

/**
 * Servlet implementation class UpdateFeedback
 */
@WebServlet("/Admin/UpdateFeedback")
public class UpdateFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFeedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
		String date = request.getParameter("date");
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		String customerQueries = request.getParameter("customerQueries");
		String feedbackStr = request.getParameter("feedback");
		
		Feedback feedback = new Feedback();
		feedback.setFeedbackId(feedbackId);
        feedback.setDate(date);
        feedback.setCustomerId(customerId);
        feedback.setCustomerQueries(customerQueries);
        feedback.setFeedback(feedbackStr);
		
		FeedbackDAO dao = new FeedbackDAO();
		boolean flag = dao.updateFeedbackByFeedbackId(feedbackId, feedback);
		
		if(flag == true) {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewFeedbacks.jsp?res=3");
		}else {
			response.sendRedirect("/EcommerceWebsite/view/admin/ViewFeedbacks.jsp?res=2");
		}
	}

}
