
<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"
    pageEncoding="UTF-8"
    import="board.*"
%>

<!DOCTYPE html>
<html>
<head>
<style>
h1{
background-color: lightblue;
color:white;
}
h2{
color:white;
background-color: lightblue;
}
.bi-house-fill{
color:white;
}
a {
  text-decoration: none;
}
  td {
        text-align: center;
      }
 .con:hover{
      background: lightgrey;
      color:white;
      }
      th{
      color:white;
      }
</style>
  <link rel="stylesheet" href="htps://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

  <meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<h1 class="header"><a href="/chatProject/index.jsp"><i class="bi bi-house-fill" ></i></a> 게시판</h1>

<%
   request.setCharacterEncoding( "utf-8" );
   String type = request.getParameter("type");
   String content=request.getParameter("SearchContent");
   Board board=new Board();
   BoardDB db=BoardDB.getInstance();
   List boardList=db.searchBoards(type,content);
   
   
%>
<form method="post" action="boardList.jsp">
  <select class="form-select" id="type" name="type" aria-label="Default select example" required>
  <option selected>선택</option>
    <option value="all">전체</option>
  <option value="userid">작성자 아이디</option>
  <option value="title">제목</option>
  <option value="content">내용</option>
</select>
<input type="text" id="SearchContent"name="SearchContent">
        <div id="buttons">
          <input type="submit" class="btn btn-outline-info stretched-link" value="검색">
          <input type="button" class="btn btn-outline-info stretched-link" onclick="location.href='BoardForm.jsp'"  value="글 작성">
        </div>

</form>
<table class="table table-sm table-hover">
            <thead style="border-top: 1px solid #dee2e6;" >
                <tr class="text-center"  bgcolor="lightblue" style="font-weight: bold"; >
                    <th style="font-weight: bold; font-size: 16px;">번호</th>
                    <th style="font-weight: bold; font-size: 16px;">유형</th>
                       <th style="font-weight: bold; font-size: 16px;">제목</th>
                    <th style="font-weight: bold; font-size: 16px;">작성자</th>
                    <th style="font-weight: bold; font-size: 16px;">등록시간</th>
                    <th style="font-weight: bold; font-size: 16px;">조회수</th>
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
      int count=vo.getCount();

%>  
<tr class="table-secondary text-center" style="font-weight: bold; cursor:pointer;" onclick="#">
                    <td ><%= i+1%></td>
                    <td><%= type1 %></td>
                    <td class="con" style="width:50%"><i class="fas fa-bullhorn"></i>&nbsp;&nbsp;&nbsp;<a href="boardList/view?id=<%=id %>"><%= title %></a></td>
                      <td ><%= name%>(<%=uid %>)</td>
                    <td><%=time  %></td>
                    <td ><%=count  %></td>
                </tr>
    
     
                
<%		
   }
%>	
</table>

</body>
</html>
