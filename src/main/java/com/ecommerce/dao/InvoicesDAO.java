package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.Invoices;

public class InvoicesDAO {

    // Add a new invoice
    public int addInvoice(Invoices invoice) {
        int n = 0;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError");
                return n;
            }

            String query = "INSERT INTO invoices (invoiceNumber, orderId, invoiceAmount, invoiceDate, invoiceType, cardNumber, cardType, paymentStatus) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(query);

            pst.setLong(1, invoice.getInvoiceNumber());
            pst.setLong(2, invoice.getOrderId());
            pst.setInt(3, invoice.getInvoiceAmount());
            pst.setString(4, invoice.getInvoiceDate());
            pst.setString(5, invoice.getInvoiceType());
            pst.setString(6, invoice.getCardNumber());
            pst.setString(7, invoice.getCardType());
            pst.setString(8, invoice.getPaymentStatus());

            n = pst.executeUpdate();

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error in addInvoice: " + e);
        }
        return n;
    }

    // Get all invoices
    public ArrayList<Invoices> getAllInvoices() {
        ArrayList<Invoices> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String query = "SELECT * FROM invoices";
            PreparedStatement pst = conn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Invoices inv = new Invoices();
                inv.setInvoiceNumber(rs.getLong("invoiceNumber"));
                inv.setOrderId(rs.getLong("orderId"));
                inv.setInvoiceAmount(rs.getInt("invoiceAmount"));
                inv.setInvoiceDate(rs.getString("invoiceDate"));
                inv.setInvoiceType(rs.getString("invoiceType"));
                inv.setCardNumber(rs.getString("cardNumber"));
                inv.setCardType(rs.getString("cardType"));
                inv.setPaymentStatus(rs.getString("paymentStatus"));

                list.add(inv);
            }

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error in getAllInvoices: " + e);
        }
        return list;
    }

    // Get invoice by invoice number
    public Invoices getInvoiceByNumber(long invoiceNumber) {
        Invoices inv = null;
        try {
            Connection conn = DBConnection.getConnection();
            String query = "SELECT * FROM invoices WHERE invoiceNumber = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setLong(1, invoiceNumber);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                inv = new Invoices();
                inv.setInvoiceNumber(rs.getLong("invoiceNumber"));
                inv.setOrderId(rs.getLong("orderId"));
                inv.setInvoiceAmount(rs.getInt("invoiceAmount"));
                inv.setInvoiceDate(rs.getString("invoiceDate"));
                inv.setInvoiceType(rs.getString("invoiceType"));
                inv.setCardNumber(rs.getString("cardNumber"));
                inv.setCardType(rs.getString("cardType"));
                inv.setPaymentStatus(rs.getString("paymentStatus"));
            }

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error in getInvoiceByNumber: " + e);
        }
        return inv;
    }

    // Delete invoice
    public boolean deleteInvoice(long invoiceNumber) {
        boolean deleted = false;
        try {
            Connection conn = DBConnection.getConnection();
            String query = "DELETE FROM invoices WHERE invoiceNumber = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setLong(1, invoiceNumber);
            int rows = pst.executeUpdate();
            deleted = (rows > 0);
            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error in deleteInvoice: " + e);
        }
        return deleted;
    }

    // Update payment status
    public int updatePaymentStatus(long invoiceNumber, String status) {
        int n = 0;
        try {
            Connection conn = DBConnection.getConnection();
            String query = "UPDATE invoices SET paymentStatus = ? WHERE invoiceNumber = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, status);
            pst.setLong(2, invoiceNumber);
            n = pst.executeUpdate();
            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error in updatePaymentStatus: " + e);
        }
        return n;
    }
}
