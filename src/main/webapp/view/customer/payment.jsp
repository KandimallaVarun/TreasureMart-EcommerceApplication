<%@page import="com.ecommerce.model.Customers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Customers customer = (Customers) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("/EcommerceWebsite/view/home/CustomerLogin.jsp");
        return;
    }
    
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkout | Your E-Commerce Store</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary: #2c3e50;
      --secondary: #34495e;
      --accent: #3498db;
      --light: #ecf0f1;
      --dark: #2c3e50;
      --success: #27ae60;
      --border: #dfe6e9;
    }
    
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
      color: var(--dark);
    }
    
    .checkout-container {
      max-width: 1200px;
      margin: 2rem auto;
    }
    
    .checkout-card {
      border: none;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
      overflow: hidden;
    }
    
    .checkout-header {
      background-color: var(--primary);
      color: white;
      padding: 1.5rem;
      border-bottom: 4px solid var(--accent);
    }
    
    .checkout-progress {
      display: flex;
      justify-content: space-between;
      padding: 1.5rem 2rem;
      background-color: var(--light);
      border-bottom: 1px solid var(--border);
    }
    
    .progress-step {
      text-align: center;
      position: relative;
      flex: 1;
    }
    
    .progress-step.active {
      font-weight: 600;
      color: var(--accent);
    }
    
    .progress-step.completed {
      color: var(--success);
    }
    
    .progress-step:not(:last-child):after {
      content: '';
      position: absolute;
      top: 15px;
      left: 60%;
      width: 80%;
      height: 2px;
      background-color: var(--border);
      z-index: 1;
    }
    
    .step-number {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 30px;
      height: 30px;
      border-radius: 50%;
      background-color: var(--border);
      color: var(--dark);
      margin-bottom: 0.5rem;
    }
    
    .active .step-number {
      background-color: var(--accent);
      color: white;
    }
    
    .completed .step-number {
      background-color: var(--success);
      color: white;
    }
    
    .section-title {
      font-size: 1.25rem;
      font-weight: 600;
      margin-bottom: 1.5rem;
      color: var(--primary);
      position: relative;
      padding-bottom: 0.75rem;
    }
    
    .section-title:after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 50px;
      height: 3px;
      background-color: var(--accent);
    }
    
    .form-control, .form-select {
      padding: 0.75rem 1rem;
      border-radius: 6px;
      border: 1px solid var(--border);
      transition: all 0.2s;
    }
    
    .form-control:focus, .form-select:focus {
      border-color: var(--accent);
      box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.15);
    }
    
    .payment-card {
      background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
      border-radius: 8px;
      padding: 1.5rem;
      border: 1px solid var(--border);
      margin-bottom: 1.5rem;
    }
    
    .card-brand {
      height: 24px;
      margin-left: 0.5rem;
    }
    
    .btn-primary {
      background-color: var(--accent);
      border: none;
      padding: 1rem;
      font-weight: 600;
      letter-spacing: 0.5px;
      transition: all 0.2s;
    }
    
    .btn-primary:hover {
      background-color: #2980b9;
      transform: translateY(-1px);
    }
    
    .secure-payment {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      margin-top: 1rem;
      color: #7f8c8d;
      font-size: 0.9rem;
    }
    
    @media (max-width: 768px) {
      .checkout-progress {
        flex-direction: column;
        align-items: flex-start;
        gap: 1rem;
        padding: 1rem;
      }
      
      .progress-step {
        text-align: left;
        display: flex;
        align-items: center;
        gap: 1rem;
        width: 100%;
      }
      
      .progress-step:not(:last-child):after {
        display: none;
      }
      
      .step-number {
        margin-bottom: 0;
      }
    }
  </style>
</head>
<body>

<%
String qty="";
try{
  
  for(int slno=1; slno<=10; slno++)  {
    if(request.getParameter("qty" + slno) == null){
      break;
    }
    qty += request.getParameter("qty" + slno) +",";
  }
  
  
}catch(Exception e){
  System.out.println("Error:"+ e);
}

System.out.println("qty=" + qty);

session.setAttribute("qty", qty);

%>

