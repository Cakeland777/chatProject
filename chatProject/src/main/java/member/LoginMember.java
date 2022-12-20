package member;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String userid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		MemberDB db = MemberDB.getInstance();
		Member member = new Member();
		member.setUid(userid);
		member.setPwd(pwd);
		Member result = db.login(member);
		HttpSession session = request.getSession();
		if (result != null && result.getName() != null && result.getLogin_check().equals("T")) {
			session.setAttribute("userid", result.getUid());
			session.setAttribute("user", result);
			response.sendRedirect("index.jsp");
		}

		else if (result != null && result.getLogin_check() != null && result.getLogin_check().equals("F")) {
			request.setAttribute("status", "notuse");
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginForm.jsp");
			dispatcher.forward(request, response);

		} else {
			request.setAttribute("status", "check");
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginForm.jsp");
			dispatcher.forward(request, response);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
