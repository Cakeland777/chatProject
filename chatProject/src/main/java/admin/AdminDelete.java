package admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDB;

/**
 * Servlet implementation class AdminDelete
 */
@WebServlet("/adminDelete")
public class AdminDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDelete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDB db = MemberDB.getInstance();
		PrintWriter out = response.getWriter();
		response.sendRedirect("member/listMembers.do");

		BufferedReader in = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
		String jsonStr = in.readLine();
		System.out.println("jsonStr = " + jsonStr);

		JSONObject jsonMember = new JSONObject(jsonStr);
		String uid = jsonMember.getString("uid");
		db.delete(uid);
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("status", true);
		jsonResult.put("message", "회원을 삭제하였습니다.");
		out.println(jsonResult.toString());
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
