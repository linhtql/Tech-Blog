package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.User;

public class UserDAO {
	private Connection conn;

	public UserDAO(Connection conn) {
		this.conn = conn;
	}

	// method to insert user to data base:

	public boolean saveUser(User user) {
		boolean f = false;
		try {
			// user--->database
			String sql = "insert into user(name, email, password,gender,about) values (?,?,?,?,?)";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());

			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// get user by useremail and userpassword:

	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;

		try {
			String sql = "select * from user where email =? and password =?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, email);
			pstm.setString(2, password);

			ResultSet set = pstm.executeQuery();
			if (set.next()) {

				user = new User();
				// data from db
				String name = set.getString("name");
				// set to user object
				user.setName(name);

				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	
	public boolean updateUser(User user) {
		boolean f=false;
		try {
			String sql="update user set name= ? ,email =?,password =?, gender =?,about =?,profile =? where id =?";
			PreparedStatement pstm=conn.prepareStatement(sql);
			pstm.setString(1, user.getName());
			pstm.setString(2, user.getEmail());
			pstm.setString(3, user.getPassword());
			pstm.setString(4, user.getGender());
			pstm.setString(5, user.getAbout());
			pstm.setString(6, user.getProfile());
			pstm.setInt(7, user.getId());
			
			pstm.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public User getUserByUserId(int userId) {
		User user=null;
		try {
			String sql="select * from user where id=?";
			PreparedStatement pstm=this.conn.prepareStatement(sql);
			pstm.setInt(1, userId);
			ResultSet set=pstm.executeQuery();
			while(set.next()) {
				
				user = new User();
				// data from db
				String name = set.getString("name");
				// set to user object
				user.setName(name);

				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return user;
	}
}
