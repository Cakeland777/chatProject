package board;

import java.sql.SQLException;
import java.util.List;

public class BoardService {

	BoardDB boardDB;
	BoardFileDB boardFileDB;
	BoardDB db = BoardDB.getInstance();

	public BoardService() {

	}

	public List<Board> listArticles(String type, String content, int page) {

		List<Board> articlesList = db.searchBoards(type, content, page);
		return articlesList;

	}

	public String addArticle(Board board) throws SQLException {

		String number = db.insertBoard(board);
		return number;
	}

	public String addArticleReply(Board board) throws SQLException {

		String number = db.insertReply(board);
		return number;
	}

	public int getTotalPage(String type, String content) {

		int num = db.totalPageNo(type, content);
		return num;

	}

	public void addArticleFile(String number, String name, String realname, String content, Long length)
			throws SQLException {
		BoardFileDB fdb = BoardFileDB.getInstance();
		fdb.insertBoardFile(number, name, realname, content, length);

	}

	public Board viewArticle(String id) {
		Board board = null;
		board = db.getBoard(id);
		return board;
	}

	public String viewArticleFile(String id) {
		BoardFileDB fdb = BoardFileDB.getInstance();
		String Filename = fdb.getBoardFile(id).getOrg_name();
		return Filename;
	}

	public String viewArticleFile_Real(String id) {
		BoardFileDB fdb = BoardFileDB.getInstance();
		String RealFilename = fdb.getBoardFile(id).getReal_name();
		return RealFilename;
	}

	public int updateAtricle(Board board) {
		int result = 0;

		result = db.updateBoard(board);
		return result;

	}

	public void deleteArticle(String id) {

		db.deleteBoard(id);

	}

}