package com.login.dao;

import java.sql.DriverManager;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	String url="jdbc:mysql://3.12.236.102:3306/benevolence";
	String username="aditya";
	String password="Password123$$";
	public boolean check(String uname,String pass){
		String sql="SELECT * FROM users WHERE username LIKE BINARY ? and pass LIKE BINARY ?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,uname);
			st.setString(2,pass);
			ResultSet rs=st.executeQuery();
			if (rs.next())
			{
				return true;
			}
			else
			{
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean check_user(String uname){
		String sql="SELECT * FROM users WHERE username LIKE BINARY ?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,uname);
			ResultSet rs=st.executeQuery();
			if (rs.next())
			{
				return true;
			}
			else
			{
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public void delete_user(String uname){
		String sql="DELETE FROM users WHERE username LIKE BINARY ?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,uname);
			st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void ban_user(String uname){
		String sql="DELETE FROM users WHERE username LIKE BINARY ?";
		String sql1="DELETE FROM offers WHERE username LIKE BINARY ?";
		String sql2="DELETE FROM demands WHERE username LIKE BINARY ?";
		String sql3="DELETE FROM demands WHERE itemID NOT IN (SELECT itemID FROM offers)";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			PreparedStatement st1=con.prepareStatement(sql1);
			PreparedStatement st2=con.prepareStatement(sql2);
			PreparedStatement st3=con.prepareStatement(sql3);
			st.setString(1,uname);
			st1.setString(1,uname);
			st2.setString(1,uname);
			st.executeUpdate();
			st1.executeUpdate();
			st2.executeUpdate();
			st3.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insert(String uname,String pass,String fname,String lname,String phone,String email,InputStream inputStream){
		String sql="insert into users values(?,?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,uname);
			st.setString(2,pass);
			st.setString(3, fname);
			st.setString(4, lname);
			st.setString(5, email);
			st.setString(6, phone);
			st.setBlob(7, inputStream);
			st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public boolean check_id(String id){
		String sql="select * from offers where itemID LIKE BINARY ?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,id);
			ResultSet rs=st.executeQuery();
			if (!rs.next())
			{
				return true;
			}
			else
			{
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public void insert_offer(String uname,String id,String item,String description,String date,String state,String place,InputStream inputStream){
		String sql="insert into offers values(?,?,?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,uname);
			st.setString(2,id);
			st.setString(3,item);
			st.setString(4, description);
			st.setString(5, date);
			st.setString(6, state);
			st.setString(7,place);
			st.setBlob(8, inputStream);
			st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void delete_offer(String item){
		String sql="delete from offers where itemID LIKE BINARY ?";
		String sql1="delete from demands where itemID LIKE BINARY ?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			PreparedStatement st1=con.prepareStatement(sql1);
			st.setString(1,item);
			st1.setString(1,item);
			st.executeUpdate();
			st1.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void update(String uname1,String uname2){
		String sql="update offers set username = '"+uname1+"' where username LIKE BINARY '"+uname2+"'";
		String sql1="update demands set username = '"+uname1+"' where username LIKE BINARY '"+uname2+"'";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			PreparedStatement st1=con.prepareStatement(sql1);
			st.executeUpdate();
			st1.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public boolean check_demand(String id,String name){
		String sql="select * from demands where itemID LIKE BINARY ? and username LIKE BINARY ?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,id);
			st.setString(2, name);
			ResultSet rs=st.executeQuery();
			if (!rs.next())
			{
				return true;
			}
			else
			{
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		}
	public void insert_demand(String id,String uname){
		String sql="insert into demands values(?,?,?)";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,id);
			st.setString(2,uname);
			st.setString(3, "unapproved");
			st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public boolean check_approval(String id,String name){
		String sql="select * from demands where itemID LIKE BINARY ? and username LIKE BINARY ?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,id);
			st.setString(2, name);
			ResultSet rs=st.executeQuery();
			rs.next();
			if (rs.getString("current_status").equals("unapproved"))
			{
				return true;
			}
			else
			{
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public void clear_approval(){
		String sql="update demands set current_status='unapproved'";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void approval(String id,String name){
		String sql="update demands set current_status='approved' where itemID LIKE BINARY ? and username LIKE BINARY ?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,id);
			st.setString(2,name);
			st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
