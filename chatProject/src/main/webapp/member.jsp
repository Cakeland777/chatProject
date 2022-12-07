<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"
    pageEncoding="UTF-8"
    import="member.*"
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style>
h2 {
text-align: center;
background-color:lightblue;
color:white;
}
#buttons{

align-content: left;
}

</style>
  <meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
<h2>가입회원정보</h2>
<%
   request.setCharacterEncoding( "utf-8" );
   String _name = request.getParameter("name");
   Member member=new Member();
   member.setName(_name);
   MemberRepositoryDB db=MemberRepositoryDB.getInstance();
   List membersList=db.listMembers(member);
%>
<form method="post" action="member.jsp">
이름:<input type="text" name="name">
<input type="submit" value=" 조회하기">

</form>
 <table border='1' width='800' align='center'>
   <tr align='center'  bgcolor='lightblue'> 
     <td>아이디</td>
     <td>비밀번호</td>
     <td>이름</td>
     <td >이메일</td>
     <td>주소</td>
     <td>전화번호</td>
     <td>성별</td>
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
   <div id="buttons">
          <input type="reset" class="btn btn-secondary" onclick="location.href='index.jsp'"  value="돌아가기">
        </div>
</body>
</html>
