<%@page import="java.sql.*"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

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
	String sql = "insert into CHAT_MEMBER (ID, EMAIL,PWD, NAME, PHONE) values (?,?,?,?,?)";
	//사용자로부터 받는 정보
%>

		<%	
			request.setCharacterEncoding("UTF-8");
			String uid=request.getParameter("uid");
			String pwd=request.getParameter("pwd1");
			String email=request.getParameter("email");
			String pwd2=request.getParameter("pwd2");
			String name=request.getParameter("name");
			String phone= request.getParameter("phone");

			
			String result="이미 존재하는 아이디입니다";
			

			try{
				if(pwd.equals(pwd2)){
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, password);
				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1, uid);
				pstmt.setString(2, email);
				pstmt.setString(3, pwd);
				pstmt.setString(4, name);
				pstmt.setString(5, phone);
				rs = pstmt.executeQuery();
				result="가입 성공";
				response.sendRedirect("loginForm.html");
				}
				else{
					 result = "비밀번호를 다시 확인해주세요";
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

</body>
</html>