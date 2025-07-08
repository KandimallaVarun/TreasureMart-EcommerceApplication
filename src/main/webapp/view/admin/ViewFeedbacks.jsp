<%@page import="com.ecommerce.model.Feedback"%>
<%@page import="com.ecommerce.dao.FeedbackDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="Header.jsp"></jsp:include>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --danger-color: #f94144;
            --success-color: #4bb543;
            --light-bg: #f8f9fa;
            --dark-text: #212529;
        }
        body {
            background-color: #f5f7ff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .wrapper {
            display: flex;
            min-height: 100vh;
        }
        .main-content {
            flex: 1;
            padding: 20px;
            transition: all 0.3s ease;
        }
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }
        .page-title {
            color: var(--primary-color);
            font-weight: 600;
            margin: 0;
        }
        #sidebarToggle {
            background: var(--primary-color);
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            color: white;
            display: none;
        }
        @media (max-width: 768px) {
            #sidebarToggle {
                display: block;
            }
        }
        .table-custom {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            width: 100%;
        }
        .table-custom thead {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
        }
        .table-custom th, .table-custom td {
            padding: 12px 15px;
            vertical-align: middle;
            text-align: center;
            font-size: 0.9rem;
        }
        .table-custom tr:nth-child(even) {
            background-color: rgba(0,0,0,0.02);
        }
        .table-custom tr:hover {
            background-color: rgba(67, 97, 238, 0.05);
        }
        .action-btn {
            padding: 6px 14px;
            font-size: 0.85rem;
            border-radius: 4px;
            margin-bottom: 5px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: all 0.2s ease;
            border: none;
            cursor: pointer;
            text-decoration: none;
            color: white;
        }
        .edit-btn {
            background-color: var(--primary-color);
            width: 90%;
        }
        .delete-btn {
            background-color: var(--danger-color);
            width: 90%;
        }
        .edit-btn:hover {
            background-color: #364fc7;
            box-shadow: inset 0 0 5px rgba(255,255,255,0.3), 0 0 8px rgba(67,97,238,0.5);
            opacity: 0.95;
        }
        .delete-btn:hover {
            background-color: #d62828;
            box-shadow: inset 0 0 5px rgba(255,255,255,0.3), 0 0 8px rgba(249,65,68,0.5);
            opacity: 0.95;
        }
        /* Alert animation */
        @keyframes slideInOutRight {
          0% { opacity: 0; transform: translateX(100%); }
          10%, 80% { opacity: 1; transform: translateX(0); }
          100% { opacity: 0; transform: translateX(100%); }
        }
        .alert {
          animation: slideInOutRight 4s ease forwards;
          z-index: 9999;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <jsp:include page="Sidebar.jsp"></jsp:include>
        <div class="main-content">
            <button class="btn btn-primary d-md-none float-end" id="sidebarToggle">
                <i class="fas fa-bars"></i>
            </button>

            <div class="container-fluid">
                <div class="page-header">
                    <h1 class="page-title">Feedback Data</h1>
                    <!-- Add New Feedback button if applicable -->
                </div>

                <%
                FeedbackDAO dao = new FeedbackDAO();
                ArrayList<Feedback> feedList = dao.getAllFeedbacks();
                %>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-custom mt-3">
                        <thead class="table-dark">
                            <tr>
                                <th>Actions</th>
                                <th>Feedback ID</th>
                                <th>Date</th>
                                <th>Customer ID</th>
                                <th>Customer Queries</th>
                                <th>Feedback</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Feedback feed : feedList) { %>
                            <tr>
                                <td>
                                    <a href="/EcommerceWebsite/Admin/EditFeedback?feedbackId=<%=feed.getFeedbackId()%>" 
                                       class="action-btn edit-btn">
                                       <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <!-- Uncomment below if delete is needed
                                    <a href="/EcommerceWebsite/Admin/DeleteFeedback?feedbackId=<%=feed.getFeedbackId()%>" 
                                       class="action-btn delete-btn">
                                       <i class="fas fa-trash-alt"></i> Delete
                                    </a>
                                    -->
                                </td>
                                <td><%=feed.getFeedbackId()%></td>
                                <td><%=feed.getDate()%></td>
                                <td><%=feed.getCustomerId()%></td>
                                <td><%=feed.getCustomerQueries()%></td>
                                <td><%=feed.getFeedback()%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <%
    if (request.getParameter("res") != null) {
        int res = Integer.parseInt(request.getParameter("res"));
        String msg = "", cls = "", icon = "";
        if (res == 1) {
            msg = "Feedback was deleted successfully."; cls = "alert-success"; icon = "fa-check-circle";
        } else if (res == 0) {
            msg = "Feedback could not be deleted."; cls = "alert-danger"; icon = "fa-exclamation-circle";
        } else if (res == 2) {
            msg = "Feedback could not be updated."; cls = "alert-danger"; icon = "fa-exclamation-circle";
        } else if (res == 3) {
            msg = "Feedback was updated successfully."; cls = "alert-success"; icon = "fa-check-circle";
        }
    %>
    <div class="alert <%=cls%> alert-dismissible position-fixed top-0 end-0 m-3" style="width: 400px;">
        <i class="fas <%=icon%> me-2"></i> <strong><%=msg%></strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <% } %>

    <script>
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            document.querySelector('.sidebar').classList.toggle('active');
            document.querySelector('.main-content').classList.toggle('active');
        });
    </script>
</body>
</html>
