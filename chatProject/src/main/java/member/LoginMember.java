package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class LoginMember
 */
@WebServlet("/loginMember")
public class LoginMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	      String userid=request.getParameter("uid");
	      String pwd=request.getParameter("pwd");
	      MemberRepositoryDB db=MemberRepositoryDB.getInstance();
	      Member member=new Member();
	      member.setUid(userid);
	      member.setPwd(pwd);
	      Member result= db.login(member);
	      HttpSession session=request.getSession();
	      if(result!=null&&result.getName()!=null) {
	    	  session.setAttribute("userid", result.getUid());
	    	  session.setAttribute("name",result.getName());
	    	  response.sendRedirect("loginSuccess.jsp");	  
	      }
	      else {
	    	  
	    	  response.sendRedirect("index.html");
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
