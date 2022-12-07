package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class IdFind
 */
@WebServlet("/IdFind")
public class IdFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdFind() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      String name=request.getParameter("name");
	      String phone=request.getParameter("phone");
	      MemberRepositoryDB db=MemberRepositoryDB.getInstance();
	      Member member=new Member();
	      member.setName(name);
	      member.setPhone(phone);
	      Member result= db.findId(member);
	      HttpSession session=request.getSession();
	      if(result!=null&&result.getName()!=null) {
	    	  session.setAttribute("id", result.getUid());
	    	  response.sendRedirect("IdResult.jsp");	  
	      }
	      else {
	    	  response.sendRedirect("FindId.jsp");
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
