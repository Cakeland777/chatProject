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

public class BoardFileDB {
	private BoardFileDB() {
	}

	private static BoardFileDB instance = new BoardFileDB();

	public static BoardFileDB getInstance() {

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

	public List<BoardFile> list(int number) {
		List<BoardFile> list = new ArrayList<>();

		try {
			open();

			pstmt = conn.prepareStatement("select * from board_file where id=?");
			pstmt.setInt(1, number);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardFile boardFile = new BoardFile(rs.getInt("ID"), rs.getString("BID"), rs.getString("org_name"),
						rs.getString("real_name"), rs.getString("content_type"), rs.getLong("length"));
				list.add(boardFile);
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

	public BoardFile getBoardFile(String number) {
		BoardFile boardfile = new BoardFile();

		try {
			open();

			pstmt = conn.prepareStatement("select * from board_file where bid=?");
			pstmt.setString(1, number);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				boardfile = new BoardFile(rs.getInt("ID"), rs.getString("BID"), rs.getString("org_name"),
						rs.getString("real_name"), rs.getString("content_type"), rs.getLong("length"));
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return boardfile;
	}

	public void insertBoardFile(String number, String name, String realname, String content, Long length)
			throws SQLException {

		String sql = "insert into board_file(id,bid,org_name,real_name,length,content_type) values (file_seq.nextval,?,?,?,?,?) ";
		try {
			open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, number);
			pstmt.setString(2, name);
			pstmt.setString(3, realname);
			pstmt.setLong(4, length);
			pstmt.setString(5, content);
			pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}

	}

}
