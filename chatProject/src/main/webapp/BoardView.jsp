<%@page import="board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%	Board b = (Board) request.getAttribute("viewBoard");
	String userid = (String)session.getAttribute("userid");
	session.setAttribute("userid", userid);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{background-color: skyblue;
color:white;}
</style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script type="text/javascript" src="updateCheck.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>

<h1>게시글</h1>
<hr>
 
<table>
	<tr>
	<form  method="post" name="boardForm">
<input type="hidden"id="id"name="id" value="${viewBoard.id}" readonly>
<input type="hidden"id="title"name="title" value="${viewBoard.title}" readonly>
		<td>유형 : </td>
		<td>${viewBoard.type } |</td>
		<td>작성자 : </td>
		<td>${viewBoard.name}(${viewBoard.userid}) |</td>
		<td>제목 : </td>
		<td>${viewBoard.title}|</td>

		<td>작성일 : </td>
		<td>${viewBoard.time}</td>
	</tr>
	
	<tr>	
		<td>본문</td>
		<td>${viewBoard.content}</td>
	</tr>
</table>

<%if(b.getUserid().equals(userid)){%>
<input type="submit"class="btn btn-outline-info stretched-link" value="수정" formaction="../UpdateBoardForm.jsp">
<input type="submit" class="btn btn-outline-info stretched-link"value="삭제" formaction="../DeleteBoard">

<input type="reset" class="btn btn-outline-info stretched-link" onclick="location.href='/chatProject/boardList.jsp'"  value="돌아가기">
</form>
 <%}else{%>
 <input type="reset" class="btn btn-outline-info stretched-link" onclick="location.href='/chatProject/boardList.jsp'"  value="돌아가기">
 </form>
 <%}%>


</body>
</html>