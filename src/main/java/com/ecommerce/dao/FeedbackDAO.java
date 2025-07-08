package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.Feedback;

public class FeedbackDAO {

    // Adds feedback record to feedback table
    public int addFeedback(Feedback feedback) {
        int n = 0;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return n;
            }

            String insertQuery = "insert into feedback(feedbackId, date, customerId, customerQueries, feedback) values(?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(insertQuery);

            pst.setInt(1, feedback.getFeedbackId());
            pst.setString(2, feedback.getDate());
            pst.setInt(3, feedback.getCustomerId());
            pst.setString(4, feedback.getCustomerQueries());
            pst.setString(5, feedback.getFeedback());

            System.out.println("Insert Query: " + pst.toString());
            n = pst.executeUpdate();

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }

        return n;
    }

    // Gets all feedback records
    public ArrayList<Feedback> getAllFeedbacks() {
        ArrayList<Feedback> feedbackList = new ArrayList<Feedback>();
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return feedbackList;
            }

            String selectQuery = "select feedbackId, date, customerId, customerQueries, feedback from feedback";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedbackId"));
                feedback.setDate(rs.getString("date"));
                feedback.setCustomerId(rs.getInt("customerId"));
                feedback.setCustomerQueries(rs.getString("customerQueries"));
                feedback.setFeedback(rs.getString("feedback"));
                feedbackList.add(feedback);
            }

            rs.close();
            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }

        return feedbackList;
    }

    // Gets feedback by feedbackId
    public Feedback getFeedbackByFeedbackId(int feedbackId) {
        Feedback feedback = null;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return feedback;
            }

            String selectQuery = "select feedbackId, date, customerId, customerQueries, feedback from feedback where feedbackId = ?";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            pst.setInt(1, feedbackId);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedbackId"));
                feedback.setDate(rs.getString("date"));
                feedback.setCustomerId(rs.getInt("customerId"));
                feedback.setCustomerQueries(rs.getString("customerQueries"));
                feedback.setFeedback(rs.getString("feedback"));
            }

            rs.close();
            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }

        return feedback;
    }

    // Deletes feedback by feedbackId
    public boolean deleteFeedbackByFeedbackId(int feedbackId) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return flag;
            }

            String deleteQuery = "delete from feedback where feedbackId=?";
            PreparedStatement pst = conn.prepareStatement(deleteQuery);
            pst.setInt(1, feedbackId);

            System.out.println("Delete Query: " + pst.toString());
            int n = pst.executeUpdate();
            flag = (n != 0);

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }

        return flag;
    }

    // Updates feedback by feedbackId
    public boolean updateFeedbackByFeedbackId(int feedbackId, Feedback feedback) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return flag;
            }

            String updateQuery = "update feedback set date=?, customerId=?, customerQueries=?, feedback=? where feedbackId=?";
            PreparedStatement pst = conn.prepareStatement(updateQuery);

            pst.setString(1, feedback.getDate());
            pst.setInt(2, feedback.getCustomerId());
            pst.setString(3, feedback.getCustomerQueries());
            pst.setString(4, feedback.getFeedback());
            pst.setInt(5, feedbackId);

            System.out.println("Update Query: " + pst.toString());
            int n = pst.executeUpdate();
            flag = (n != 0);

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }

        return flag;
    }
}
