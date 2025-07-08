<%@page import="com.ecommerce.model.Employees"%>
<%@page import="com.ecommerce.dao.EmployeeDAO"%>
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
}

.edit-btn {
    width: 90%;
    background-color: var(--primary-color);
    color: #fff;
    text-align: center;
}

.delete-btn {
    width: 90%;
    background-color: var(--danger-color);
    color: #fff;
    text-align: center;
}

.edit-btn:hover {
    background-color: #364fc7;
    box-shadow: inset 0 0 5px rgba(255, 255, 255, 0.3), 0 0 8px rgba(67, 97, 238, 0.5);
    opacity: 0.95;
}

.delete-btn:hover {
    background-color: #d62828;
    box-shadow: inset 0 0 5px rgba(255, 255, 255, 0.3), 0 0 8px rgba(249, 65, 68, 0.5);
    opacity: 0.95;
}

.employee-pic {
    width: 80px;
    height: 80px;
    object-fit: cover;
    border-radius: 50%;
    border: 2px solid #eee;
    transition: all 0.3s ease;
}

.employee-pic:hover {
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
                <h1 class="page-title">Employees Data</h1>
                <a href="/EcommerceWebsite/view/admin/AddEmployee.jsp" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Add New Employee
                    </a>
            </div>

            <%
            EmployeeDAO dao = new EmployeeDAO();
            ArrayList<Employees> empList = dao.getAllEmployees();
            %>

            <div class="table-responsive">
                <table class="table table-bordered table-hover table-custom mt-3">
                    <thead>
                        <tr>
                            <th>Actions</th>
                            <th>Employee Id</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Gender</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th>Designation</th>
                            <th>Salary</th>
                            <th>Password</th>
                            <th>Employee Pic</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Employees emp : empList) { %>
                        <tr>
                            <td>
                                <a href="/EcommerceWebsite/Admin/EditEmployee?employeeId=<%=emp.getEmployeeId()%>" 
                                   class="action-btn edit-btn">
                                   <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="/EcommerceWebsite/Admin/DeleteEmployee?employeeId=<%=emp.getEmployeeId()%>" 
                                   class="action-btn delete-btn">
                                   <i class="fas fa-trash-alt"></i> Delete
                                </a>
                            </td>
                            <td><%=emp.getEmployeeId()%></td>
                            <td><%=emp.getFirstName()%></td>
                            <td><%=emp.getLastName()%></td>
                            <td><%=emp.getGender()%></td>
                            <td><%=emp.getMobile()%></td>
                            <td><%=emp.getEmail()%></td>
                            <td><%=emp.getDesignation()%></td>
                            <td>₹<%=emp.getSalary()%></td>
                            <td><%=emp.getPassword()%></td>
                            <td>
                                <a href="/EcommerceWebsite/view/admin/UpdateEmployeePic.jsp?employeeId=<%=emp.getEmployeeId()%>">
                                    <img src='/uploads/<%=emp.getEmployeePic()%>' class='employee-pic'>
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
        msg = "Employee was deleted successfully."; cls = "alert-success"; icon = "fa-check-circle";
    } else if (res == 0) {
        msg = "Employee could not be deleted."; cls = "alert-danger"; icon = "fa-exclamation-circle";
    } else if (res == 2) {
        msg = "Employee could not be updated."; cls = "alert-danger"; icon = "fa-exclamation-circle";
    } else if (res == 3) {
        msg = "Employee was updated successfully."; cls = "alert-success"; icon = "fa-check-circle";
    } else if (res == 4) {
        msg = "Employee picture was updated successfully."; cls = "alert-success"; icon = "fa-check-circle";
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
