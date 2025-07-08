<%@page import="com.ecommerce.model.Customers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ecommerce.model.Invoices"%>
<%@page import="com.ecommerce.dao.InvoicesDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
Customers customer = (Customers) session.getAttribute("customer");
if (customer == null) {
    response.sendRedirect("/EcommerceWebsite/view/home/CustomerLogin.jsp");
    return;
}

String invoiceNumberParam = request.getParameter("invoiceNumber");
if (invoiceNumberParam == null || invoiceNumberParam.isEmpty()) {
    out.println("<h3 style='color:red;'>Invoice Number Missing!</h3>");
    return;
}

long invoiceNumber;
try {
    invoiceNumber = Long.parseLong(invoiceNumberParam);
} catch (NumberFormatException e) {
    out.println("<h3 style='color:red;'>Invalid Invoice Number Format!</h3>");
    return;
}

InvoicesDAO invoiceDAO = new InvoicesDAO();
Invoices invoice = invoiceDAO.getInvoiceByNumber(invoiceNumber);

if (invoice == null) {
    out.println("<h3 style='color:red;'>Invoice not found!</h3>");
    return;
}

// Format date for display
String formattedDate = "";
try {
    Object dateObj = invoice.getInvoiceDate();
    if (dateObj instanceof Date) {
        SimpleDateFormat displayFormat = new SimpleDateFormat("MMM dd, yyyy");
        formattedDate = displayFormat.format((Date) dateObj);
    } else if (dateObj instanceof String) {
        // If it's stored as a string, try to parse it
        SimpleDateFormat dbFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = dbFormat.parse((String) dateObj);
        SimpleDateFormat displayFormat = new SimpleDateFormat("MMM dd, yyyy");
        formattedDate = displayFormat.format(date);
    } else {
        formattedDate = String.valueOf(dateObj); // fallback
    }
} catch (Exception e) {
    formattedDate = "Date not available";
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Invoice #<%=invoice.getInvoiceNumber() %> - E-Commerce Store</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4f46e5;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --text-color: #374151;
            --light-bg: #f9fafb;
            --border-color: #e5e7eb;
        }
        
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--light-bg);
            color: var(--text-color);
            line-height: 1.5;
            padding: 0;
            margin: 0;
        }
        
        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 0 20px;
        }
        
        .invoice-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            overflow: hidden;
        }
        
        .invoice-header {
            background-color: var(--primary-color);
            color: white;
            padding: 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .invoice-title {
            font-size: 24px;
            font-weight: 600;
            margin: 0;
        }
        
        .invoice-status {
            display: inline-flex;
            align-items: center;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
            background-color: rgba(255, 255, 255, 0.2);
        }
        
        .invoice-body {
            padding: 32px;
        }
        
        .invoice-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 24px;
            margin-bottom: 32px;
        }
        
        .info-section h3 {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 16px;
            color: var(--primary-color);
        }
        
        .info-item {
            margin-bottom: 12px;
        }
        
        .info-label {
            font-size: 14px;
            color: #6b7280;
            display: block;
            margin-bottom: 4px;
        }
        
        .info-value {
            font-weight: 500;
        }
        
        .invoice-amount {
            background-color: lightgrey;
            border-radius: 8px;
            padding: 24px;
            margin-top: 32px;
            text-align: center;
        }
        
        .amount-label {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 8px;
        }
        
        .amount-value {
            font-size: 32px;
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 32px;
        }
        
        .btn {
            padding: 10px 16px;
            border-radius: 6px;
            font-weight: 500;
            font-size: 14px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
            border: none;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }
        
        .btn-outline {
            background-color: white;
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
        }
        
        .btn:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }
        
        .paid {
            color: var(--success-color);
        }
        
        .pending {
            color: var(--warning-color);
        }
        
        .failed {
            color: var(--danger-color);
        }
        
        .logo {
            font-size: 20px;
            font-weight: 700;
            color: white;
            margin-bottom: 24px;
        }
        
        @media (max-width: 640px) {
            .invoice-info {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="invoice-card">
            <div class="invoice-header">
                <div>
                    <div class="logo">TreasureMart</div>
                    <h1 class="invoice-title">Invoice #<%=invoice.getInvoiceNumber() %></h1>
                </div>
                <span class="invoice-status">
                    <i class="fas fa-circle <%= "success".equalsIgnoreCase(invoice.getPaymentStatus()) ? "paid" : 
                                          "pending".equalsIgnoreCase(invoice.getPaymentStatus()) ? "pending" : 
                                          "failed" %>" style="font-size: 10px; margin-right: 6px;"></i>
                    <%=invoice.getPaymentStatus() %>
                </span>
            </div>
            
            <div class="invoice-body">
                <div class="invoice-info">
                    <div class="info-section">
                        <h3>Invoice Details</h3>
                        <div class="info-item">
                            <span class="info-label">Invoice Date</span>
                            <span class="info-value"><%=formattedDate %></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Invoice Type</span>
                            <span class="info-value"><%=invoice.getInvoiceType() %></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Payment Status</span>
                            <span class="info-value <%=invoice.getPaymentStatus().toLowerCase() %>">
                                <%=invoice.getPaymentStatus() %>
                            </span>
                        </div>
                    </div>
                    
                    <div class="info-section">
                        <h3>Payment Method</h3>
                        <div class="info-item">
                            <span class="info-label">Card Type</span>
                            <span class="info-value"><%=invoice.getCardType() %></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Card Number</span>
                            <span class="info-value">•••• •••• •••• <%=invoice.getCardNumber() != null && invoice.getCardNumber().length() > 4 ? 
                                invoice.getCardNumber().substring(invoice.getCardNumber().length() - 4) : "" %></span>
                        </div>
                    </div>
                </div>
                
                <div class="invoice-amount">
                    <div class="amount-label">Total Amount</div>
                    <div class="amount-value">₹ <%=invoice.getInvoiceAmount()%></div>
                </div>
                
                <div class="action-buttons">
                    <button class="btn btn-outline" onclick="window.print()">
                        <i class="fas fa-print"></i> Print Invoice
                    </button>
                    <button class="btn btn-primary" onclick="generatePDF()">
                        <i class="fas fa-download"></i> Download PDF
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- PDF Generation Script -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <script>
        function generatePDF() {
            const element = document.querySelector('.invoice-card');
            const opt = {
                margin: 10,
                filename: 'invoice_<%=invoice.getInvoiceNumber() %>.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
            };
            
            // Show loading state
            const btn = document.querySelector('.btn-primary');
            const originalHtml = btn.innerHTML;
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Generating PDF...';
            btn.disabled = true;
            
            // Generate PDF
            html2pdf().from(element).set(opt).save().then(() => {
                // Restore button state
                btn.innerHTML = originalHtml;
                btn.disabled = false;
            });
        }
    </script>
</body>
</html>