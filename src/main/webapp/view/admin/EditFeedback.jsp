<%@page import="com.ecommerce.model.Feedback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="Header.jsp"></jsp:include>
    <style>
        .form-container {
            max-width: 800px;
        }
        @keyframes slideInOutRight {
            0% {
                opacity: 0;
                transform: translateX(100%);
            }
            10% {
                opacity: 1;
                transform: translateX(0);
            }
            80% {
                opacity: 1;
                transform: translateX(0);
            }
            100% {
                opacity: 0;
                transform: translateX(100%);
            }
        }
        .alert {
            animation: slideInOutRight 3s ease forwards;
        }
    </style>
</head>
<body>
<% Feedback feedback = (Feedback)session.getAttribute("feedback"); %>
<div class="wrapper">
    <jsp:include page="Sidebar.jsp"></jsp:include>
    <div class="main-content">
        <button class="btn btn-primary d-md-none float-end" id="sidebarToggle">
            <i class="fas fa-bars"></i>
        </button>
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col form-container">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            <h3 class="card-title mb-0">Edit Feedback</h3>
                        </div>
                        <div class="card-body">
                            <form action="/EcommerceWebsite/Admin/UpdateFeedback" method="POST">
                                <!-- Feedback Details -->
                                <div class="row mb-4">
                                    <div class="col-md-6 mb-3">
                                        <label for="feedbackId" class="form-label">Feedback ID</label>
                                        <input type="number" class="form-control" id="feedbackId" name="feedbackId" 
                                            value="<%=feedback.getFeedbackId()%>" required readonly>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="date" class="form-label">Date</label>
                                        <input type="text" class="form-control" id="date" name="date" 
                                            value="<%=feedback.getDate()%>" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="customerId" class="form-label">Customer ID</label>
                                        <input type="number" class="form-control" id="customerId" name="customerId"
                                            value="<%=feedback.getCustomerId()%>" required>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <label for="customerQueries" class="form-label">Customer Queries</label>
                                        <textarea class="form-control" id="customerQueries" name="customerQueries" rows="3"><%=feedback.getCustomerQueries()%></textarea>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <label for="feedback" class="form-label">Feedback</label>
                                        <textarea class="form-control" id="feedback" name="feedback" rows="3"><%=feedback.getFeedback()%></textarea>
                                    </div>
                                </div>

                                <!-- Form Actions -->
                                <div class="d-flex justify-content-between">
                                    <button type="reset" class="btn btn-secondary">Reset</button>
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    // Sidebar toggle
    document.getElementById('sidebarToggle').addEventListener('click', function () {
        document.querySelector('.sidebar').classList.toggle('active');
        document.querySelector('.main-content').classList.toggle('active');
    });
</script>
</body>
</html>
