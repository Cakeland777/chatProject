package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDB {
	private MemberDB() {
	}

	private static MemberDB instance = new MemberDB();

	public static MemberDB getInstance() {

		return instance;
	}

//	List<Member> memberList = null;
//	Map<String, Member> memberMap = null;
	Connection conn = null;
	PreparedStatement pstmt = null;

	public void open() {
		try {
			// Class.forName("oracle.jdbc.OracleDriver");
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

	public List<Member> memberList() {
		List<Member> list = new ArrayList<>();

		try {
			open();

			pstmt = conn.prepareStatement("select * from chat_member");

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member(rs.getString("USERID"), rs.getString("PWD"), rs.getString("NAME"),
						rs.getString("SEX"), rs.getString("ADDRESS"), rs.getString("PHONE"), rs.getString("EMAIL"),
						rs.getString("ADMIN"), rs.getString("LOGIN_CHECK"));
				list.add(member);
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

	public Member getMember(String userid) {
		Member updateMember = new Member();
		String sql = "select * from chat_member where userid=? ";
		ResultSet rs = null;
		try {
			open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				updateMember.setUid(rs.getString("userid"));
				updateMember.setName(rs.getString("name"));
				updateMember.setPwd(rs.getString("pwd"));
				updateMember.setEmail(rs.getString("email"));
				updateMember.setAddress(rs.getString("address"));
				updateMember.setSex(rs.getString("sex"));
				updateMember.setPhone(rs.getString("phone"));
				updateMember.setLogin_check(rs.getString("login_check"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return updateMember;

	}

	public Member login(Member member) {
		Member loginMember = new Member();
		String sql = "select * from chat_member where userid=? and pwd=?";
		ResultSet rs = null;
		try {
			open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUid());
			pstmt.setString(2, member.getPwd());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				loginMember.setUid(rs.getString("userid"));
				loginMember.setName(rs.getString("name"));
				loginMember.setPwd(rs.getString("pwd"));
				loginMember.setEmail(rs.getString("email"));
				loginMember.setAddress(rs.getString("address"));
				loginMember.setPhone(rs.getString("phone"));
				loginMember.setSex(rs.getString("sex"));
				loginMember.setAdmin(rs.getString("admin"));
				loginMember.setLogin_check(rs.getString("login_check"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return loginMember;

	}

	public int updateMember(Member member) {
		int result = -1;
		String sql = "update chat_member set name=?,pwd=?,email=?,address=?,phone=?,sex=? where userid=?";
		try {
			open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getSex());
			pstmt.setString(7, member.getUid());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			close();
		}

		return result;
	}

	public void delete(String userid) {
		try {
			open();
			pstmt = conn.prepareStatement("delete from chat_member where userid=?");
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

	}

	public Member findPwd(Member member) {
		Member findMember = new Member();
		String sql = "select * from chat_member where userid=? and phone=?";
		ResultSet rs = null;
		try {
			open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUid());
			pstmt.setString(2, member.getPhone());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				findMember.setUid(rs.getString("userid"));
				findMember.setName(rs.getString("name"));
				findMember.setPwd(rs.getString("pwd"));
				findMember.setEmail(rs.getString("email"));
				findMember.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return findMember;

	}

	public Member findId(Member member) {
		Member findMember = new Member();
		String sql = "select * from chat_member where name=? and phone=?";
		ResultSet rs = null;
		try {
			open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPhone());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				findMember.setUid(rs.getString("userid"));
				findMember.setName(rs.getString("name"));
				findMember.setPwd(rs.getString("pwd"));
				findMember.setEmail(rs.getString("email"));
				findMember.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return findMember;

	}

	public void ChangeStatus(String id) {

		Member member = getMember(id);
		String status = member.getLogin_check();
		String sql = null;
		if (status.equals("T")) {

			sql = "update chat_member set login_check='F' where userid=?";
		} else {

			sql = "update chat_member set login_check='T' where userid=?";
		}

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

	public List listMembers(Member member) {
		List membersList = new ArrayList();
		String _name = member.getName();
		try {
			open();
			String sql = "select * from chat_member";
			if ((_name != null && _name.length() != 0)) {

				sql += " where name=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, _name);

			} else {

				pstmt = conn.prepareStatement(sql);

			}
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("userid");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String address = rs.getString("address");
				String sex = rs.getString("sex");
				String phone = rs.getString("phone");
				String login_check = rs.getString("login_check");
				Member vo = new Member();
				vo.setUid(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setEmail(email);
				vo.setSex(sex);
				vo.setAddress(address);
				vo.setPhone(phone);
				vo.setLogin_check(login_check);
				membersList.add(vo);

			}
			close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return membersList;

	}

	public int insertMember(Member member) {
		int result = -1;

		String sql = "insert into chat_member (USERID, PWD, NAME,ADDRESS,SEX, PHONE,EMAIL) values (?,?,?,?,?,?,?) ";
		try {
			open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUid());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getSex());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getEmail());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}
		return result;
	}

	public boolean overlappedID(String id) {
		boolean result = false;
		try {
			open();
			String sql = "select decode(count(*),1,'true','false') as result from chat_member where userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = Boolean.parseBoolean(rs.getString("result"));

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
}
//		   public static void main(String [] args) {
//		      MemberRepositoryDB memberRepositoryDB = new MemberRepositoryDB();
//		      List<Member> list = memberRepositoryDB.memberList();
//		      
//		      System.out.println(list);
//		   }
