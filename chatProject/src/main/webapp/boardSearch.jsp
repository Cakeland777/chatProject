<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"
    pageEncoding="UTF-8"
    import="board.*"
%>
<!DOCTYPE html>
<html>
<head>
<style>
table{
 border:1px solid ;

 align:center;
 border-collapse: collapse;

}
tr{
 border:1px solid ;

 align:center;
 border-collapse: collapse;
}
td{
border:1px solid ;

 align:center;
 border-collapse: collapse;
 padding: 0px 5px;
}
</style>
  <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  
<title>게시판</title>
</head>
<body>
<jsp:include page="navBar.jsp"/>
<h2>게시판</h2>
<%
   request.setCharacterEncoding( "utf-8" );
String type = request.getParameter("type");
String content=request.getParameter("SearchContent");
Board board=new Board();
BoardDB db=BoardDB.getInstance();
List boardList=db.searchBoards(type,content);
%>
<form method="post" action="boardSearch.jsp">
  <select class="form-select" id="type" name="type" aria-label="Default select example" required>
  <option selected>선택</option>
   <option value="all">전체</option>
  <option value="userid">작성자 아이디</option>
  <option value="username">작성자명</option>
  <option value="title">제목</option>
  <option value="content">내용</option>
</select>
<input type="text" id="SearchContent"name="SearchContent">
        <div id="buttons">
          <input type="submit"class="btn btn-outline-info stretched-link"value="검색">
          <input class="btn btn-outline-info stretched-link" onclick="location.href='BoardForm.jsp'"  value="글 작성">

        </div>

</form>
 <table class="table">
   <tr align='center' bgcolor='lightblue'> 
     <td>번호</td>
     <td>유형</td>
     <td>작성자</td>
     <td >제목</td>
     <td>등록시간</td>
</tr>
<%	
   for (int i=0; i < boardList.size(); i++){
      Board vo=(Board) boardList.get(i);
      String id=vo.getId();
      String uid=vo.getUserid();
      String name=vo.getName();
      String title=vo.getTitle();
      String content1=vo.getContent();
      String type1=vo.getType();
      String time=vo.getTime();

%>
     <tr align=center>
       <td><%= i+1 %></td>
       <td><%= type1 %></td>
       <td><%=name %>(<%= uid %>)</td>
        <td><a href="boardList/view?id=<%=id %>"><%= content1 %></a></td>
       <td><%=time  %></td>
     </tr>
   
<%		
   }
%>	
</table>
</body>
</html>
