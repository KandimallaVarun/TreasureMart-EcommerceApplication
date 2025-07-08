package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.Employees;

public class EmployeeDAO {
	
	public Employees loginValidate(Employees employees) {

		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return null;
			}

			// Step3
			String selectQuery = "select * from employees where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			pst.setString(1, employees.getEmail());
			pst.setString(2, employees.getPassword());

			ResultSet rs = pst.executeQuery();

			if (rs.next()) { // user found
				int employeeId = rs.getInt("employeeId");
				EmployeeDAO dao = new EmployeeDAO();
				Employees new_employee = dao.getEmployeeByEmployeeId(employeeId);
				return new_employee;

			}

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}
		return null;
	}

    // Add employee record to employees table
    public int addEmployee(Employees emp) {
        int n = 0;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return n;
            }

            String insertQuery = "insert into employees(firstName, lastName, gender, mobile, email, designation, salary, password, employeePic) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(insertQuery);

            pst.setString(1, emp.getFirstName());
            pst.setString(2, emp.getLastName());
            pst.setString(3, emp.getGender());
            pst.setString(4, emp.getMobile());
            pst.setString(5, emp.getEmail());
            pst.setString(6, emp.getDesignation());
            pst.setInt(7, emp.getSalary());
            pst.setString(8, emp.getPassword());
            pst.setString(9, emp.getEmployeePic());

            System.out.println("Insert Query: " + pst.toString());
            n = pst.executeUpdate();

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return n;
    }

    // Get all employees
    public ArrayList<Employees> getAllEmployees() {
        ArrayList<Employees> empList = new ArrayList<Employees>();
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return empList;
            }

            String selectQuery = "select employeeId, firstName, lastName, gender, mobile, email, designation, salary, password, employeePic from employees";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Employees emp = new Employees();
                emp.setEmployeeId(rs.getInt("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setGender(rs.getString("gender"));
                emp.setMobile(rs.getString("mobile"));
                emp.setEmail(rs.getString("email"));
                emp.setDesignation(rs.getString("designation"));
                emp.setSalary(rs.getInt("salary"));
                emp.setPassword(rs.getString("password"));
                emp.setEmployeePic(rs.getString("employeePic"));

                empList.add(emp);
            }

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return empList;
    }

    // Get employee by employeeId
    public Employees getEmployeeByEmployeeId(int employeeId) {
        Employees emp = null;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return emp;
            }

            String selectQuery = "select employeeId, firstName, lastName, gender, mobile, email, designation, salary, password, employeePic from employees where employeeId = ?";
            PreparedStatement pst = conn.prepareStatement(selectQuery);
            pst.setInt(1, employeeId);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                emp = new Employees();
                emp.setEmployeeId(rs.getInt("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setGender(rs.getString("gender"));
                emp.setMobile(rs.getString("mobile"));
                emp.setEmail(rs.getString("email"));
                emp.setDesignation(rs.getString("designation"));
                emp.setSalary(rs.getInt("salary"));
                emp.setPassword(rs.getString("password"));
                emp.setEmployeePic(rs.getString("employeePic"));
            }

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return emp;
    }

    // Delete employee by employeeId
    public boolean deleteEmployeeByEmployeeId(int employeeId) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return false;
            }

            String deleteQuery = "delete from employees where employeeId=?";
            PreparedStatement pst = conn.prepareStatement(deleteQuery);
            pst.setInt(1, employeeId);

            System.out.println("Delete Query: " + pst.toString());
            int n = pst.executeUpdate();
            flag = n != 0;

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return flag;
    }

    // Update employee by employeeId
    public boolean updateEmployeeByEmployeeId(int employeeId, Employees emp) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return flag;
            }

            String updateQuery = "update employees set employeeId = ?, firstName = ?, lastName = ?, gender = ?, mobile = ?, email = ?, designation = ?, salary = ?, password = ? where employeeId = ?";
            PreparedStatement pst = conn.prepareStatement(updateQuery);

            pst.setInt(1, emp.getEmployeeId());
            pst.setString(2, emp.getFirstName());
            pst.setString(3, emp.getLastName());
            pst.setString(4, emp.getGender());
            pst.setString(5, emp.getMobile());
            pst.setString(6, emp.getEmail());
            pst.setString(7, emp.getDesignation());
            pst.setInt(8, emp.getSalary());
            pst.setString(9, emp.getPassword());
            pst.setInt(10, employeeId);

            System.out.println("Update Query: " + pst.toString());
            int n = pst.executeUpdate();
            flag = n != 0;

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return flag;
    }

    // Update employee picture by employeeId
    public boolean updateEmployeePicByEmployeeId(int employeeId, String employeePic) {
        boolean flag = false;
        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("DBError: ");
                return flag;
            }

            String updateQuery = "update employees set employeepic = ? where employeeId = ?";
            PreparedStatement pst = conn.prepareStatement(updateQuery);
            pst.setString(1, employeePic);
            pst.setInt(2, employeeId);

            System.out.println("Update Query: " + pst.toString());
            int n = pst.executeUpdate();
            flag = n != 0;

            pst.close();
            conn.close();

        } catch (Exception ee) {
            System.out.println("Error: " + ee);
        }
        return flag;
    }
}
