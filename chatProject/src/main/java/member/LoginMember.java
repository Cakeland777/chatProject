package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

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
	    	  session.setAttribute("admin",result.getAdmin());
	    	  response.sendRedirect("index.jsp");	  
	      }
	      
	      else if(result==null) {
	    	  response.setContentType("text/html; charset=UTF-8");
	    	  PrintWriter writer = response.getWriter();
	    	  writer.println("<script>alert('아이디 혹은 비밀번호를 확인해주세요'); location.href='"+"loginForm.jsp"+"';</script>"); 
	    	  writer.close();
	    	  
	    	  
	      }
	      else if(result!=null&&result.getLogin_check().equals("F")) {
	    	  response.setContentType("text/html; charset=UTF-8");
	    	  PrintWriter writer = response.getWriter();
	    	  writer.println("<script>alert('미사용 회원입니다. 관리자에게 문의해주세요'); location.href='"+"loginForm.jsp"+"';</script>"); 
	    	  writer.close();

	      }
	      else {
	    	  response.setContentType("text/html; charset=UTF-8");
	    	  PrintWriter writer = response.getWriter();
	    	  writer.println("<script>alert('아이디 혹은 비밀번호를 확인해주세요'); location.href='"+"loginForm.jsp"+"';</script>"); 
	    	  writer.close();
	    	  
	      }
	      
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
