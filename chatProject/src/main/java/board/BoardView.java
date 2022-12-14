package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.Member;

/**
 * Servlet implementation class BoardView
 */
@WebServlet("/boardList/view")
public class BoardView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardView() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDB db = BoardDB.getInstance();
		BoardFileDB fdb = BoardFileDB.getInstance();
		String id = request.getParameter("id");
		String fileName = fdb.getBoardFile(id).getOrg_name();
		Board viewBoard = db.getBoard(id);
		HttpSession session = request.getSession();
		Member user = (Member) session.getAttribute("user");
		if (user.getUid() != null && viewBoard != null && user.getUid().equals(viewBoard.getUserid())) {
			request.setAttribute("updated", true);
		} else {
			request.setAttribute("updated", false);
		}
		request.setAttribute("viewBoard", viewBoard);
		request.setAttribute("fileName", fileName);
		request.getRequestDispatcher("/BoardView.jsp").forward(request, response);
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
