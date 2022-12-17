
<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"
    pageEncoding="UTF-8"
    import="board.*"
%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 20px ;
    margin-top:10px;
    margin-bottom:10px;

    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 500;
    transition: 0.25s;
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
      
.w-btn-blue {
    background-color: lightblue;
    color: white;
}
.w-btn:hover {
    letter-spacing: 1px;
    transform: scale(1.1);
    cursor: pointer;
}


.w-btn:active {
    transform: scale(1.1);
}
<link rel="stylesheet" href="htps://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

</style>
  

  <meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
 

<jsp:include page="navBar.jsp"/>

<div class="form" align="center">
<form method="post" action="boardList.jsp">
  <select class="form-select" id="type" name="type" aria-label="Default select example" required>
  <option selected>선택</option>
    <option value="all">전체</option>
  <option value="userid">작성자 아이디</option>
  <option value="title">제목</option>
  <option value="content">내용</option>
</select>
<input type="text" id="SearchContent"name="SearchContent">
<button class="w-btn w-btn-blue" type="submit">
 <i class="bi bi-search" style="font-size: 10px"></i>
    </button>
    <button class="w-btn w-btn-blue" type="button" onclick="location.href='BoardForm.jsp'">
        글 작성
    </button>

</form></div>
<table class="table table-sm table-hover" style="margin-left: auto; margin-right: auto;">
            <thead style="border-top: 1px solid #dee2e6;" >
                <tr class="text-center"  bgcolor="lightblue" style="font-weight: bold"; >
                    <th style="font-weight: bold; font-size: 16px;">번호</th>
                    <th style="font-weight: bold; font-size: 16px;">유형</th>
                       <th style="font-weight: bold; font-size: 16px;">제목</th>
                    <th style="font-weight: bold; font-size: 16px;">작성자</th>
                    <th style="font-weight: bold; font-size: 16px;">등록시간</th>
                    <th style="font-weight: bold; font-size: 16px;">조회수</th>
                </tr>
<c:choose>
<c:when test="${empty articlesList }">
등록된 글이 없습니다
</c:when>
<c:when test="${!empty articlesList }">
<c:forEach var="article" items="${articlesList }" varStatus="articleNum">
<tr class="table-secondary text-center" style="font-weight: bold; cursor:pointer;" onclick="#">
                    <td >${articleNum.count }</td>
                    <td>${article.type}</td>
                    <td class="con" style="width:50%"><i class="fas fa-bullhorn"></i>&nbsp;&nbsp;&nbsp;<a href="boardList/view?id=${article.id }">${article.title }</a></td>
                      <td >${article.name}(${article.userid})</td>
                    <td>${article.time}</td>
                    <td >${article.count}</td>
                </tr>
    </c:forEach>
    </c:when>
    </c:choose>
     

</table>

</body>
</html>