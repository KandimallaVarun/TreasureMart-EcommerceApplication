package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.Customers;

public class CustomerDAO {

	public Customers loginValidate(Customers customers) {

		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return null;
			}

			// Step3
			String selectQuery = "select * from customers where emailId=? and password=?";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			pst.setString(1, customers.getEmailId());
			pst.setString(2, customers.getPassword());

			ResultSet rs = pst.executeQuery();

			if (rs.next()) { // user found
				int customerId = rs.getInt("customerId");
				CustomerDAO dao = new CustomerDAO();
				Customers new_customer = dao.getCustomersByCustomerId(customerId);
				return new_customer;

			}

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}

		return null;
	}

	// adds employee record to employee table
	public int addCustomer(Customers customers) {
		// DB Logic to add record into mysql
		int n = 0;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return n;
			}

			// Step3
			String inserQuery = "insert into customers(firstName, lastName, mobileNumber, emailId, password, profilePic, registerDate) values(?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(inserQuery);

			pst.setString(1, customers.getFirstName());
			pst.setString(2, customers.getLastName());
			pst.setString(3, customers.getMobileNumber());
			pst.setString(4, customers.getEmailId());
			pst.setString(5, customers.getPassword());
			pst.setString(6, customers.getProfilePic());
			pst.setString(7, customers.getRegisterDate());

			System.out.println("Insert Query:" + pst.toString());
			n = pst.executeUpdate();

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}

		return n;
	}

	// gets all employees data
	public ArrayList<Customers> getAllCustomers() {
		ArrayList<Customers> custList = new ArrayList<Customers>();
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return custList;
			}

			// Step3
			String selectQuery = "select customerId, firstName, lastName, mobileNumber, emailId, password, profilePic, registerDate from customers";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Customers customers = new Customers();
				customers.setCustomerId(rs.getInt("customerId"));
				customers.setFirstName(rs.getString("firstName"));
				customers.setLastName(rs.getString("lastName"));
				customers.setMobileNumber(rs.getString("mobileNumber"));
				customers.setEmailId(rs.getString("emailId"));
				customers.setPassword(rs.getString("password"));
				customers.setProfilePic(rs.getString("profilePic"));
				customers.setRegisterDate(rs.getString("registerDate"));
				// product object added to list
				custList.add(customers);

			}

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}

		return custList;
	}

	// get employee by empno
	public Customers getCustomersByCustomerId(int customerId) {
		Customers customers = null;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return customers;
			}

			// Step3
			String selectQuery = "select customerId, firstName, lastName, mobileNumber, emailId, password, profilePic, registerDate from customers where customerId = ?";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			pst.setInt(1, customerId);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				customers = new Customers();
				customers.setCustomerId(rs.getInt("customerId"));
				customers.setFirstName(rs.getString("firstName"));
				customers.setLastName(rs.getString("lastName"));
				customers.setMobileNumber(rs.getString("mobileNumber"));
				customers.setEmailId(rs.getString("emailId"));
				customers.setPassword(rs.getString("password"));
				customers.setProfilePic(rs.getString("profilePic"));
				customers.setRegisterDate(rs.getString("registerDate"));
			}

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}

		return customers;
	}

	public boolean deleteCustomerByCustomerId(int customerId) {
		boolean flag = false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return false;
			}

			// Step3
			String deleteQuery = "delete from customers where customerId=?";
			PreparedStatement pst = conn.prepareStatement(deleteQuery);

			pst.setInt(1, customerId);

			System.out.println("Delete Query:" + pst.toString());
			int n = pst.executeUpdate();
			if (n == 0) {
				flag = false;
			} else {
				flag = true;
			}

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}

		return flag;
	}

	public boolean updateCustomerByCustomerId(int customerId, Customers customers) {
		boolean flag = false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return flag;
			}

			// Step3
			String updateQuery = "update customers set customerId = ?, firstName = ?, lastName = ?, mobileNumber = ?, emailId = ?, password = ?, registerDate = ? where customerId = ?";
			PreparedStatement pst = conn.prepareStatement(updateQuery);

			pst.setInt(1, customers.getCustomerId());
			pst.setString(2, customers.getFirstName());
			pst.setString(3, customers.getLastName());
			pst.setString(4, customers.getMobileNumber());
			pst.setString(5, customers.getEmailId());
			pst.setString(6, customers.getPassword());
			pst.setString(7, customers.getRegisterDate());
			pst.setInt(8, customers.getCustomerId());

			System.out.println("Update Query:" + pst.toString());
			int n = pst.executeUpdate();
			if (n == 0) {
				flag = false;
			} else {
				flag = true;
			}

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}

		return flag;
	}

	public boolean updateCustomerPicByCustomerId(int customerId, String customerPic) {
		boolean flag = false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return flag;
			}

			// Step3
			String updateQuery = "update customers set profilePic=? where customerId=?";
			PreparedStatement pst = conn.prepareStatement(updateQuery);

			pst.setString(1, customerPic);
			pst.setInt(2, customerId);

			System.out.println("Update Query:" + pst.toString());
			int n = pst.executeUpdate();
			if (n == 0) {
				flag = false;
			} else {
				flag = true;
			}

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}

		return flag;
	}
}
