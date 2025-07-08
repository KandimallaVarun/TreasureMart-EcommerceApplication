<%@page import="com.ecommerce.dao.CustomerDAO"%>
<%@page import="com.ecommerce.model.Customers"%>
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
    cursor: pointer;
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
    word-break: break-word;
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
    transition: all 0.3s ease;
    border: none;
    color: white;
    cursor: pointer;
    width: 90%;
    justify-content: center;
}

.edit-btn {
    background-color: var(--primary-color);
}

.edit-btn:hover {
    background-color: #364fc7;
    box-shadow: inset 0 0 5px rgba(255, 255, 255, 0.3), 0 0 8px rgba(67, 97, 238, 0.5);
    opacity: 0.95;
}

.delete-btn {
    background-color: var(--danger-color);
}

.delete-btn:hover {
    background-color: #d62828;
    box-shadow: inset 0 0 5px rgba(255, 255, 255, 0.3), 0 0 8px rgba(249, 65, 68, 0.5);
    opacity: 0.95;
}

.action-btn i {
    pointer-events: none;
}

.profile-pic {
    width: 80px;
    height: 80px;
    object-fit: cover;
    border-radius: 50%;
    border: 2px solid #eee;
    transition: all 0.3s ease;
}

.profile-pic:hover {
    transform: scale(1.05);
    border-color: var(--primary-color);
}

/* Alerts */
@keyframes slideInOutRight {
  0% { opacity: 0; transform: translateX(100%); }
  10%, 80% { opacity: 1; transform: translateX(0); }
  100% { opacity: 0; transform: translateX(100%); }
}

.alert {
  animation: slideInOutRight 4s ease forwards;
  z-index: 9999;
  width: 400px;
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
                <h1 class="page-title">Customers Data</h1>
            </div>

            <%
            CustomerDAO dao = new CustomerDAO();
            ArrayList<Customers> custList = dao.getAllCustomers();
            %>

            <div class="table-responsive">
                <table class="table table-bordered table-hover table-custom mt-3">
                    <thead class="table-dark">
                        <tr>
                            <!-- <th>Actions</th> -->
                            <th>Customer ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Mobile Number</th>
                            <th>Email ID</th>
                            <th>Password</th>
                            <th>Register Date</th>
                            <th>Profile Pic</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Customers cust : custList) { %>
                        <tr>
                            <!-- <td>
                                <a href="/EcommerceWebsite/Admin/EditCustomer?customerId=<%=cust.getCustomerId()%>" 
                                   class="action-btn edit-btn">
                                   <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="/EcommerceWebsite/Admin/DeleteCustomer?customerId=<%=cust.getCustomerId()%>" 
                                   class="action-btn delete-btn">
                                   <i class="fas fa-trash-alt"></i> Delete
                                </a>
                            </td> -->
                            <td><%=cust.getCustomerId()%></td>
                            <td><%=cust.getFirstName()%></td>
                            <td><%=cust.getLastName()%></td>
                            <td><%=cust.getMobileNumber()%></td>
                            <td><%=cust.getEmailId()%></td>
                            <td><%=cust.getPassword()%></td>
                            <td><%=cust.getRegisterDate()%></td>
                            <td>
                                <a href="/EcommerceWebsite/view/admin/UpdateCustomerPic.jsp?customerId=<%=cust.getCustomerId()%>">
                                    <img src='/uploads/<%=cust.getProfilePic()%>' class='profile-pic' alt="Profile Picture">
                                </a>
                            </td>
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
        msg = "Customer was deleted successfully."; cls = "alert-success"; icon = "fa-check-circle";
    } else if (res == 0) {
        msg = "Customer could not be deleted."; cls = "alert-danger"; icon = "fa-exclamation-circle";
    } else if (res == 2) {
        msg = "Customer could not be updated."; cls = "alert-danger"; icon = "fa-exclamation-circle";
    } else if (res == 3) {
        msg = "Customer was updated successfully."; cls = "alert-success"; icon = "fa-check-circle";
    }
%>
<div class="alert <%=cls%> alert-dismissible position-fixed top-0 end-0 m-3">
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
