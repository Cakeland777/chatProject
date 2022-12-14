package board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardDown
 */
@WebServlet("/boardList/boardDown")
public class BoardDown extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDown() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		BoardFileDB fdb = BoardFileDB.getInstance();
		String fileName = fdb.getBoardFile(id).getReal_name();
		String orgName = fdb.getBoardFile(id).getOrg_name();
		File file = new File(fileName);
		System.out.println(file.getAbsolutePath());

		if (!file.exists()) {
			response.getWriter().append("file not found");
			return;
		}

		OutputStream out = response.getOutputStream();
		response.setContentType(orgName.endsWith(".jpg") ? "image/jpg" : "application/octet-stream");
		response.setHeader("Cache-Control", "no-cache");
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
