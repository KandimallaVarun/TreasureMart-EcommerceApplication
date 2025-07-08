package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.Shipping;

public class ShippingDAO {

    // Add Shipping Details
    public int addShipping(Shipping shipping) {
        int n = 0;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return n;
            }

            String insertQuery = "INSERT INTO shipment (invoiceNumber, customerId, deliveryAddress, mobileNumber, zipCode) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(insertQuery);

            pst.setLong(1, shipping.getInvoiceNumber());
            pst.setInt(2, shipping.getCustomerId());
            pst.setString(3, shipping.getDeliveryAddress());
            pst.setString(4, shipping.getMobileNumber());
            pst.setString(5, shipping.getZipCode());

            System.out.println("Insert Query: " + pst.toString());
            n = pst.executeUpdate();

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return n;
    }

    // Get all shipping records
    public ArrayList<Shipping> getAllShipping() {
        ArrayList<Shipping> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return list;
            }

            String selectQuery = "SELECT * FROM shipment";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Shipping shipping = new Shipping();
                shipping.setShipmentId(rs.getInt("shipmentId"));
                shipping.setInvoiceNumber(rs.getLong("invoiceNumber"));
                shipping.setCustomerId(rs.getInt("customerId"));
                shipping.setDeliveryAddress(rs.getString("deliveryAddress"));
                shipping.setMobileNumber(rs.getString("mobileNumber"));
                shipping.setZipCode(rs.getString("zipCode"));

                list.add(shipping);
            }

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return list;
    }

    // Delete shipping by shipmentId
    public boolean deleteShippingById(int shipmentId) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return flag;
            }

            String deleteQuery = "DELETE FROM shipment WHERE shipmentId = ?";
            PreparedStatement pst = conn.prepareStatement(deleteQuery);
            pst.setInt(1, shipmentId);

            System.out.println("Delete Query: " + pst.toString());
            int n = pst.executeUpdate();
            flag = (n > 0);

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return flag;
    }

    // Update shipping by shipmentId
    public boolean updateShippingById(int shipmentId, Shipping shipping) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return flag;
            }

            String updateQuery = "UPDATE shipment SET invoiceNumber = ?, customerId = ?, deliveryAddress = ?, mobileNumber = ?, zipCode = ? WHERE shipmentId = ?";
            PreparedStatement pst = conn.prepareStatement(updateQuery);

            pst.setLong(1, shipping.getInvoiceNumber());
            pst.setInt(2, shipping.getCustomerId());
            pst.setString(3, shipping.getDeliveryAddress());
            pst.setString(4, shipping.getMobileNumber());
            pst.setString(5, shipping.getZipCode());
            pst.setInt(6, shipmentId);

            System.out.println("Update Query: " + pst.toString());
            int n = pst.executeUpdate();
            flag = (n > 0);

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return flag;
    }

    // Get shipping by shipmentId
    public Shipping getShippingById(int shipmentId) {
        Shipping shipping = null;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return shipping;
            }

            String selectQuery = "SELECT * FROM shipment WHERE shipmentId = ?";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            pst.setInt(1, shipmentId);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                shipping = new Shipping();
                shipping.setShipmentId(rs.getInt("shipmentId"));
                shipping.setInvoiceNumber(rs.getLong("invoiceNumber"));
                shipping.setCustomerId(rs.getInt("customerId"));
                shipping.setDeliveryAddress(rs.getString("deliveryAddress"));
                shipping.setMobileNumber(rs.getString("mobileNumber"));
                shipping.setZipCode(rs.getString("zipCode"));
            }

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return shipping;
    }
}
