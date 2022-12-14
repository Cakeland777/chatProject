<%@page import="board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

  <jsp:include page="navBar.jsp"/>
<br/>
 

	<form  method="post" name="boardForm">
<input type="hidden"id="id"name="id" value="${viewBoard.id}" readonly>
<input type="hidden"id="title"name="title" value="${viewBoard.title}" readonly>
<div class="container">
    <div class="row-mt-5">
        <div class="col-12">

            <div class="card" style="width: 100%;">

                <div class="card-header">
                    <span style="font-size: 18px; color: gray;">[${viewBoard.type}]</span><strong style="font-size: 18px;">${viewBoard.title}</strong>&nbsp;&nbsp;
                    <span style="float:right;">${viewBoard.time}</span>
                </div>
                <div class="card-body" style="min-height: 400px; color:black;">
                 
                    <div>
                        <span><i class="fas fa-user-edit"></i>&nbsp;작성자 : ${viewBoard.name}(${viewBoard.userid})</span>
                        <span style="float:right;">조회수 : ${viewBoard.count}</span>
                    </div>
                    <hr>
                    <div>
                    ${viewBoard.content}
                    </div>
                              <c:choose>
		<c:when test ="${fileName ne null}">
		<img src="boardDown?id=${viewBoard.id}"  width=300 height=300 /><br>
                     <div>
                    첨부파일 : <a href="boardDown?id=${viewBoard.id}">${fileName}</a>
                    </div>
                    </c:when>
                    </c:choose>
                </div>
            </div>

              <hr>
           
            <br>

<c:choose>
<c:when test ="${updated eq true}">
<input type="submit"class="btn btn-outline-info stretched-link" value="수정" formaction="../UpdateBoardForm.jsp">
<input type="submit" class="btn btn-outline-info stretched-link"value="삭제" formaction="../DeleteBoard">

<input type="reset" class="btn btn-outline-info stretched-link" onclick="location.href='/chatProject/boardList.jsp'"  value="돌아가기">
</form>

 </c:when>
<c:when test ="${user.admin eq '1'}">
<input type="submit" class="btn btn-outline-info stretched-link"value="삭제" formaction="../DeleteBoard">

<input type="reset" class="btn btn-outline-info stretched-link" onclick="location.href='/chatProject/boardList.jsp'"  value="돌아가기">
</form>
</c:when>
<c:otherwise>
 <input type="reset" class="btn btn-outline-info stretched-link" onclick="location.href='/chatProject/boardList.jsp'"  value="돌아가기">
 </form>
</c:otherwise>
</c:choose>
</body>
</html>