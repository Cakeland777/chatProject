
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
      <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <script>
        jQuery(function($){
            $("#boardTable").DataTable(
            		searching: false,
            		// 정렬 기능 숨기기
            		ordering: false,
            		// 정보 표시 숨기기
            		info: false,
          
            );
        });
    </script>

  <meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
 

<jsp:include page="navBar.jsp"/>

<div class="form" align="center">
<form method="post" name="searchForm"  action="./listArticles.do">
  <select class="form-select" id="type" name="type" aria-label="Default select example" required>
  <option selected value="all">전체</option>
  <option value="title">제목</option>
  <option value="content">내용</option>
  <option value="userid">작성자 아이디</option>
  <option value="username">작성자 이름</option>
</select>
<input type="hidden" name="pageNo" id="pageNo" value="${currentPageNo}"/>
<input type="text" id="content"name="content"value="${param.text}">
<button class="w-btn w-btn-blue" onclick="jsSearch()"  type="submit">
 <i class="bi bi-search" style="font-size: 10px"></i>
    </button>
    <button class="w-btn w-btn-blue" type="button" onclick="location.href='./articleForm.do'">
        글 작성
    </button>

</form></div>
<table id="boardTable" class="table table-sm table-hover" style="margin-left: auto; margin-right: auto;">
            <thead style="border-top: 1px solid #dee2e6;" >
                <tr class="text-center"  bgcolor="lightblue" style="font-weight: bold" >
                    <th style="font-weight: bold; font-size: 16px; text-align: center;">번호</th>
                    <th style="font-weight: bold; font-size: 16px;text-align: center;">유형</th>
                       <th style="font-weight: bold; font-size: 16px;text-align: center;">제목</th>
                    <th style="font-weight: bold; font-size: 16px;text-align: center;">작성자</th>
                    <th style="font-weight: bold; font-size: 16px;text-align: center;">등록시간</th>
                    <th style="font-weight: bold; font-size: 16px;text-align: center;">조회수</th>
                </tr>
<c:choose>
<c:when test="${empty articlesList }">

                    <td >등록된 글이 없습니다</td>
                    </tr>
</c:when>
<c:when test="${!empty articlesList }">
<c:forEach var="article" items="${articlesList }" varStatus="i">
<tr class="table-secondary text-center" style="font-weight: bold; cursor:pointer;" onclick="#">
                    <td >${((currentPageNo-1)*10+i.index)+1}</td>
                    <td>${article.type}</td>
                    <c:choose>
                    <c:when test="${article.id ne article.parent_no }">
                   <td class="con" style="width:50%;text-align: left;text-indent: 40px; "><i class="fas fa-bullhorn"></i>&nbsp;&nbsp;&nbsp;<a href="./viewArticle.do?id=${article.id}"><span style="font-size: 12px;">[답변] </span>${article.title }</a></td>
                    </c:when>
                    <c:otherwise>
                    <td class="con" style="width:50%; text-align: left;"><i class="fas fa-bullhorn"></i>&nbsp;&nbsp;&nbsp;<a href="./viewArticle.do?id=${article.id}">${article.title }</a></td>
                      </c:otherwise>
                      </c:choose>
                      <td >${article.name}(${article.userid})</td>
                    <td>${article.time}</td>
                    <td >${article.count}</td>
                </tr>
    </c:forEach>
    </c:when>
    </c:choose>
     

</table>
<div class="paging" style="text-align: center;">

	<c:if test="${currentPageNo != 1}">
		<a href="javascript:movePage(1)"> &lt;&lt; </a>
		&nbsp;
		<a href="javascript:movePage(${currentPageNo-1})"> &lt; </a>
		&nbsp;
	</c:if>
	
	<c:forEach var="pageNo" begin="${startPageNo}" end="${endPageNo}">
		<c:choose>
			<c:when test="${currentPageNo == pageNo}">
				<span style="font-size:1.3rem;">${pageNo}</span>
			</c:when>
			<c:otherwise>
				<a href="javascript:movePage(${pageNo})">${pageNo}</a>
			</c:otherwise>
		</c:choose>
		&nbsp;
	</c:forEach>
	
	<c:if test="${currentPageNo != totalPageNo}">
		<a href="javascript:movePage(${currentPageNo+1})"> &gt; </a>
		&nbsp;
		<a href="javascript:movePage(${totalPageNo})"> &gt;&gt; </a>
	</c:if>
	<br>

	

</div>
	
<script type="text/javascript">
function movePage(pageNo) {
	document.querySelector("#pageNo").value = pageNo; 
	searchForm.submit();
}
function jsSearch() {
	document.querySelector("#pageNo").value = 1; 
	searchForm.submit();
}
</script>
</body>
</html>
