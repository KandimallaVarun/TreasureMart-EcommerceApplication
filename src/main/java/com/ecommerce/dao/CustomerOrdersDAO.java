package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.CustomerOrders;

public class CustomerOrdersDAO {

    // Add a new customer order (excluding auto-increment orderId)
    public int addOrder(CustomerOrders order) {
        int n = 0;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return n;
            }

            String insertQuery =
                "INSERT INTO customerorders "
              + "(orderNumber, customerId, invoiceNumber, productCode, "
              + "orderDateTime, cost, discountAmount, quantity, "
              + "gstAmount, billAmount, orderStatus) "
              + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(insertQuery);

            pst.setLong(1, order.getOrderNumber());
            pst.setInt (2, order.getCustomerId());
            pst.setLong(3, order.getInvoiceNumber());
            pst.setInt (4, order.getProductCode());
            pst.setString(5, order.getOrderDateTime());
            pst.setInt (6, order.getCost());
            pst.setInt (7, order.getDiscountAmount());
            pst.setInt (8, order.getQuantity());
            pst.setInt (9, order.getGstAmount());
            pst.setInt (10, order.getBillAmount());
            pst.setString(11, order.getOrderStatus());

            System.out.println("Insert Query: " + pst);
            n = pst.executeUpdate();

            pst.close();
            conn.close();
        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return n;
    }

    // Get all orders
    public ArrayList<CustomerOrders> getAllOrders() {
        ArrayList<CustomerOrders> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return list;
            }

            String selectQuery = "SELECT * FROM customerorders";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                CustomerOrders order = new CustomerOrders();
                order.setOrderId       (rs.getLong("orderId"));
                order.setOrderNumber   (rs.getLong("orderNumber"));
                order.setCustomerId    (rs.getInt("customerId"));
                order.setInvoiceNumber (rs.getLong("invoiceNumber"));
                order.setProductCode   (rs.getInt("productCode"));
                order.setOrderDateTime (rs.getString("orderDateTime"));
                order.setCost          (rs.getInt("cost"));
                order.setDiscountAmount(rs.getInt("discountAmount"));
                order.setQuantity      (rs.getInt("quantity"));
                order.setGstAmount     (rs.getInt("gstAmount"));
                order.setBillAmount    (rs.getInt("billAmount"));
                order.setOrderStatus   (rs.getString("orderStatus"));

                list.add(order);
            }

            pst.close();
            conn.close();
        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return list;
    }

    // Get orders by invoice number
    public ArrayList<CustomerOrders> getOrdersByInvoice(long invoiceNumber) {
        ArrayList<CustomerOrders> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return list;
            }

            String selectQuery = "SELECT * FROM customerorders WHERE invoiceNumber = ?";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            pst.setLong(1, invoiceNumber);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                CustomerOrders order = new CustomerOrders();
                order.setOrderId       (rs.getLong("orderId"));
                order.setOrderNumber   (rs.getLong("orderNumber"));
                order.setCustomerId    (rs.getInt("customerId"));
                order.setInvoiceNumber (rs.getLong("invoiceNumber"));
                order.setProductCode   (rs.getInt("productCode"));
                order.setOrderDateTime (rs.getString("orderDateTime"));
                order.setCost          (rs.getInt("cost"));
                order.setDiscountAmount(rs.getInt("discountAmount"));
                order.setQuantity      (rs.getInt("quantity"));
                order.setGstAmount     (rs.getInt("gstAmount"));
                order.setBillAmount    (rs.getInt("billAmount"));
                order.setOrderStatus   (rs.getString("orderStatus"));

                list.add(order);
            }

            pst.close();
            conn.close();
        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return list;
    }

    // Update order status by invoice number and product code
    public boolean updateOrderStatus(long invoiceNumber, int productCode, String newStatus) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return false;
            }

            String updateQuery =
                "UPDATE customerorders SET orderStatus = ? "
              + "WHERE invoiceNumber = ? AND productCode = ?";
            PreparedStatement pst = conn.prepareStatement(updateQuery);
            pst.setString(1, newStatus);
            pst.setLong  (2, invoiceNumber);
            pst.setInt   (3, productCode);

            System.out.println("Update Query: " + pst);
            flag = pst.executeUpdate() > 0;

            pst.close();
            conn.close();
        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return flag;
    }

    // Delete order by invoice number and product code
    public boolean deleteOrder(long invoiceNumber, int productCode) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return false;
            }

            String deleteQuery =
                "DELETE FROM customerorders WHERE invoiceNumber = ? AND productCode = ?";
            PreparedStatement pst = conn.prepareStatement(deleteQuery);
            pst.setLong(1, invoiceNumber);
            pst.setInt (2, productCode);

            System.out.println("Delete Query: " + pst);
            flag = pst.executeUpdate() > 0;

            pst.close();
            conn.close();
        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return flag;
    }
}