<div class="checkout-container">
  <div class="checkout-card w-75 mx-auto">
    <div class="checkout-header">
      <h1 class="h4 mb-0">Checkout</h1>
    </div>
    
    <div class="checkout-progress">
      <div class="progress-step completed">
        <div class="step-number"><i class="fas fa-check"></i></div>
        <div>Cart</div>
      </div>
      <div class="progress-step active">
        <div class="step-number">2</div>
        <div>Shipping & Payment</div>
      </div>
      <div class="progress-step">
        <div class="step-number">3</div>
        <div>Confirmation</div>
      </div>
    </div>
    
    <div class="row g-0">
      <div class="col-lg-8 p-4 p-md-5 mx-auto w-100">
        <form name='f1' method="post" action="/EcommerceWebsite/addPayment">
          <div class="mb-5">
            <h3 class="section-title">Shipping Information</h3>
            <div class="mb-4">
              <label for="deliveryAddress" class="form-label fw-semibold">Delivery Address</label>
              <textarea class="form-control" id="deliveryAddress" name="deliveryAddress" rows="3" required>Warangal</textarea>
            </div>
            <div class="row g-3">
              <div class="col-md-6">
                <label for="mobileNumber" class="form-label fw-semibold">Mobile Number</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
                  <input type="tel" class="form-control" id="mobileNumber" name="mobileNumber" value="1234567890" required pattern="[0-9]{10}">
                </div>
              </div>
              <div class="col-md-6">
                <label for="zipCode" class="form-label fw-semibold">ZIP Code</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                  <input type="text" class="form-control" id="zipCode" name="zipCode" value="123456" required pattern="[0-9]{6}">
                </div>
              </div>
            </div>
          </div>
          
          <div class="mb-4">
            <h3 class="section-title">Payment Method</h3>
            <div class="payment-card">
              <div class="mb-4">
                <label for="cardType" class="form-label fw-semibold">Card Type</label>
                <select class="form-select" id="cardType" name="cardType" required>
                  <option value="">Select card type</option>
                  <option selected>Visa</option>
                  <option>MasterCard</option>
                  <option>RuPay</option>
                </select>
              </div>
              
              <div class="mb-4">
                <label for="cardNumber" class="form-label fw-semibold">Card Number</label>
                <div class="input-group">
                  <input type="text" class="form-control" id="cardNumber" name="cardNumber" value="1231231231231234" required pattern="[0-9]{16}" placeholder="0000 0000 0000 0000">
                  <span class="input-group-text bg-white p-0">
                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/visa/visa-original.svg" class="card-brand" id="cardBrandIcon">
                  </span>
                </div>
              </div>
              
              <div class="row g-3">
                <div class="col-md-6">
                  <label for="customerName" class="form-label fw-semibold">Name on Card</label>
                  <input type="text" class="form-control" id="customerName" name="customerName" value="VMK" required>
                </div>
                <div class="col-md-3">
                  <label for="expiryDate" class="form-label fw-semibold">Expiry Date</label>
                  <input type="text" class="form-control" id="expiryDate" name="expiryDate" value="12-2026" required placeholder="MM-YYYY">
                </div>
                <div class="col-md-3">
                  <label for="cvvNumber" class="form-label fw-semibold">CVV</label>
                  <div class="input-group">
                    <input type="password" class="form-control" id="cvvNumber" name="cvvNumber" value="123" required pattern="[0-9]{3}" placeholder="•••">
                    <button class="input-group-text bg-white" type="button" id="cvvHelp" data-bs-toggle="tooltip" data-bs-placement="top" title="3-digit code on back of card">
                      <i class="fas fa-question-circle"></i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="d-grid mt-4">
              <button type="submit" class="btn btn-primary btn-lg">
                <i class="fas fa-lock me-2"></i> Complete Secure Payment
              </button>
              <div class="secure-payment">
                <i class="fas fa-shield-alt"></i>
                <span>Secure SSL Encryption</span>
              </div>
            </div>
          </div>
        </form>
      </div>
      
      
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Update card icon based on selected card type
  document.getElementById('cardType').addEventListener('change', function() {
    const cardType = this.value;
    const icon = document.getElementById('cardBrandIcon');
    
    if (cardType === 'Visa') {
      icon.src = 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/visa/visa-original.svg';
    } else if (cardType === 'MasterCard') {
      icon.src = 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mastercard/mastercard-original.svg';
    } else if (cardType === 'RuPay') {
      icon.src = 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/RuPay.svg/1200px-RuPay.svg.png';
    } else {
      icon.src = '';
    }
  });
  
  // Format card number input
  document.getElementById('cardNumber').addEventListener('input', function(e) {
    let value = e.target.value.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
    let formatted = value.replace(/(\d{4})/g, '$1 ').trim();
    e.target.value = formatted;
  });
  
  // Initialize tooltips
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });
</script>
</body>
</html>