package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.BankTransaction;

public class BankTransactionDAO {

    // Add a new transaction
    public int addTransaction(BankTransaction transaction) {
        int n = 0;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError");
                return n;
            }

            String insertQuery = "INSERT INTO bank_transactions (transactionId, amount, fromAccount, toAccount, transactionDate) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(insertQuery);

            pst.setInt(1, transaction.getTransactionId());
            pst.setInt(2, transaction.getAmount());
            pst.setInt(3, transaction.getFromAccount());
            pst.setInt(4, transaction.getToAccount());
            pst.setString(5, transaction.getTransactionDate());

            System.out.println("Insert Query: " + pst.toString());
            n = pst.executeUpdate();

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return n;
    }

    // Get all transactions
    public ArrayList<BankTransaction> getAllTransactions() {
        ArrayList<BankTransaction> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError");
                return list;
            }

            String selectQuery = "SELECT * FROM bank_transactions";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                BankTransaction tx = new BankTransaction();
                tx.setTransactionId(rs.getInt("transactionId"));
                tx.setAmount(rs.getInt("amount"));
                tx.setFromAccount(rs.getInt("fromAccount"));
                tx.setToAccount(rs.getInt("toAccount"));
                tx.setTransactionDate(rs.getString("transactionDate"));

                list.add(tx);
            }

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }

    // Get transaction by ID
    public BankTransaction getTransactionById(int transactionId) {
        BankTransaction tx = null;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError");
                return null;
            }

            String selectQuery = "SELECT * FROM bank_transactions WHERE transactionId = ?";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            pst.setInt(1, transactionId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                tx = new BankTransaction();
                tx.setTransactionId(rs.getInt("transactionId"));
                tx.setAmount(rs.getInt("amount"));
                tx.setFromAccount(rs.getInt("fromAccount"));
                tx.setToAccount(rs.getInt("toAccount"));
                tx.setTransactionDate(rs.getString("transactionDate"));
            }

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return tx;
    }

    // Get all transactions for a given account number
    public ArrayList<BankTransaction> getTransactionsByAccount(int accountNumber) {
        ArrayList<BankTransaction> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError");
                return list;
            }

            String selectQuery = "SELECT * FROM bank_transactions WHERE fromAccount = ? OR toAccount = ?";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            pst.setInt(1, accountNumber);
            pst.setInt(2, accountNumber);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                BankTransaction tx = new BankTransaction();
                tx.setTransactionId(rs.getInt("transactionId"));
                tx.setAmount(rs.getInt("amount"));
                tx.setFromAccount(rs.getInt("fromAccount"));
                tx.setToAccount(rs.getInt("toAccount"));
                tx.setTransactionDate(rs.getString("transactionDate"));
                list.add(tx);
            }

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }

    // Delete transaction by ID (optional)
    public boolean deleteTransaction(int transactionId) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError");
                return false;
            }

            String deleteQuery = "DELETE FROM bank_transactions WHERE transactionId = ?";
            PreparedStatement pst = conn.prepareStatement(deleteQuery);
            pst.setInt(1, transactionId);

            System.out.println("Delete Query: " + pst.toString());
            int n = pst.executeUpdate();
            flag = (n > 0);

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return flag;
    }
}
