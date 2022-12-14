package board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DiskFileItemFactory factory = new DiskFileItemFactory();

		factory.setRepository(new File("c:\\upload"));

		// 파일 업로드 객체에 저장소 설정
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

			BoardDB db = BoardDB.getInstance();
			BoardFileDB fdb = BoardFileDB.getInstance();
			JSONObject jsonResult = new JSONObject();
			FileItem fileItem = mapItems.get("filename").get(0);
			String real_name = "c:\\upload\\" + System.nanoTime();
			fileItem.write(new File(real_name));
			try {
				String number = db.insertBoard(board);
				fdb.insertBoardFile(number, fileItem.getName(), real_name, fileItem.getContentType(),
						fileItem.getSize());
				jsonResult.put("status", true);
				jsonResult.put("url", "boardList.jsp");

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
