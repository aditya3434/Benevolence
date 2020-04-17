package WebPage;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.login.dao.LoginDao;

/**
 * Servlet implementation class Edit
 */
@WebServlet("/Edit")
@MultipartConfig(maxFileSize = 16177215)
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public static boolean isValid(String email) 
    { 
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+ 
                            "[a-zA-Z0-9_+&*-]+)*@" + 
                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
                            "A-Z]{2,7}$"; 
                              
        Pattern pat = Pattern.compile(emailRegex); 
        if (email == null) 
            return false; 
        return pat.matcher(email).matches(); 
    }
    public static boolean isValid_no(String phoneNo) 
    { 
    	if (phoneNo.matches("\\d{10}")) return true;
		else if(phoneNo.matches("\\d{3}[-\\.\\s]\\d{3}[-\\.\\s]\\d{4}")) return true;
		else if(phoneNo.matches("\\d{3}-\\d{3}-\\d{4}\\s(x|(ext))\\d{3,5}")) return true;
		else if(phoneNo.matches("\\(\\d{3}\\)-\\d{3}-\\d{4}")) return true;
		else return false;
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
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		Part filePart = request.getPart("photo");
		InputStream inputStream = filePart.getInputStream();
		HttpSession session = request.getSession();
		Map<String, String> messages = new HashMap<String, String>();
		request.setAttribute("messages", messages);
		messages.put("foo","");
		messages.put("success", "");
		LoginDao dao=new LoginDao();
		if (uname.isEmpty()||pass.isEmpty()||fname.isEmpty()||lname.isEmpty()||email.isEmpty())
		{
			messages.put("foo","One of the fields is empty!");
			messages.put("success", "");
		    RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");
		    rd.include(request, response);
		}
		else if (!isValid(email))
		{
			messages.put("foo","Invalid E-mail ID!");
			messages.put("success", "");
		    RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");
		    rd.include(request, response);
		}
		else if (!isValid_no(phone))
		{
			messages.put("foo","Invalid Phone no.!");
			messages.put("success", "");
		    RequestDispatcher rd=request.getRequestDispatcher("Registration.jsp");
		    rd.include(request, response);
		}
		else if (!uname.equals(session.getAttribute("username").toString()) && dao.check_user(uname))
		{
			messages.put("foo","Username taken! Try another one!");
			messages.put("success", "");
		    RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");
		    rd.include(request, response);
		}
		else
		{
			dao.delete_user(session.getAttribute("username").toString());
			dao.insert(uname, pass, fname, lname, phone, email, inputStream);
			dao.update(uname, session.getAttribute("username").toString());
			session.setAttribute("username", uname);
			response.sendRedirect("UserHome.jsp");
		}
	}

}
