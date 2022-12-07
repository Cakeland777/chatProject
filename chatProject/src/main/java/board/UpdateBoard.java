package board;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.Member;
import member.MemberRepositoryDB;

import java.io.IOException;

/**
 * Servlet implementation class UpdateBoard
 */
@WebServlet("/UpdateBoard")
public class UpdateBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		BoardDB db=BoardDB.getInstance();
		Board board=db.getBoard(id);
		request.setAttribute("board", board);
		RequestDispatcher dispatcher=request.getRequestDispatcher("UpdateBoardForm.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userid=request.getParameter("uid");
		String title=request.getParameter("title");
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		String type=request.getParameter("type");
		String content=request.getParameter("content");
		Board board=new Board();
		board.setUserid(userid);
		board.setId(id);
		board.setName(name);
		board.setContent(content);
		board.setType(type);
		board.setTitle(title);
		BoardDB db=BoardDB.getInstance();
		db.updateBoard(board);
		response.sendRedirect("boardList.jsp");
	}

}
