package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.Category;

public class CategoryDAO {
	// adds employee record to employee table
	public int addcategory(Category category) {
		// DB Logic to add record into mysql 
		int n = 0;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return n;
				}

			// Step3
			String inserQuery = "insert into category(categoryName, categoryImage) values(?,?)";
			PreparedStatement pst = conn.prepareStatement(inserQuery);
			
			pst.setString(1, category.getCategoryName());
			pst.setString(2, category.getCategoryImage());
			
			System.out.println("Insert Query:" + pst.toString());
			n = pst.executeUpdate();
			
			pst.close();
			conn.close();
			
			
		}catch(Exception ee) {
			System.out.println("Error: " + ee);
		}
		
		return n;
	}
	
	// gets all employees data
	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> catList = new ArrayList<Category>(); 
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return catList;
				}

			// Step3
			String selectQuery = "select categoryId, categoryName, categoryImage from category";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				Category category = new Category();
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getString("categoryName"));
				category.setCategoryImage(rs.getString("categoryImage"));
				// employee object added to list
				catList.add(category);
				
			}
			
			
			pst.close();
			conn.close();
			
			
		}catch(Exception ee) {
			System.out.println("Error: " + ee);
		}
		
		return catList;
	}
	
	
	
	// get employee by empno
	public Category getCategoryBycategoryId(int categoryId) {
		Category category = null;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return category;
				}

			// Step3
			String selectQuery = "select categoryId, categoryName, categoryImage from category where categoryId = ?";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			pst.setInt(1, categoryId);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				category = new Category();
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getString("categoryName"));
				category.setCategoryImage(rs.getString("categoryImage"));
			}
			
			
			pst.close();
			conn.close();
			
			
		}catch(Exception ee) {
			System.out.println("Error: " + ee);
		}
		
		return category;
	}
	
	
	
	public boolean deleteCategoryByCategoryId(int categoryId) {
		boolean flag = false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return false;
				}

			// Step3
			String deleteQuery = "delete from category where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(deleteQuery);
			
			pst.setInt(1, categoryId);
			
			
			System.out.println("Delete Query:" + pst.toString());
			int n = pst.executeUpdate();
			if(n==0) {
				flag = false;
			}else {
				flag = true;
			}
			
			pst.close();
			conn.close();
			
			
		}catch(Exception ee) {
			System.out.println("Error: " + ee);
		}
		
		return flag;
	}
	
	
	
	public boolean updatecategoryByCategoryId(int categoryId, Category category) {
		boolean flag = false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return flag;
				}

			// Step3
			String updateQuery = "update category set categoryId=?, categoryName=? where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(updateQuery);
			
			pst.setInt(1, category.getCategoryId());
			pst.setString(2, category.getCategoryName());
			pst.setInt(3, categoryId);
			
			System.out.println("Update Query:" + pst.toString());
			int n = pst.executeUpdate();
			if(n==0) {
				flag = false;
			}else {
				flag = true;
			}
			
			pst.close();
			conn.close();
			
			
		}catch(Exception ee) {
			System.out.println("Error: " + ee);
		}
		
		return flag;
	}
	
	public boolean updatecategoryImageByCategoryId(int categoryId, String categoryImage) {
		boolean flag = false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return flag;
				}

			// Step3
			String updateQuery = "update category set categoryImage=? where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(updateQuery);
			
			pst.setString(1, categoryImage);
			pst.setInt(2, categoryId);
			
			
			System.out.println("Update Query:" + pst.toString());
			int n = pst.executeUpdate();
			if(n==0) {
				flag = false;
			}else {
				flag = true;
			}
			
			pst.close();
			conn.close();
			
			
		}catch(Exception ee) {
			System.out.println("Error: " + ee);
		}
		
		return flag;
	}


}
