package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.Products;

public class ProductDAO {
	// adds employee record to employee table
	public int addProduct(Products products) {
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
			String inserQuery = "insert into products(categoryName, productName, description, discount, cost, productImage1, productImage2, productImage3) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(inserQuery);
			
			pst.setString(1, products.getCategoryName());
			pst.setString(2, products.getProductName());
			pst.setString(3, products.getDescription());
			pst.setInt(4, products.getDiscount());
			pst.setInt(5, products.getCost());
			pst.setString(6, products.getProductImage1());
			pst.setString(7, products.getProductImage2());
			pst.setString(8, products.getProductImage3());
			
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
	public ArrayList<Products> getAllProducts() {
		ArrayList<Products> prodList = new ArrayList<Products>(); 
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return prodList;
				}

			// Step3
			String selectQuery = "select productCode, categoryName, productName, description, discount, cost, productImage1, productImage2, productImage3 from products";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				Products products = new Products();
				products.setProductCode(rs.getInt("productCode"));
				products.setCategoryName(rs.getString("categoryName"));
				products.setProductName(rs.getString("productName"));
				products.setDescription(rs.getString("description"));
				products.setDiscount(rs.getInt("discount"));
				products.setCost(rs.getInt("cost"));
				products.setProductImage1(rs.getString("productImage1"));
				products.setProductImage2(rs.getString("productImage2"));
				products.setProductImage3(rs.getString("productImage3"));
				// product object added to list
				prodList.add(products);
				
			}
			
			
			pst.close();
			conn.close();
			
			
		}catch(Exception ee) {
			System.out.println("Error: " + ee);
		}
		
		return prodList;
	}
	
	
	
	// get employee by empno
	public Products getProductByProductCode(int productCode) {
		Products products = null;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return products;
				}

			// Step3
			String selectQuery = "select productCode, categoryName, productName, description, discount, cost, productImage1, productImage2, productImage3 from products where productCode = ?";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			pst.setInt(1, productCode);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				products = new Products();
				products.setProductCode(rs.getInt("productCode"));
				products.setCategoryName(rs.getString("categoryName"));
				products.setProductName(rs.getString("productName"));
				products.setDescription(rs.getString("description"));
				products.setDiscount(rs.getInt("discount"));
				products.setCost(rs.getInt("cost"));
				products.setProductImage1(rs.getString("productImage1"));
				products.setProductImage2(rs.getString("productImage2"));
				products.setProductImage3(rs.getString("productImage3"));
			}
			
			
			pst.close();
			conn.close();
			
			
		}catch(Exception ee) {
			System.out.println("Error: " + ee);
		}
		
		return products;
	}
	
	
	
	public boolean deleteProductByProductCode(int productCode) {
		boolean flag = false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return false;
				}

			// Step3
			String deleteQuery = "delete from products where productCode=?";
			PreparedStatement pst = conn.prepareStatement(deleteQuery);
			
			pst.setInt(1, productCode);
			
			
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
	
	
	
	public boolean updateProductByProductCode(int productCode, Products products) {
		boolean flag = false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return flag;
				}

			// Step3
			String updateQuery = "update products set productCode = ?, categoryName = ?, productName = ?, description = ?, discount = ?, cost = ? where productCode = ?";
			PreparedStatement pst = conn.prepareStatement(updateQuery);
			
			pst.setInt(1, products.getProductCode());
			pst.setString(2, products.getCategoryName());
			pst.setString(3, products.getProductName());
			pst.setString(4, products.getDescription());
			pst.setInt(5, products.getDiscount());
			pst.setInt(6, products.getCost());
			pst.setInt(7, productCode);
			
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
	
	public boolean updateProductPicByProductCode(int productCode, String productImage, String productImageName) {
		boolean flag = false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return flag;
				}

			// Step3
			String updateQuery = "UPDATE products SET " + productImageName + " = ? WHERE productCode=?";

			
			PreparedStatement pst = conn.prepareStatement(updateQuery);
			
			pst.setString(1, productImage);
			pst.setInt(2, productCode);
			
			
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
