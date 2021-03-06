package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.login.dao.LoginDao;

/**
 * Servlet implementation class Userlogin
 */
@WebServlet("/Userlogin")
public class Userlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Userlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				Map<String, String> messages = new HashMap<String, String>();
				request.setAttribute("messages", messages);
				messages.put("foo","");
				messages.put("success", "");
				String uname = request.getParameter("uname");
				String pass = request.getParameter("pass");
				LoginDao dao=new LoginDao();
				if (uname.equals("Aditya Singh") && pass.equals("9062211a")){
					HttpSession session = request.getSession();
					session.setAttribute("username",uname);
					response.sendRedirect("AdminHome.jsp");
				}
				else if (dao.check(uname,pass))
				{
					HttpSession session = request.getSession();
					session.setAttribute("username",uname);
					response.sendRedirect("UserHome.jsp");
				}
				else
				{
					messages.put("foo","Invalid Username or Password");
					messages.put("success", "");
				    RequestDispatcher rd=request.getRequestDispatcher("UserLogin.jsp");
				    rd.include(request, response);
				}

	}

}
