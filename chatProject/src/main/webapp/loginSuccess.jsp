<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("userid");
	String name = (String)session.getAttribute("name");
	session.setAttribute("userid", id);
%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<style>
   .header{
   background-color: lightblue;
   color:white;
   }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
<h2 class="header"><%=name %>님 안녕하세요</h2>
<div class="card" style="width: 18rem;">
  <div class="card-body">
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" color="mediumturquoise"  fill="currentColor" class="bi bi-door-open-fill" viewBox="0 0 16 16">
  <path d="M1.5 15a.5.5 0 0 0 0 1h13a.5.5 0 0 0 0-1H13V2.5A1.5 1.5 0 0 0 11.5 1H11V.5a.5.5 0 0 0-.57-.495l-7 1A.5.5 0 0 0 3 1.5V15H1.5zM11 2h.5a.5.5 0 0 1 .5.5V15h-1V2zm-2.5 8c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
</svg>
    <a href="logout" class="btn btn-outline-info stretched-link">로그아웃</a>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <div class="card-body">
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" color="mediumturquoise" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
</svg>
    <a href="memberUpdate.jsp" class="btn btn-outline-info stretched-link">회원정보수정</a>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <div class="card-body">
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" color="mediumturquoise" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
</svg>
    <a href="BoardForm.jsp" class="btn btn-outline-info stretched-link">게시글 작성</a>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <div class="card-body">
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" color="mediumturquoise" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
</svg>
    <a href="boardList.jsp" class="btn btn-outline-info stretched-link">게시판</a>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <div class="card-body">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"color="mediumturquoise" fill="currentColor" class="bi bi-question-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z"/>
</svg>
    <a href="#" class="btn btn-outline-info stretched-link">회원탈퇴</a>
  </div>
</div>

</body>
</html>