package member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class registerMember
 */
@WebServlet("/register")
public class registerMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
	      String userid=request.getParameter("uid");
	      String pwd=request.getParameter("pwd1");
	      String address=request.getParameter("address");
	      String phone=request.getParameter("phone");
	      String sex=request.getParameter("sex");
	      String email=request.getParameter("email");
	      String name=request.getParameter("name");

	      Member member=new Member();
	      member.setUid(userid);
	      member.setName(name);
	      member.setPwd(pwd);
	      member.setAddress(address);
	      member.setEmail(email);
	      member.setPhone(phone);
	      member.setSex(sex);
	      MemberRepositoryDB db=MemberRepositoryDB.getInstance();
	      int result=db.insertMember(member);
	      HttpSession session=request.getSession();
	      if (result==1) {
	    	  session.setAttribute("userid", userid);
	    	  response.setContentType("text/html; charset=UTF-8");
	    	  PrintWriter writer = response.getWriter();
	    	  writer.println("<script>alert('가입성공');location.href='"+"loginForm.jsp"+"';</script>");  

	    	  writer.close();
	    	  
	      }
	      else {
	    	  response.setContentType("text/html; charset=UTF-8");
	    	  PrintWriter writer = response.getWriter();
	    	  writer.println("<script>alert('가입실패'); location.href='"+"loginForm.jsp"+"';</script>"); 
	    	  writer.close();
	      }


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
