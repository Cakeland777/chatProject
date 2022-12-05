<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"
    pageEncoding="UTF-8"
    import="member.*"
%>
<!DOCTYPE html>
<html>
<head>
<style>
h1 {
text-align: center;
}
</style>
  <meta charset="UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
<h1>회원 정보 출력</h1>
<%
   request.setCharacterEncoding( "utf-8" );
   String _name = request.getParameter("name");
   Member member=new Member();
   member.setName(_name);
   MemberRepositoryDB db=MemberRepositoryDB.getInstance();
   List membersList=db.listMembers(member);
%>
 <table border='1' width='800' align='center'>
   <tr align='center' bgcolor='MistyRose'> 
     <td>아이디</td>
     <td>비밀번호</td>
     <td>이름</td>
     <td >이메일</td>
     <td>주소</td>
     <td>전화번호</td>
     <td>혜빈 ㅎㅎ</td>
</tr>
<%	
   for (int i=0; i < membersList.size(); i++){
      Member vo=(Member) membersList.get(i);
      String id=vo.getUid();
      String pwd=vo.getPwd();
      String name=vo.getName();
      String email=vo.getEmail();
      String address=vo.getAddress();
      String sex=vo.getSex();
      String phone=vo.getPhone();
%>
     <tr align=center>
       <td><%= id %></td>
       <td><%= pwd %></td>
       <td><%= name %></td>
       <td><%= email %></td>
       <td><%=address  %></td>
       <td><%=phone  %></td>
       <td><%=sex %></td>
     </tr>
   
<%		
   }
%>	
</table>
</body>
</html>
