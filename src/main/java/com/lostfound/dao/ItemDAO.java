package com.lostfound.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lostfound.model.Item;
import com.lostfound.util.DBConnection;

public class ItemDAO {
	Connection con;
	public ItemDAO() {
		con=DBConnection.getConnection();
		
	}
	public void addItem(Item item) {
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO items(item_name,description,status,date)VALUES(?,?,?,?)");
			ps.setString(1, item.getItemName());
			ps.setString(2, item.getDescription());
			ps.setString(3, item.getStatus());
			ps.setDate(4,item.getDate());
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public List<Item> getAllItems(){
		List<Item>list=new ArrayList<>();
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("SELECT * From items");
			while(rs.next()) {
				Item item= new Item();
				item.setId(rs.getInt("id"));
				item.setItemName(rs.getString("item_name"));
				item.setDescription(rs.getString("description"));
				item.setStatus(rs.getString("status"));
				item.setDate(rs.getDate("date"));
				list.add(item);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void updateItem(Item item) {
		try {
		PreparedStatement ps=con.prepareStatement("update items SET item_name=?,description=?,status=?,date=? WHRE is=?");
		ps.setString(1, item.getItemName());
		ps.setString(2, item.getDescription());
		ps.setString(3, item.getStatus());
		ps.setDate(4,item.getDate());
		ps.executeUpdate();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
		}
	public void deleteItem(int id) {
		try {
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
