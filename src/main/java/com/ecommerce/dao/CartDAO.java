package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ecommerce.dbutil.DBConnection;
import com.ecommerce.model.Cart;

public class CartDAO {
	
	// adds cart record to cart table
	public int addCartItem(Cart cart) {
		// DB Logic to add record into MySQL
		int n = 0;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return n;
			}

			// step3
			String insertQuery = "insert into cart(cartId, productCode, selectedDate, customerId) values(?, ?, ?, ?)";
			PreparedStatement pst = conn.prepareStatement(insertQuery);

			pst.setInt(1, cart.getCartId());
			pst.setInt(2, cart.getProductCode());
			pst.setString(3, cart.getSelectedDate());
			pst.setInt(4, cart.getCustomerId());

			System.out.println("Insert Query: " + pst.toString());
			n = pst.executeUpdate();

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}

		return n;
	}

	// gets all cart items for a specific customer
	public ArrayList<Cart> getAllCartItems() {
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return cartList;
			}

			// step3
			String selectQuery = "select cartId, productCode, selectedDate, customerId from cart";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Cart cart = new Cart();
				cart.setCartId(rs.getInt("cartId"));
				cart.setProductCode(rs.getInt("productCode"));
				cart.setSelectedDate(rs.getString("selectedDate"));
				cart.setCustomerId(rs.getInt("customerId"));
				cartList.add(cart);
			}

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}

		return cartList;
	}

	// get cart item by cartId
	public Cart getCartItemByCartId(int cartId) {
		Cart cart = null;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return cart;
			}

			// step3
			String selectQuery = "select cartId, productCode, selectedDate, customerId from cart where cartId=?";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			pst.setInt(1, cartId);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				cart = new Cart();
				cart.setCartId(rs.getInt("cartId"));
				cart.setProductCode(rs.getInt("productCode"));
				cart.setSelectedDate(rs.getString("selectedDate"));
				cart.setCustomerId(rs.getInt("customerId"));
			}

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}

		return cart;
	}

	// delete cart item by cartId
	public boolean deleteCartItemByCartId(int cartId) {
		boolean flag = false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return false;
			}

			// step3
			String deleteQuery = "delete from cart where cartId=?";
			PreparedStatement pst = conn.prepareStatement(deleteQuery);

			pst.setInt(1, cartId);

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

	// delete all cart items by customerId
	public boolean clearCartByCustomerId(int customerId) {
		boolean flag = false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return false;
			}

			// step3
			String deleteQuery = "delete from cart where customerId=?";
			PreparedStatement pst = conn.prepareStatement(deleteQuery);

			pst.setInt(1, customerId);

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
}
