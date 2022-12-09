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
 * Servlet implementation class UpdateMember
 */
@WebServlet("/updateMember")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("userid");
		MemberDB db=MemberDB.getInstance();
		Member member=db.getMember(userid);
		request.setAttribute("member", member);
		RequestDispatcher dispatcher=request.getRequestDispatcher("memberUpdate.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		String userid=request.getParameter("uid");
		String pwd=request.getParameter("pwd1");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");
		String sex=request.getParameter("sex");
		Member member=new Member();
		member.setUid(userid);
		member.setPwd(pwd);
		member.setName(name);
		member.setPhone(phone);
		member.setEmail(email);
		member.setAddress(address);
		member.setSex(sex);
		MemberDB db=MemberDB.getInstance();
		db.updateMember(member);
		HttpSession session=request.getSession();
		session.setAttribute("name",member.getName());
		response.sendRedirect("index.jsp");
	}

}
