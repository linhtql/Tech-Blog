package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDAO;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter out=response.getWriter();     
			out.println("<!DOCTYPE html>");      
			out.println("<html>");      
			out.println("<head>");      
			out.println("<title>Servlet LoginServlet</title>");      
			out.println("</head>");      
			out.println("<body>");   
			//login
			//fetch username and password from request
			String userEmail=request.getParameter("user_email");
			String userPassword=request.getParameter("user_password");
			
			UserDAO dao=new UserDAO(ConnectionProvider.getConnection());
			User u=dao.getUserByEmailAndPassword(userEmail, userPassword);
			if(u==null) {
				//login....
				//error
				
//				out.println("Invalid Details ..try again");
				Message msg=new Message("Invalid Details ! try with another", "error", "alert-danger");
				HttpSession s=request.getSession();
				s.setAttribute("msg", msg);
				
				response.sendRedirect("login_page.jsp");
			}
			else {
				//....
				//login success....
				HttpSession s=request.getSession();
				s.setAttribute("currentUser", u);
				response.sendRedirect("profile.jsp");
			}
			out.println("</body>");      
			out.println("</html>"); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
