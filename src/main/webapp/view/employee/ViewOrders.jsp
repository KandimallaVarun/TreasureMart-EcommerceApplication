<%@page import="com.ecommerce.model.CustomerOrders"%>
<%@page import="com.ecommerce.dao.CustomerOrdersDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>

<jsp:include page="../admin/Header.jsp"></jsp:include>


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
    
    <script>
    document.addEventListener('DOMContentLoaded', function () {
    	  var editStatusModal = document.getElementById('editStatusModal');
    	  editStatusModal.addEventListener('show.bs.modal', function (event) {
    	    var button = event.relatedTarget;

    	    var orderId = button.getAttribute('data-orderid');
    	    var invoiceNumber = button.getAttribute('data-invoicenumber');
    	    var productCode = button.getAttribute('data-productcode');
    	    var currentStatus = button.getAttribute('data-status');

    	    // assign to modal inputs
    	    editStatusModal.querySelector('#modalOrderId').value = orderId;
    	    editStatusModal.querySelector('#modalInvoiceNumber').value = invoiceNumber;
    	    editStatusModal.querySelector('#modalProductCode').value = productCode;
    	    editStatusModal.querySelector('#orderStatus').value = currentStatus;
    	  });
    	});


</script>
    
</head>
<body>

<jsp:include page="Sidebar.jsp"></jsp:include>
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
						<td>
						  <span class="badge bg-warning mb-2"><%= order.getOrderStatus()%></span>
						  <a href="#" class="text-primary" data-bs-toggle="modal" data-bs-target="#editStatusModal" 
						     data-invoiceNumber="<%= order.getInvoiceNumber()%>" data-productCode="<%= order.getProductCode()%>" data-status="<%= order.getOrderStatus()%>">
						    <i class="fas fa-edit"></i>
						  </a>
						</td>
                        <td>
                            <a href="/EcommerceWebsite/view/employee/Invoice.jsp?invoiceNumber=<%= order.getInvoiceNumber()%>"
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


<!-- Edit Status Modal -->
<div class="modal fade" id="editStatusModal" tabindex="-1" aria-labelledby="editStatusModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form action="/EcommerceWebsite/UpdateOrderStatus" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editStatusModalLabel">Update Order Status</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="orderId" id="modalOrderId">
          <input type="hidden" name="invoiceNumber" id="modalInvoiceNumber">
          <input type="hidden" name="productCode" id="modalProductCode">
          <div class="mb-3">
            <label for="orderStatus" class="form-label">Order Status</label>
            <select class="form-select" name="orderStatus" id="orderStatus" required>
              <option value="Pending">Pending</option>
              <option value="Confirmed">Confirmed</option>
              <option value="Shipped">Shipped</option>
              <option value="Completed">Delivered</option>
              <option value="Cancelled">Cancelled</option>
            </select>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Update Status</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body>
</html>