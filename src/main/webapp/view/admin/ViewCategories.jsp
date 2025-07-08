<%@page import="com.ecommerce.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecommerce.dao.CategoryDAO"%>
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

        .category-table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            max-width : 80%;
            margin:auto;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .category-table thead {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
        }

        .category-table th {
            font-weight: 500;
            padding: 15px;
        }

        .category-table td {
            padding: 12px 15px;
            vertical-align: middle;
        }

        .category-table tr:nth-child(even) {
            background-color: rgba(0,0,0,0.02);
        }

        .category-table tr:hover {
            background-color: rgba(67, 97, 238, 0.05);
        }

        .action-btn {
            padding: 5px 12px;
            font-size: 0.85rem;
            border-radius: 4px;
            margin-right: 5px;
            transition: all 0.2s ease;
        }

        .edit-btn {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .delete-btn {
            background-color: var(--danger-color);
            border-color: var(--danger-color);
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

        .category-img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #eee;
            transition: all 0.3s ease;
        }

        .category-img:hover {
            transform: scale(1.05);
            border-color: var(--primary-color);
        }

        /* Alert Notifications */
        @keyframes slideInRight {
            0% {
                transform: translateX(100%);
                opacity: 0;
            }
            100% {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes fadeOut {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

        .alert-notification {
            position: fixed;
            top: 20px;
            right: 20px;
            width: 350px;
            z-index: 9999;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            animation: slideInRight 0.5s ease forwards, fadeOut 0.5s ease 4.5s forwards;
            display: flex;
            align-items: center;
            padding: 15px;
        }

        .alert-notification .btn-close {
            margin-left: auto;
            padding: 0.5rem;
        }

        .alert-notification i {
            margin-right: 10px;
            font-size: 1.2rem;
        }

        .success-alert {
            background-color: #d1fae5;
            color: #065f46;
            border-left: 4px solid #10b981;
        }

        .danger-alert {
            background-color: #fee2e2;
            color: #b91c1c;
            border-left: 4px solid #ef4444;
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
                    <h1 class="page-title">Categories Data</h1>
                    <a href="/EcommerceWebsite/view/admin/AddCategory.jsp" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Add New Category
                    </a>
                </div>

                <div class="table-responsive">
                    <table class="table category-table  table-bordered">
                        <thead class="table-dark">
                            <tr>
                                <th>Actions</th>
                                <th>ID</th>
                                <th>Category Name</th>
                                <th>Image</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            CategoryDAO dao = new CategoryDAO();
                            ArrayList<Category> catList = dao.getAllCategories();
                            for (Category cat : catList) {
                            %>
                            <tr>
                                <td>
                                    <a href="/EcommerceWebsite/Admin/EditCategory?categoryId=<%=cat.getCategoryId()%>" 
                                       class="btn btn-sm edit-btn action-btn text-white">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <a href="/EcommerceWebsite/Admin/DeleteCategory?categoryId=<%=cat.getCategoryId()%>" 
                                       class="btn btn-sm delete-btn action-btn text-white">
                                        <i class="fas fa-trash-alt"></i> Delete
                                    </a>
                                </td>
                                <td><%=cat.getCategoryId()%></td>
                                <td><%=cat.getCategoryName()%></td>
                                <td>
                                    <a href="/EcommerceWebsite/view/admin/UpdateCategoryImage.jsp?categoryId=<%= cat.getCategoryId()%>">
                                        <img src='/uploads/<%=cat.getCategoryImage() %>' class='category-img'>
                                    </a>
                                </td>
                            </tr>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <%
    if (request.getParameter("res") != null) {
        int res = Integer.parseInt(request.getParameter("res"));
        if (res == 1) {
    %>
    <div class="alert-notification success-alert">
        <i class="fas fa-check-circle"></i>
        <strong>Success!</strong> Category was deleted successfully.
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <%
    } else if (res == 0) {
    %>
    <div class="alert-notification danger-alert">
        <i class="fas fa-exclamation-circle"></i>
        <strong>Failed!</strong> Category could not be deleted.
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <%
    } else if (res == 2) {
    %>
    <div class="alert-notification danger-alert">
        <i class="fas fa-exclamation-circle"></i>
        <strong>Failed!</strong> Category could not be updated.
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <%
    } else if (res == 3) {
    %>
    <div class="alert-notification success-alert">
        <i class="fas fa-check-circle"></i>
        <strong>Success!</strong> Category was updated successfully.
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <%
    }
    }
    %>

    <script type="text/javascript">
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            document.querySelector('.sidebar').classList.toggle('active');
            document.querySelector('.main-content').classList.toggle('active');
        });

        // Auto-hide alerts after 5 seconds
        setTimeout(() => {
            const alerts = document.querySelectorAll('.alert-notification');
            alerts.forEach(alert => {
                alert.style.display = 'none';
            });
        }, 5000);
    </script>
</body>
</html>