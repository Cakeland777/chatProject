package member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class PwdFind
 */
@WebServlet("/PwdFind")
public class PwdFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdFind() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      String userid=request.getParameter("uid");
	      String phone=request.getParameter("phone");
	      MemberDB db=MemberDB.getInstance();
	      Member member=new Member();
	      member.setUid(userid);
	      member.setPhone(phone);
	      Member result= db.findPwd(member);
	      if(result!=null&&result.getName()!=null) {
	    	  request.setAttribute("pwd", result.getPwd());
		  		RequestDispatcher dispatcher=request.getRequestDispatcher("/PwdResult.jsp");
		  		dispatcher.forward(request, response);
	    	 
	      }
	      else {
	    	  response.sendRedirect("FindPwd.jsp");
	      }
	      response.setContentType("text/html; charset=utf-8");
	}
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
