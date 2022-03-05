package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDAO {

	Connection conn;

	public PostDAO(Connection conn) {
		this.conn = conn;
	}

	public ArrayList<Category> getAllCategories() {

		ArrayList<Category> list = new ArrayList<Category>();
		try {
			String sql = "select * from categories";
			Statement st = this.conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");
				Category c = new Category(cid, name, description);
				list.add(c);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean savePost(Post post) {
		boolean f = false;
		try {
			String sql = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values (?,?,?,?,?,?)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, post.getpTitle());
			pstm.setString(2, post.getpContent());
			pstm.setString(3, post.getpCode());
			pstm.setString(4, post.getpPic());
			pstm.setInt(5, post.getCatId());
			pstm.setInt(6, post.getUserId());
			pstm.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Post> getAllPosts() {
		List<Post> list = new ArrayList<Post>();
		// fetch all the post
		try {
			PreparedStatement pstm = conn.prepareStatement("select * from posts order by pid desc");
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				int pid = rs.getInt("pid");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp date = rs.getTimestamp("pDate");
				int catId = rs.getInt("catId");
				int userId = rs.getInt("userId");
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public List<Post> getByCatId(int catId) {
		List<Post> list = new ArrayList<Post>();
		// fetch all post by id

		try {
			PreparedStatement pstm = conn.prepareStatement("select * from posts where catId=?");
			pstm.setInt(1, catId);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				int pid = rs.getInt("pid");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp date = rs.getTimestamp("pDate");
				int userId = rs.getInt("userId");
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Post getPostByPostId(int postId) {
		Post post=null;
		try {
			String sql="select * from posts where pid=?";
			PreparedStatement pstm=this.conn.prepareStatement(sql);
			pstm.setInt(1, postId);
			ResultSet rs=pstm.executeQuery();
			while(rs.next()) {
				int pid = rs.getInt("pid");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp date = rs.getTimestamp("pDate");
				int catId=rs.getInt("catId");
				int userId = rs.getInt("userId");
				post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}

}
