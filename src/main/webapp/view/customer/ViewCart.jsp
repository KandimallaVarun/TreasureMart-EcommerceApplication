<%@page import="com.ecommerce.model.Cart"%>
<%@page import="com.ecommerce.dao.CartDAO"%>
<%@page import="com.ecommerce.dao.CustomerDAO"%>
<%@page import="com.ecommerce.model.Customers"%>
<%@page import="com.ecommerce.dao.ProductDAO"%>
<%@page import="com.ecommerce.model.Products"%>
<%@page import="com.ecommerce.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecommerce.dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
request.setAttribute("currentPage", "cart");
%>
    <jsp:include page="../admin/Header.jsp"></jsp:include>
    <style>
        body {
            padding-top: 80px;
            background-color: #f8f9fa;
        }
        
        .sidebar{
        	width:80% !important;
        	margin: 0 auto;
        }

        @keyframes slideInOutRight {
            0% { opacity: 0; transform: translateX(100%); }
            10% { opacity: 1; transform: translateX(0); }
            80% { opacity: 1; transform: translateX(0); }
            100% { opacity: 0; transform: translateX(100%); }
        }
        .alert {
            animation: slideInOutRight 3s ease forwards;
        }

        /* Enhanced Cart Card Styles */
        .cart-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            border: 1px solid #e0e0e0;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .cart-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.12);
        }

        .product-image-container {
            overflow: hidden;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        /* Enhanced quantity input styling */
        .quantity-control {
            display: flex;
            align-items: center;
            margin: 10px 0;
        }

        .quantity-label {
            margin-right: 10px;
            font-weight: 500;
            color: #555;
        }

        .quantity-input {
            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 30px;
            overflow: hidden;
            width: fit-content;
        }

        .quantity-input button {
            background-color: #f8f9fa;
            border: none;
            padding: 5px 12px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.2s;
            color: #555;
        }

        .quantity-input button:hover {
            background-color: #e9ecef;
        }

        .quantity-input input {
            width: 40px;
            text-align: center;
            border: none;
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            padding: 5px;
            font-size: 14px;
            -moz-appearance: textfield;
        }

        .quantity-input input::-webkit-outer-spin-button,
        .quantity-input input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Price styling enhancements */
        .price-display {
            margin: 10px 0;
        }

        .current-price {
            font-size: 18px;
            font-weight: 700;
            color: #2c3e50;
        }

        .original-price {
            font-size: 14px;
            color: #95a5a6;
            text-decoration: line-through;
            margin-left: 8px;
        }

        .discount-badge {
            background-color: green;
            color: white;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
            margin-left: 8px;
            display: inline-block;
        }

        /* Product info enhancements */
        .product-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 8px;
        }

        .product-description {
            color: #7f8c8d;
            font-size: 0.9rem;
            margin-bottom: 10px;
            line-height: 1.4;
        }

        .date-added {
            font-size: 0.8rem;
            color: #bdc3c7;
            margin-top: 5px;
            float: left;
        }

        .remove-btn {
            float: right;
            padding: 6px 12px;
            font-size: 0.85rem;
            border-radius: 4px;
            transition: all 0.2s;
        }

        .remove-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Price Summary Styles */
        .pricebar {
            background-color: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            height: auto;
            position: sticky;
            top: 100px;
            border: 1px solid #e0e0e0;
            width: 90%;
        }

        .pricebar h1 {
            font-size: 1.5rem;
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .price-details {
            margin-bottom: 20px;
        }

        .price-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 8px;
            border-bottom: 1px dashed #e0e0e0;
        }

        .price-item:last-child {
            border-bottom: none;
        }

        .price-label {
            color: #7f8c8d;
            font-size: 0.95rem;
        }

        .price-value {
            color: #2c3e50;
            font-weight: 500;
        }

        .total-amount {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
        }

        .total-label {
            font-size: 1.1rem;
            color: #2c3e50;
            font-weight: 600;
        }

        .total-value {
            font-size: 1.3rem;
            color: #e74c3c;
            font-weight: 700;
        }

        .checkout-btn {
            width: 100%;
            padding: 12px;
            font-weight: 600;
            background-color: #2ecc71;
            border: none;
            margin-top: 20px;
            transition: all 0.3s;
            border-radius: 6px;
        }

        .checkout-btn:hover {
            background-color: #27ae60;
            transform: translateY(-2px);
        }

        .proceed {
            position: sticky;
            bottom: 10px;
            z-index: 100;
        }

        .cart-items-container {
            padding-bottom: 80px;
        }
                @media (max-width: 991.98px) {
    .sidebar {
        display: none;
    }
}
    </style>

    <script type="text/javascript">
        function changeQuantity(totalCartItems, slno, productCost, discountAmount) {
            let qty = parseInt(document.getElementById("qty"+slno).value);
            
            let finalCost = (qty * productCost) - (qty * discountAmount);
            document.getElementById("finalCost"+slno).innerHTML = ""+finalCost;
            document.getElementById("productCost"+slno).innerHTML = ""+(qty * productCost);
            
            let totalProductsCost = 0;
            let payableAmount = 0;
            let totalDiscountAmount = 0;
            for(let i=1; i<= totalCartItems; i++) {
                let cost1 = parseInt(document.getElementById("productCost"+i).innerHTML);
                totalProductsCost += cost1;
                
                let Cost2 = parseInt(document.getElementById("finalCost"+i).innerHTML);
                payableAmount += Cost2;
                
                let discountPercent = parseInt(document.getElementById("discount"+i).innerHTML);
                let discount = (discountPercent)/100.0 * cost1;
                totalDiscountAmount += discount;
            }
            
            document.getElementById("totalProductsCost").innerHTML = totalProductsCost;
            document.getElementById("totalDiscountAmount").innerHTML = totalDiscountAmount;
            document.getElementById("payableAmount").innerHTML = payableAmount;
            document.getElementById("totalDiscountAmount2").innerHTML = totalDiscountAmount + 40;
        }
    </script>
