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
 * Servlet implementation class InsertBoard
 */
@WebServlet("/InsertBoard")
public class InsertBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String userid=request.getParameter("uid");
	      String title=request.getParameter("title");
	      String content=request.getParameter("content");
	      String type=request.getParameter("type");
	      String name=request.getParameter("name");
	      Board board=new Board();
	      board.setUserid(userid);
	      board.setTitle(title);
	      board.setName(name);
	     board.setContent(content);
	     board.setType(type);
	      BoardDB db=BoardDB.getInstance();
	      int result=db.insertBoard(board);
	      HttpSession session=request.getSession();
	      if (result==1) {
	    	  session.setAttribute("userid", userid);
	    	  session.setAttribute("name", name);
	    	  request.setAttribute("message", "성공");
	    	  response.sendRedirect("boardList.jsp");
	      }
	      else {
	    	  request.setAttribute("message", "실패");
	      }
//	      RequestDispatcher dispatcher=request.getRequestDispatcher("loginSuccess.jsp");
//	      dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
