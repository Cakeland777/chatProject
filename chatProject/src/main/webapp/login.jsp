<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!
    Connection conn = null; 
    PreparedStatement pstmt = null;	
	ResultSet rs = null;
	//오라클 접속용
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "user1";
	String password = "passwd";
	String sql = "SELECT * FROM CHAT_MEMBER WHERE ID=?";
	//사용자로부터 받는 정보
%>

		<%	
			request.setCharacterEncoding("UTF-8");
			String uid=request.getParameter("uid");
			String pwd=request.getParameter("pwd");
			String result = "실패";

			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, password);
				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery();
				if(rs.next()){
				if(rs.getString("PWD").equals(pwd)){
					String name=rs.getString("name");
					session.setAttribute("userid", uid);
					session.setAttribute("name",name);
					response.sendRedirect("loginSuccess.jsp");
					}
					 else{
						 result = "로그인 실패";
					}
				}
				 else{
					 result = "존재하지 않는 아이디입니다";
				 }
			} catch(SQLException se) {
				se.printStackTrace();
			} finally {
				try{
					if(rs != null) rs.close();
					if(pstmt != null) rs.close();
					if(conn != null) rs.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= result %>
<br>
</body>
</html>