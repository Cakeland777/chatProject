package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.servlet.http.HttpServletRequest;

public class BoardDB {
	private BoardDB() {
	}

	private static BoardDB instance = new BoardDB();

	public static BoardDB getInstance() {

		return instance;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;

	public void open() {
		try {
			System.out.println("JDBC 드라이버 로딩 성공");
			Context context = new InitialContext();
			Context envContext = (Context) context.lookup("java:/comp/env");
			DataSource dataSource = (DataSource) envContext.lookup("jdbc/pro05DB");
			if (dataSource != null) {
				conn = dataSource.getConnection();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void close() {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public List<Board> boardList() {
		List<Board> list = new ArrayList<>();

		try {
			open();

			pstmt = conn.prepareStatement("select * from board");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board(rs.getString("ID"), rs.getString("USERID"), rs.getString("TITLE"),
						rs.getString("CONTENT"), rs.getString("TYPE"), rs.getString("TIME"), rs.getString("NAME"),
						rs.getInt("COUNT"));
				list.add(board);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public ArrayList getBoardList() {
		ArrayList boardList = new ArrayList();

		try {
			open();

			String sql = "select * from board order by decode(type, '공지사항', 1),decode(type, 'Q&A', 2), id desc";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Board bb = new Board();
				bb.setId(rs.getString("id"));
				bb.setTitle(rs.getString("title"));
				bb.setUserid(rs.getString("userid"));
				bb.setContent(rs.getString("content"));
				bb.setTime(rs.getString("time"));
				bb.setName(rs.getString("name"));
				bb.setType(rs.getString("type"));
				bb.setCount(rs.getInt("count"));
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return boardList;
	}

	public String insertBoard(Board board) throws SQLException {

		String sql = "insert into board(id,userid,name,title,content,type) values (seq_id.nextval,?,?,?,?,?) ";
		open();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, board.getUserid());
		pstmt.setString(2, board.getName());
		pstmt.setString(3, board.getTitle());
		pstmt.setString(4, board.getContent());
		pstmt.setString(5, board.getType());
		pstmt.executeUpdate();
		pstmt.close();

		String query = "SELECT seq_id.CURRVAL AS id FROM board";
		pstmt = conn.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		String number = "";
		if (rs.next()) {
			number = rs.getString(1);
		}

		close();

		return number;
	}

	public List listBoards(Board board) {
		List boardList = new ArrayList();
		try {
			open();
			String sql = "select * from board order by decode(type, '공지사항', 1),decode(type, 'Q&A', 2), id desc";
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String userid = rs.getString("userid");
				String name = rs.getString("name");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String time = rs.getString("time");
				String type = rs.getString("type");
				int count = rs.getInt("count");
				Board vo = new Board();
				vo.setId(id);
				vo.setUserid(userid);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setTime(time);
				vo.setName(name);
				vo.setType(type);
				vo.setCount(count);
				boardList.add(vo);

			}
			close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;

	}

	public Board getBoardId(HttpServletRequest req) {

		String id = req.getParameter("id");
		Board board = new Board();

		if (id != null && !"".equals(id)) {
			String boardno = (id);
			board.setId(boardno);
		}
		return board;
	}

	public Board getBoard(String id) {
		updateCount(id);
		open();

		String sql = "select * from board where id=?";
		Board viewBoard = new Board();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				viewBoard.setId(rs.getString("id"));
				viewBoard.setTitle(rs.getString("title"));
				viewBoard.setUserid(rs.getString("userid"));
				viewBoard.setContent(rs.getString("content"));
				viewBoard.setTime(rs.getString("time"));
				viewBoard.setName(rs.getString("name"));
				viewBoard.setType(rs.getString("type"));
				viewBoard.setCount(rs.getInt("count"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return viewBoard;
	}

	public void deleteBoard(String id) {
		try {
			open();
			pstmt = conn.prepareStatement("delete from board where id=?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

	}

	public int getCount() {

		int count = 0;

		try {
			// 디비연결
			open();
			String sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			// 실행 -> rs저장
			ResultSet rs = pstmt.executeQuery();
			// 데이터처리
			if (rs.next()) {
				count = rs.getInt(1); // 데이터가 없으면 null이고 return 0값이 된다.

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return count;
	}

	public int updateBoard(Board board) {
		int result = -1;
		String sql = "update board set name=?,title=?,content=?,type=? where id=?";
		try {
			open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getType());
			pstmt.setString(5, board.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			close();
		}

		return result;
	}

	public void updateCount(String id) {
		String sql = "update board set count = count +1 where id=?";
		try {
			open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			close();
		}
	}

	public List searchBoards(String type, String content) {
		List boardList = new ArrayList();
		try {
			open();
			String sql = "select * from board";
			if ((content != null && content.length() != 0)) {

				if (type.equals("title")) {
					sql += " where title like ? order by decode(type, '공지사항', 1),decode(type, 'Q&A', 2), id desc";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + content + "%");

				} else if (type.equals("content")) {
					sql += " where content like ? order by decode(type, '공지사항', 1),decode(type, 'Q&A', 2),id desc";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + content + "%");
				} else if (type.equals("all")) {
					sql += " where (name || content || userid || title) like ? order by decode(type, '공지사항', 1),decode(type, 'Q&A', 2), id desc";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + content + "%");
				} else if (type.equals("userid")) {
					sql += " where userid like ? order by decode(type, '공지사항', 1),decode(type, 'Q&A', 2), id desc";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + content + "%");
				} else if (type.equals("username")) {
					sql += " where name like ? order by decode(type, '공지사항', 1),decode(type, 'Q&A', 2), id desc";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + content + "%");
				}
			} else {
				sql += " order by decode(type, '공지사항', 1),decode(type, 'Q&A', 2), id desc";
				pstmt = conn.prepareStatement(sql);
			}
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String userid = rs.getString("userid");
				String title = rs.getString("title");
				String content1 = rs.getString("content");
				String type1 = rs.getString("type");
				String time = rs.getString("time");
				String name = rs.getString("name");
				int count = rs.getInt("count");
				Board vo = new Board();
				vo.setId(id);
				vo.setUserid(userid);
				vo.setTitle(title);
				vo.setContent(content1);
				vo.setType(type1);
				vo.setTime(time);
				vo.setName(name);
				vo.setCount(count);
				boardList.add(vo);
			}
			close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
}
