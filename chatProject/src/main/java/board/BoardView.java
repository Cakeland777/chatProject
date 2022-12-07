package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDB db=BoardDB.getInstance();
		String id = request.getParameter("id");
		Board viewBoard = db.getBoard(id);
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		if (userid != null && viewBoard != null &&  userid.equals(viewBoard.getUserid())) {
			request.setAttribute("updated", true);	
		} else {
			request.setAttribute("updated", false);	
		}
		request.setAttribute("viewBoard", viewBoard);	
		request.getRequestDispatcher("/BoardView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
