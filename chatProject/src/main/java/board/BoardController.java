package board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.JSONObject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.Member;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService boardService;
	Board board;
	private static String Article_Image_Repo = "c:\\upload";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardController() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init(ServletConfig config) throws ServletException {
		boardService = new BoardService();
		board = new Board();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String nextPage = "./listArticles.do";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		try {
			List<Board> articlesList = new ArrayList<Board>();
			if (action == null) {
				nextPage = "./listArticles.do";
			}

			else if (action.equals("/listArticles.do")) {
				request.setCharacterEncoding("UTF-8");
				String content = request.getParameter("content");
				String type = request.getParameter("type");
				String pageNoStr = request.getParameter("pageNo");
				if ("".equals(pageNoStr) || null == pageNoStr)
					pageNoStr = "1";
				int pageNo = Integer.parseInt(pageNoStr);
				int pageSize = 10;
				int totalPageNo = boardService.getTotalPage(type, content);
				int startPageNo = ((pageNo - 1) / pageSize) * pageSize + 1;
				int endPageNo = startPageNo + pageSize - 1;

				if (endPageNo > totalPageNo)
					endPageNo = totalPageNo;

				List<Board> list = boardService.listArticles(type, content, pageNo);
				request.setAttribute("articlesList", list);
				request.setAttribute("pageSize", pageSize);
				request.setAttribute("totalPageNo", totalPageNo);
				request.setAttribute("startPageNo", startPageNo);
				request.setAttribute("endPageNo", endPageNo);
				request.setAttribute("currentPageNo", pageNo);
				nextPage = "/listArticles.jsp";
			}

			else if (action.equals("/articleForm.do")) {
				nextPage = "/BoardForm.jsp";

			} else if (action.equals("/removeArticle.do")) {
				String id = request.getParameter("id");
				boardService.deleteArticle(id);
				response.sendRedirect("./listArticles.do");
			} else if (action.equals("/replyForm.do")) {
				String id = request.getParameter("id");
				String type = request.getParameter("type");
				request.setAttribute("id", id);
				request.setAttribute("type", type);
				nextPage = "/replyForm.jsp";
			} else if (action.equals("/replyArticle.do")) {
				DiskFileItemFactory factory = new DiskFileItemFactory();

				factory.setRepository(new File("c:\\upload"));

				ServletFileUpload upload = new ServletFileUpload(factory);
				try {

					PrintWriter out = response.getWriter();
					Map<String, List<FileItem>> mapItems = upload.parseParameterMap(request);

					String title = mapItems.get("title").get(0).getString();
					title = new String(title.getBytes("ISO-8859-1"), "UTF-8");
					String content = mapItems.get("content").get(0).getString();
					content = new String(content.getBytes("ISO-8859-1"), "UTF-8");
					String type = mapItems.get("type").get(0).getString();
					type = new String(type.getBytes("ISO-8859-1"), "UTF-8");
					String uid = mapItems.get("uid").get(0).getString();
					uid = new String(uid.getBytes("ISO-8859-1"), "UTF-8");
					String name = mapItems.get("name").get(0).getString();
					name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
					String parent_no = mapItems.get("id").get(0).getString();
					parent_no = new String(parent_no.getBytes("ISO-8859-1"), "UTF-8");
					Board board = new Board();
					board.setUserid(uid);
					board.setTitle(title);
					board.setName(name);
					board.setContent(content);
					board.setType(type);
					board.setParent_no(parent_no);
					JSONObject jsonResult = new JSONObject();
					FileItem fileItem = mapItems.get("filename").get(0);
					String real_name = Article_Image_Repo + "\\" + System.nanoTime();
					fileItem.write(new File(real_name));
					try {
						String number = boardService.addArticleReply(board);
						boardService.addArticleFile(number, fileItem.getName(), real_name, fileItem.getContentType(),
								fileItem.getSize());
						jsonResult.put("status", true);
						jsonResult.put("message", "글쓰기를 성공했습니다.");
						jsonResult.put("url", "./listArticles.do");
						out.println(jsonResult.toString());
						return;
					}

					catch (SQLException e) {
						jsonResult.put("status", false);
						jsonResult.put("message", "작성 중에 오류가 발생했습니다.");
						e.printStackTrace();
					}
					out.println(jsonResult.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else if (action.equals("/updateForm.do")) {
				String id = request.getParameter("id");
				Board board = boardService.viewArticle(id);
				request.setAttribute("board", board);
				nextPage = "/UpdateBoardForm.jsp";
			} else if (action.equals("/updateArticle.do")) {
				request.setCharacterEncoding("UTF-8");
				String userid = request.getParameter("uid");
				String title = request.getParameter("title");
				String name = request.getParameter("name");
				String id = request.getParameter("id");
				String type = request.getParameter("type");
				String content = request.getParameter("content");
				Board board = new Board();
				board.setUserid(userid);
				board.setId(id);
				board.setName(name);
				board.setContent(content);
				board.setType(type);
				board.setTitle(title);
				boardService.updateAtricle(board);
				response.sendRedirect("./listArticles.do");

			}

			else if (action.equals("/fileDown.do")) {
				String id = request.getParameter("id");

				String fileName = boardService.viewArticleFile_Real(id);
				String orgName = boardService.viewArticleFile(id);
				File file = new File(fileName);
				System.out.println(file.getAbsolutePath());

				if (!file.exists()) {
					response.getWriter().append("file not found");
					return;
				}

				OutputStream out = response.getOutputStream();
				response.setContentType(orgName.endsWith(".jpg") ? "image/jpg" : "application/octet-stream");
				response.setHeader("Cache-Control", "no-cache");
				orgName = URLEncoder.encode(orgName, "UTF-8");
				response.addHeader("Content-disposition", "attachment; fileName=" + orgName);

				InputStream in = new FileInputStream(file);
				byte[] data = new byte[4096];
				while (true) {
					int readCount = in.read(data);
					if (readCount <= 0)
						break;
					out.write(data, 0, readCount);
				}
				in.close();
				out.close();
				nextPage = "/BoardView.jsp";
			} else if (action.equals("/viewArticle.do")) {
				String id = request.getParameter("id");
				board = boardService.viewArticle(id);
				String fileName = boardService.viewArticleFile(id);
				HttpSession session = request.getSession();
				Member user = (Member) session.getAttribute("user");
				if (user.getUid() != null && board != null && user.getUid().equals(board.getUserid())) {
					request.setAttribute("updated", true);
				} else {
					request.setAttribute("updated", false);
				}
				request.setAttribute("article", board);
				request.setAttribute("fileName", fileName);

				nextPage = "/BoardView.jsp";
			} else if (action.equals("/addArticle.do")) {
				DiskFileItemFactory factory = new DiskFileItemFactory();

				factory.setRepository(new File("c:\\upload"));

				ServletFileUpload upload = new ServletFileUpload(factory);
				try {

					PrintWriter out = response.getWriter();
					Map<String, List<FileItem>> mapItems = upload.parseParameterMap(request);

					String title = mapItems.get("title").get(0).getString();
					title = new String(title.getBytes("ISO-8859-1"), "UTF-8");
					String content = mapItems.get("content").get(0).getString();
					content = new String(content.getBytes("ISO-8859-1"), "UTF-8");
					String type = mapItems.get("type").get(0).getString();
					type = new String(type.getBytes("ISO-8859-1"), "UTF-8");
					String uid = mapItems.get("uid").get(0).getString();
					uid = new String(uid.getBytes("ISO-8859-1"), "UTF-8");
					String name = mapItems.get("name").get(0).getString();
					name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
					Board board = new Board();
					board.setUserid(uid);
					board.setTitle(title);
					board.setName(name);
					board.setContent(content);
					board.setType(type);
					JSONObject jsonResult = new JSONObject();
					FileItem fileItem = mapItems.get("filename").get(0);
					String real_name = Article_Image_Repo + "\\" + System.nanoTime();
					fileItem.write(new File(real_name));
					nextPage = "./listArticles.do";
					try {
						String number = boardService.addArticle(board);
						boardService.addArticleFile(number, fileItem.getName(), real_name, fileItem.getContentType(),
								fileItem.getSize());
						jsonResult.put("status", true);
						jsonResult.put("message", "글쓰기를 성공했습니다.");
						jsonResult.put("url", "./listArticles.do");
						out.println(jsonResult.toString());
						return;
					}

					catch (SQLException e) {
						jsonResult.put("status", false);
						jsonResult.put("message", "작성 중에 오류가 발생했습니다.");
						e.printStackTrace();
					}
					out.println(jsonResult.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}
}