</head>
<body>
    <jsp:include page="../home/Navbar.jsp"></jsp:include>

    <%
    Customers customer = (Customers) session.getAttribute("customer");
    if (customer == null) {
    %>

    <div class="container mx-auto text-center bg-light w-50 p-3"
        style="border-radius: 10px;">
        <h4>Sorry! You have not Logged in</h4>
        <p>Please Login to view your cart</p>
        <a class="btn btn-success btn-md"
            href="/EcommerceWebsite/view/home/CustomerLogin.jsp">Login</a>
    </div>
    <%
    session.setAttribute("redirectAfterLogin", "/EcommerceWebsite/view/customer/ViewCart.jsp");
    return;
    }
    %>

    <div class="container-fluid">
                        <!-- Mobile toggle button -->
<button class="btn btn-dark mb-3 d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#customerSidebar" aria-controls="customerSidebar">
  <i class="bi bi-list"></i>
</button>
        <div class="row">
            <!-- Sidebar -->
            <jsp:include page="Sidebar.jsp"></jsp:include>

            <!-- Dashboard Content -->
            <div class="col-md-6 cart-items-container">
                <form action="payment.jsp">
                    <div class="container mt-1">
                        <h2 class="mb-4 text-light">🛒 Your Cart Items</h2>

                        <%
                        ProductDAO dao = new ProductDAO();
                        ArrayList<Products> prodList = dao.getAllProducts();
                        CartDAO cartDAO = new CartDAO();
                        ArrayList<Cart> cartList = cartDAO.getAllCartItems();
                        int slno = 0;
                        int totalProductsCost = 0;
                        int totalDiscountAmount = 0;
                        int payableAmount = 0;

                        int totalCartItems = 0;
                        for (Cart cart : cartList) {
                            if (cart.getCustomerId() == customer.getCustomerId()) {
                                for (Products product : prodList) {
                                    if (product.getProductCode() == cart.getProductCode()) {
                                        totalCartItems++;
                                    }
                                }
                            }
                        }

                        for (Cart cart : cartList) {
                            if (cart.getCustomerId() == customer.getCustomerId()) {
                                for (Products product : prodList) {
                                    if (product.getProductCode() == cart.getProductCode()) {
                                        slno++;
                                        int discountAmount = (int) (product.getDiscount() / 100.0 * product.getCost());
                                        int finalCost = product.getCost() - discountAmount;
                                        totalProductsCost += product.getCost();
                                        totalDiscountAmount += discountAmount;
                                        payableAmount += finalCost;
                        %>

                        <div class="cart-card d-flex flex-column flex-md-row align-items-center mx-auto">
                            <div class="product-image-container me-3" style="flex: 0 0 180px;">
                                <img src="/uploads/<%=product.getProductImage1()%>"
                                    class="img-fluid rounded"
                                    style="max-height: 160px; object-fit: cover; width: 100%;">
                            </div>
                            <div class="flex-grow-1">
                                <h5 class="product-title"><%=product.getProductName()%></h5>
                                <p class="product-description"><%=product.getDescription()%></p>
                                
                                <div class="quantity-control">
                                    <span class="quantity-label">Quantity:</span>
                                    <div class="quantity-input">
                                        <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown(); changeQuantity(<%=totalCartItems%>, <%=slno%>, <%=product.getCost()%>, <%=discountAmount%>)">-</button>
                                        <input type="number" value="1" id="qty<%=slno%>" name="qty<%=slno%>"
                                            onChange="changeQuantity(<%=totalCartItems%>, <%=slno%>, <%=product.getCost()%>, <%=discountAmount%>)"
                                            min="1" max="10">
                                        <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp(); changeQuantity(<%=totalCartItems%>, <%=slno%>, <%=product.getCost()%>, <%=discountAmount%>)">+</button>
                                    </div>
                                </div>
                                
                                <div class="price-display">
                                    <span class="current-price">₹<span id="finalCost<%=slno%>"><%=finalCost%></span></span>
                                    <span class="original-price">₹<span id="productCost<%=slno%>"><%=product.getCost()%></span></span>
                                    <span class="discount-badge"><span id="discount<%=slno%>"><%=product.getDiscount()%></span>% OFF</span>
                                </div>
                                
                                <p class="date-added">Added on: <%=cart.getSelectedDate()%></p>
                                
                                <a href="/EcommerceWebsite/DeleteFromCartServlet?cartId=<%=cart.getCartId()%>"
                                    class="btn btn-danger btn-sm remove-btn">Remove</a>
                            </div>
                        </div>

                        <%
                                    }
                                }
                            }
                        }
                        %>
                        <input type="submit" class="btn checkout-btn proceed"
                            value="PROCEED TO CHECKOUT" />
                    </div>
                </form>
            </div>
            
            <div class="col-md-3">
                <div class="pricebar mx-auto">
                    <h1>Price Summary</h1>
                    <div class="price-details">
                        <div class="price-item">
                            <span class="price-label">Price (<%=slno%> items)</span> 
                            <span class="price-value" id="totalPrice">₹<span id="totalProductsCost"><%=totalProductsCost%></span></span>
                        </div>
                        <div class="price-item">
                            <span class="price-label">Discount</span> 
                            <span class="price-value text-success" id="totalDiscount">-₹<span id="totalDiscountAmount"><%=totalDiscountAmount%></span></span>
                        </div>
                        <div class="price-item">
                            <span class="price-label">Delivery Charges</span> 
                            <span class="price-value"><del>₹40</del> Free</span>
                        </div>
                    </div>
                    <div class="total-amount d-flex justify-content-between align-items-center">
                        <span class="total-label">Total Amount</span> 
                        <span class="total-value" id="payableAmount">₹<%=payableAmount%></span>
                    </div>
                    <div class="text-success">
                        You will save ₹<span id="totalDiscountAmount2"><%=totalDiscountAmount + 40%></span>
                        on this order.
                    </div>
                    <div class="mt-3 text-center">
                        <small class="text-muted">Free delivery on orders above ₹500</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../home/Footer.jsp"></jsp:include>

    <%
    if (request.getParameter("res") != null) {
        int res = Integer.parseInt(request.getParameter("res"));
        if (res == 1) {
    %>
    <div class="alert alert-success alert-dismissible position-fixed top-0 end-0 m-3"
        style="width: 400px; z-index: 9999;">
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Success!</strong> Cart Item was deleted.
    </div>
    <%
    } else if (res == 0) {
    %>
    <div class="alert alert-danger alert-dismissible position-fixed top-0 end-0 m-3"
        style="width: 400px; z-index: 9999;">
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Failed!</strong> Cart Item not deleted.
    </div>
    <%
        }
    }
    %>
</body>
</html>