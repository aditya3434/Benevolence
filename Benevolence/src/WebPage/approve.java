package WebPage;

import java.io.IOException;
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
 * Servlet implementation class approve
 */
@WebServlet("/approve")
public class approve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public approve() {
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
		String uname=request.getParameter("uname");
		String id=request.getParameter("id");
		if (dao.check_approval(id, uname)){
			dao.clear_approval();
			dao.approval(id, uname);
			messages.put("success", "Acceptor Approved!\nNote : You can have only 1 approved acceptor. Approving another would replace your current acceptor.");
			messages.put("foo","");
		}
		else{
			messages.put("success", "");
			messages.put("foo","You have already approved this acceptor!");
		}
		RequestDispatcher rd=request.getRequestDispatcher("Acceptors.jsp");
	    rd.include(request, response);
	}
}
