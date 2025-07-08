package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.Admin;

public class AdminDAO {
	public Admin loginValidate(Admin admin) {
		
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return null;
				}

			// Step3
			String selectQuery = "select * from admin where username=? and password=?";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			pst.setString(1, admin.getUsername());
			pst.setString(2, admin.getPassword());
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {  //user found
				
				return admin;
				
			}			
			
			pst.close();
			conn.close();
			
			
		}catch(Exception ee) {
			System.out.println("Error: " + ee);
		}
		
		return null;
	}
}
