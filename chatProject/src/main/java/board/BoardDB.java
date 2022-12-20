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
						rs.getInt("COUNT"), rs.getString("PARENT_NO"));
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
				bb.setParent_no(rs.getString("parent_no"));
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

		String sql = "insert into board(id,userid,name,title,content,type,parent_no) values (seq_id.nextval,?,?,?,?,?,seq_id.nextval) ";
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

	public String insertReply(Board board) throws SQLException {

		String sql = "insert into board(id,userid,name,title,content,type,parent_no) values (seq_id.nextval,?,?,?,?,?,?) ";
		open();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, board.getUserid());
		pstmt.setString(2, board.getName());
		pstmt.setString(3, board.getTitle());
		pstmt.setString(4, board.getContent());
		pstmt.setString(5, board.getType());
		pstmt.setString(6, board.getParent_no());
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
				viewBoard.setParent_no(rs.getString("parent_no"));
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
			open();
			String sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);

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

	public int totalPageNo(String type, String content) {
		int totalPageSize = 0;
		final int rowSize = 10;
		try {
			open();
			String sql = "select ceil(COUNT(*) / ? ) from board";
			if ((content != null && content.length() != 0)) {

				if (type.equals("title")) {
					sql += " where title like ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, rowSize);
					pstmt.setString(2, "%" + content + "%");

				} else if (type.equals("content")) {
					sql += " where content like ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, rowSize);
					pstmt.setString(2, "%" + content + "%");
				} else if (type.equals("all")) {
					sql += " where (name || content || userid || title) like ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, rowSize);
					pstmt.setString(2, "%" + content + "%");
				} else if (type.equals("userid")) {
					sql += " where userid like ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, rowSize);
					pstmt.setString(2, "%" + content + "%");
				} else if (type.equals("username")) {
					sql += " where name like ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, rowSize);
					pstmt.setString(2, "%" + content + "%");
				}
			} else {

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rowSize);
			}
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				totalPageSize = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalPageSize;

	}

	public List<Board> searchBoards(String type, String content, int pageNo) {
		List<Board> list = new ArrayList<>();
		final int rowSize = 10;
		try {

			open();
			String sql = "select * from(select row_number() over(order by decode(type, '공지사항', 1),decode(type, 'Q&A', 2),parent_no,id asc) "
					+ "num,A.* from board A order by decode(type, '공지사항', 1),decode(type, 'Q&A', 2),parent_no,id asc)";

			if ((content != null && content.length() != 0)) {

				if (type.equals("title")) {
					sql += " where title like ? and num between ? and ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + content + "%");
					pstmt.setInt(2, ((pageNo - 1) * rowSize) + 1);
					pstmt.setInt(3, ((pageNo - 1) * rowSize) + rowSize);

				} else if (type.equals("content")) {
					sql += " where content like ? and num between ? and ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + content + "%");
					pstmt.setInt(2, ((pageNo - 1) * rowSize) + 1);
					pstmt.setInt(3, ((pageNo - 1) * rowSize) + rowSize);
				} else if (type.equals("all")) {
					sql += " where (name || content || userid || title) like ? and num between ? and ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + content + "%");
					pstmt.setInt(2, ((pageNo - 1) * rowSize) + 1);
					pstmt.setInt(3, ((pageNo - 1) * rowSize) + rowSize);
				} else if (type.equals("userid")) {
					sql += " where userid like ? and num between ? and ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + content + "%");
					pstmt.setInt(2, ((pageNo - 1) * rowSize) + 1);
					pstmt.setInt(3, ((pageNo - 1) * rowSize) + rowSize);
				} else if (type.equals("username")) {
					sql += " where name like ? and num between ? and ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + content + "%");
					pstmt.setInt(2, ((pageNo - 1) * rowSize) + 1);
					pstmt.setInt(3, ((pageNo - 1) * rowSize) + rowSize);
				}
			} else {
				sql += " where num between ? and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ((pageNo - 1) * rowSize) + 1);
				pstmt.setInt(2, ((pageNo - 1) * rowSize) + rowSize);
			}
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board(rs.getString("id"), rs.getString("userid"), rs.getString("title"),
						rs.getString("content"), rs.getString("type"), rs.getString("time"), rs.getString("name"),
						rs.getInt("count"), rs.getString("parent_no"));
				System.out.println(board);
				list.add(board);
			}
			rs.close();
			pstmt.close();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
