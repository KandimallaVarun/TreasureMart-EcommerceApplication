package com.ecommerce.model;

public class Feedback {
	private int feedbackId;
	private String date;
	private int customerId;
	private String customerQueries;
	private String feedback;
	public Feedback() {
		super();
	}
	public int getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getCustomerQueries() {
		return customerQueries;
	}
	public void setCustomerQueries(String customerQueries) {
		this.customerQueries = customerQueries;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	
}
