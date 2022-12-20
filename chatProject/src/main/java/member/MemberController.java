package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Member member;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		if (action.equals("/listMembers.do")) {
			MemberDB db = MemberDB.getInstance();
			Member member = new Member();
			String name = request.getParameter("name");
			member.setName(name);
			List<Member> membersList = db.listMembers(member);
			request.setAttribute("membersList", membersList);
			RequestDispatcher dispatch = request.getRequestDispatcher("/member.jsp");
			dispatch.forward(request, response);
		} else if (action.equals("/detailMember.do")) {
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("userid");
			MemberDB db = MemberDB.getInstance();
			Member member = db.getMember(userid);
			request.setAttribute("member", member);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/memberDetail.jsp");
			dispatcher.forward(request, response);

		} else if (action.equals("/updateMemberForm.do")) {
			String userid = request.getParameter("uid");
			MemberDB db = MemberDB.getInstance();
			Member member = db.getMember(userid);
			request.setAttribute("member", member);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/memberUpdate.jsp");
			dispatcher.forward(request, response);

		} else if (action.equals("/updateMember.do")) {

			request.setCharacterEncoding("UTF-8");
			String userid = request.getParameter("uid");
			String pwd = request.getParameter("pwd1");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String sex = request.getParameter("sex");
			Member member = new Member();
			member.setUid(userid);
			member.setPwd(pwd);
			member.setName(name);
			member.setPhone(phone);
			member.setEmail(email);
			member.setAddress(address);
			member.setSex(sex);
			MemberDB db = MemberDB.getInstance();
			db.updateMember(member);
			HttpSession session = request.getSession();
			session.setAttribute("user", member);
			RequestDispatcher dispatcher = request.getRequestDispatcher("./detailMember.do");
			dispatcher.forward(request, response);

		} else if (action.equals("/loginForm.do")) {
			response.sendRedirect("../loginForm.jsp");
		} else if (action.equals("/findForm.do")) {
			response.sendRedirect("../FindInfo.jsp");
		}

		else if (action.equals("/logout.do")) {
			HttpSession session = request.getSession();
			if (session.getAttribute("user") != null) {
				session.invalidate();
			}

			response.sendRedirect("../index.jsp");
		} else if (action.equals("/memberForm.do")) {
			response.sendRedirect("../user.jsp");

		} else if (action.equals("/IdCheck")) {
			request.setCharacterEncoding("UTF-8");
			String uid = request.getParameter("uid");
			PrintWriter out = response.getWriter();
			MemberDB db = MemberDB.getInstance();
			int idCheck = db.overlappedID(uid);
			out.write(idCheck + "");
			out.close();
		} else if (action.equals("/deleteMember.do")) {
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("userid");
			MemberDB db = MemberDB.getInstance();
			db.delete(userid);
			session.invalidate();
			response.sendRedirect("../index.jsp");

		}
	}
}
