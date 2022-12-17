package board;

import java.util.List;

public class BoardService {

	BoardDB boardDB;

	public BoardService() {
		BoardDB db = BoardDB.getInstance();
	}

	public static List<Board> listArticles() {
		BoardDB db = BoardDB.getInstance();
		List<Board> articlesList = db.boardList();
		return articlesList;

	}
}