package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.BankAccount;

public class BankAccountDAO {

    // Add a new bank account
    public int addBankAccount(BankAccount account) {
        int n = 0;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return n;
            }

            String insertQuery = "INSERT INTO bankaccounts (accountNumber, accountDate, balanceAmount, cardNumber, cardType, contactAddress, customerName, cvvNumber, emailId, expiryDate, mobileNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(insertQuery);

            pst.setInt(1, account.getAccountNumber());
            pst.setString(2, account.getAccountDate());
            pst.setInt(3, account.getBalanceAmount());
            pst.setString(4, account.getCardNumber());
            pst.setString(5, account.getCardType());
            pst.setString(6, account.getContactAddress());
            pst.setString(7, account.getCustomerName());
            pst.setString(8, account.getCvvNumber());
            pst.setString(9, account.getEmailId());
            pst.setString(10, account.getExpiryDate());
            pst.setString(11, account.getMobileNumber());

            System.out.println("Insert Query: " + pst.toString());
            n = pst.executeUpdate();

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return n;
    }

    // Retrieve all bank accounts
    public ArrayList<BankAccount> getAllBankAccounts() {
        ArrayList<BankAccount> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return list;
            }

            String selectQuery = "SELECT * FROM bankaccounts";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                BankAccount account = new BankAccount();

                account.setAccountNumber(rs.getInt("accountNumber"));
                account.setAccountDate(rs.getString("accountDate"));
                account.setBalanceAmount(rs.getInt("balanceAmount"));
                account.setCardNumber(rs.getString("cardNumber"));
                account.setCardType(rs.getString("cardType"));
                account.setContactAddress(rs.getString("contactAddress"));
                account.setCustomerName(rs.getString("customerName"));
                account.setCvvNumber(rs.getString("cvvNumber"));
                account.setEmailId(rs.getString("emailId"));
                account.setExpiryDate(rs.getString("expiryDate"));
                account.setMobileNumber(rs.getString("mobileNumber"));

                list.add(account);
            }

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }

    // Get bank account by account number
    public BankAccount getAccountByNumber(int accountNumber) {
        BankAccount account = null;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return null;
            }

            String selectQuery = "SELECT * FROM bankaccounts WHERE accountNumber = ?";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            pst.setInt(1, accountNumber);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                account = new BankAccount();

                account.setAccountNumber(rs.getInt("accountNumber"));
                account.setAccountDate(rs.getString("accountDate"));
                account.setBalanceAmount(rs.getInt("balanceAmount"));
                account.setCardNumber(rs.getString("cardNumber"));
                account.setCardType(rs.getString("cardType"));
                account.setContactAddress(rs.getString("contactAddress"));
                account.setCustomerName(rs.getString("customerName"));
                account.setCvvNumber(rs.getString("cvvNumber"));
                account.setEmailId(rs.getString("emailId"));
                account.setExpiryDate(rs.getString("expiryDate"));
                account.setMobileNumber(rs.getString("mobileNumber"));
            }

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return account;
    }

    
    // Get balance based on cardType,cardNumber, cvv, expiryDate,
    public Integer getBalanceByAccount(String cardType,String cardNumber,String cvvNumber,String expiryDate) {
        BankAccount account = null;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return null;
            }

            String selectQuery = "SELECT * FROM bankaccounts WHERE cardType=? and cardNumber=? and cvvNumber=? and expiryDate=?";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            pst.setString(1, cardType);
            pst.setString(2, cardNumber);
            pst.setString(3, cvvNumber);
            pst.setString(4, expiryDate);
            
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                return new Integer(rs.getInt("balanceAmount"));
            }

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    
    // Get accountNumber based on cardNumber
    public Integer getAccountNumberByCardNumber(String cardNumber) {
        BankAccount account = null;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return null;
            }

            String selectQuery = "SELECT * FROM bankaccounts WHERE cardNumber = ?";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            pst.setString(1, cardNumber);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                return new Integer(rs.getInt("accountNumber"));
            }

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }


    
    
    // Update bank account details
    public boolean updateBankAccount(BankAccount account) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return false;
            }

            String updateQuery = "UPDATE bankaccounts SET accountDate=?, balanceAmount=?, cardNumber=?, cardType=?, contactAddress=?, customerName=?, cvvNumber=?, emailId=?, expiryDate=?, mobileNumber=? WHERE accountNumber=?";
            PreparedStatement pst = conn.prepareStatement(updateQuery);

            pst.setString(1, account.getAccountDate());
            pst.setInt(2, account.getBalanceAmount());
            pst.setString(3, account.getCardNumber());
            pst.setString(4, account.getCardType());
            pst.setString(5, account.getContactAddress());
            pst.setString(6, account.getCustomerName());
            pst.setString(7, account.getCvvNumber());
            pst.setString(8, account.getEmailId());
            pst.setString(9, account.getExpiryDate());
            pst.setString(10, account.getMobileNumber());
            pst.setInt(11, account.getAccountNumber());

            System.out.println("Update Query: " + pst.toString());
            int n = pst.executeUpdate();
            flag = (n > 0);

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return flag;
    }
    
 // Update account balance details
    public boolean updateBalanceByAccountNumber(int accountNumber, int amount, String tType) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return false;
            }
            String updateQuery="";
            if(tType.equals("D")) {
            	updateQuery = "UPDATE bankaccounts SET balanceAmount=balanceAmount+? where accountNumber=?";
            }else if(tType.equals("W")) {
            	updateQuery = "UPDATE bankaccounts SET balanceAmount=balanceAmount-? where accountNumber=?";
            }
            PreparedStatement pst = conn.prepareStatement(updateQuery);

           pst.setInt(1, amount);
           pst.setInt(2, accountNumber);
           
            System.out.println("Update Query: " + pst.toString());
            int n = pst.executeUpdate();
            flag = (n > 0);

            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return flag;
    }

    // Delete a bank account
    public boolean deleteBankAccount(int accountNumber) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return false;
            }

            String deleteQuery = "DELETE FROM bankaccounts WHERE accountNumber=?";
            PreparedStatement pst = conn.prepareStatement(deleteQuery);
            pst.setInt(1, accountNumber);

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
