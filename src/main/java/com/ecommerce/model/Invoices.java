package com.ecommerce.model;

public class Invoices {
	private long invoiceNumber;
	private long orderId;
	private int invoiceAmount;
	private String invoiceDate;
	private String invoiceType;
	private String cardNumber;
	private String cardType;
	private String paymentStatus;
	public long getInvoiceNumber() {
		return invoiceNumber;
	}
	public void setInvoiceNumber(long invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public int getInvoiceAmount() {
		return invoiceAmount;
	}
	public void setInvoiceAmount(int invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}
	public String getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public String getInvoiceType() {
		return invoiceType;
	}
	public void setInvoiceType(String invoiceType) {
		this.invoiceType = invoiceType;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	@Override
	public String toString() {
		return "Invoices [invoiceNumber=" + invoiceNumber + ", orderId=" + orderId + ", invoiceAmount=" + invoiceAmount
				+ ", invoiceDate=" + invoiceDate + ", invoiceType=" + invoiceType + ", cardNumber=" + cardNumber
				+ ", cardType=" + cardType + ", paymentStatus=" + paymentStatus + "]";
	}
	
	
	
}
