package WebPage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * Servlet implementation class demand
 */
@WebServlet("/demand")
public class demand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public demand() {
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
		HttpSession session = request.getSession();
		LoginDao dao=new LoginDao();
		messages.put("foo","");
		messages.put("success", "");
		String uname=session.getAttribute("username").toString();
		String id=session.getAttribute("item").toString();
		if (dao.check_demand(id, uname)){
			dao.insert_demand(id, uname);
			messages.put("foo","");
			messages.put("success", "Request Sent!");
		}
		else{
			messages.put("foo","You have already sent a request!");
			messages.put("success", "");
		}
		RequestDispatcher rd=request.getRequestDispatcher("Item.jsp");
	    rd.include(request, response);
	}

}
