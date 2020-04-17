package WebPage;


import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.login.dao.LoginDao;

/**
 * Servlet implementation class Donation
 */
@WebServlet("/Donation")
@MultipartConfig(maxFileSize = 16177215)
public class Donation extends HttpServlet {
	static String getAlphaNumericString(int n) 
    { 
  
        // chose a Character random from this String 
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz"; 
  
        // create StringBuffer size of AlphaNumericString 
        StringBuilder sb = new StringBuilder(n); 
  
        for (int i = 0; i < n; i++) { 
  
            // generate a random number between 
            // 0 to AlphaNumericString variable length 
            int index 
                = (int)(AlphaNumericString.length() 
                        * Math.random()); 
  
            // add Character one by one in end of sb 
            sb.append(AlphaNumericString 
                          .charAt(index)); 
        } 
  
        return sb.toString(); 
    } 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Donation() {
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
		Map<String, String> messages = new HashMap<String, String>();
		request.setAttribute("messages", messages);
		String uname = request.getParameter("uname");
		String date = request.getParameter("date");
		String item = request.getParameter("item");
		Part filePart = request.getPart("photo");
		InputStream inputStream = filePart.getInputStream();
		String state = request.getParameter("state");
		String address = request.getParameter("address");
		String description = request.getParameter("description");
		LoginDao dao=new LoginDao();
		messages.put("foo","");
		messages.put("success", "");
		while (true){
			String id=getAlphaNumericString(6);
			if (dao.check_id(id)){
				if (address.isEmpty()||description.isEmpty()){
					messages.put("foo", "One of the fields is missing!");
				}
				else if (filePart == null)
				{
					messages.put("foo", "Image not uploaded");
				}
				else{
					dao.insert_offer(uname, id, item, description, date, state, address, inputStream);
					messages.put("foo","");
					messages.put("success", "Donation Successful!");
				}
				break;
			}
		}
		RequestDispatcher rd=request.getRequestDispatcher("DonateItem.jsp");
	    rd.include(request, response);
	}
}
