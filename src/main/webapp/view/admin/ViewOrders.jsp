<%@page import="com.ecommerce.model.CustomerOrders"%>
<%@page import="com.ecommerce.dao.CustomerOrdersDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>

<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="Sidebar.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Orders</title>
    <style>
        .order-table {
            padding: 20px;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .table thead {
            background-color: #6c5ce7;
            color: white;
        }

        .table th, .table td {
            padding: 12px 15px;
            text-align: center;
            vertical-align: middle;
        }

        .table-hover tbody tr:hover {
            background-color: rgba(108, 92, 231, 0.1);
        }

        .badge {
            padding: 6px 10px;
            font-weight: 500;
            font-size: 0.85em;
        }

        

        .btn-info {
            background-color: #00b894;
            border-color: #00b894;
        }

        .btn-info:hover {
            background-color: #00a884;
            border-color: #00a884;
        }

        .alert-info {
            background-color: #a29bfe;
            border-color: #a29bfe;
            color: white;
        }

        @media (max-width: 768px) {
            .order-table {
                padding: 10px;
            }
        }
    </style>
</head>
<body>

<!-- Your sidebar is already fixed. We wrap content in main-content class. -->
<div class="main-content">
    <div class="order-table">
        <h2 class="text-center mb-4">All Customer Orders</h2>

        <%
            CustomerOrdersDAO dao = new CustomerOrdersDAO();
            ArrayList<CustomerOrders> orderList = dao.getAllOrders();
            if (orderList != null && !orderList.isEmpty()) {
        %>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Id</th>
                        <th>Order Number</th>
                        <th>Product Code</th>
                        <th>Invoice Number</th>
                        <th>Order Date/Time</th>
                        <th>Cost (₹)</th>
                        <th>Discount (₹)</th>
                        <th>Quantity</th>
                        <th>GST (₹)</th>
                        <th>Bill Amount (₹)</th>
                        <th>Status</th>
                        <th>Invoices</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (CustomerOrders order : orderList) {
                    %>
                    <tr>
                        <td><%=order.getOrderId()%></td>
                        <td><%=order.getCustomerId()%></td>
                        <td><%=order.getOrderNumber()%></td>
                        <td><%=order.getProductCode()%></td>
                        <td><%=order.getInvoiceNumber()%></td>
                        <td><%=order.getOrderDateTime()%></td>
                        <td>₹<%=order.getCost()%></td>
                        <td>₹<%=order.getDiscountAmount()%></td>
                        <td><%=order.getQuantity()%></td>
                        <td>₹<%=order.getGstAmount()%></td>
                        <td>₹<%=order.getBillAmount()%></td>
                        <td><span class="badge bg-warning"><%= order.getOrderStatus()%></span></td>
                        <td>
                            <a href="/EcommerceWebsite/view/admin/Invoice.jsp?invoiceNumber=<%= order.getInvoiceNumber()%>"
                               class="btn btn-sm btn-info">Invoice</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <%
            } else {
        %>
        <div class="alert alert-info text-center">No orders found.</div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>