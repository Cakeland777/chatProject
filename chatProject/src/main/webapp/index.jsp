<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="member.*"
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>


   .header{
  margin-top:50px;
   color:white;
   text-align: center;
   }
body {
  margin: 0;
  height: 100%;
  background-image: linear-gradient(to top, #d9afd9 0%, #ADD8E6 100%);
  background-repeat: no-repeat;
  background-size: cover;
  background-attachment: fixed;
}

.wrap{

 width:300px;
    height:300px;
    position:absolute;
    left:50%;
    top:50%;
    margin-left:-150px;
    margin-top:-150px;
    text-align: center;

}
.bi{
color:SlateBlue ;
margin-right: 5px;
font-size: 20px;
font-weight: bold;
}

</style>
<title>메인</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>
<script>


</script>
<c:choose>
<c:when test ="${user eq null}">
<h1 class="header">&nbsp;</h1>
<div class="wrap">
<div class="card" style="width: 18rem; " >

  <div class="card-body">
<i class="bi bi-door-open-fill" width="20" height="20" ></i>
    <a href="loginForm.jsp" class="btn btn-outline-info stretched-link">로그인</a>
  </div>
</div><div class="card" style="width: 18rem; " >
  <div class="card-body">
<i class="bi bi-pencil-square"color="mediumturquoise"  width="20" height="20" ></i>
    <a href="user.jsp" class="btn btn-outline-info stretched-link">회원가입</a>
  </div>
</div>
<div class="card" style="width: 18rem; " >
  <div class="card-body">
<i class="bi bi-question-circle-fill" color="mediumturquoise"  width="20" height="20"></i>
    <a href="FindInfo.jsp" class="btn btn-outline-info stretched-link">회원정보 찾기</a>
  </div>
</div>

</div>
</body>
</html>
</c:when>
<c:when test="${user.admin == '1'}">
<h2 class="header">관리자 페이지</h2>
<div class="wrap">
<div class="card" style="width: 18rem; " >
  <div class="card-body">
<i class="bi bi-info-square"color="mediumturquoise"  width="20" height="20" ></i>
    <a href="member.jsp" class="btn btn-outline-info stretched-link">가입회원 확인</a>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <div class="card-body">
<i class="bi bi-card-text"color="mediumturquoise"  width="20" height="20"></i>
    <a href="boardList.jsp" class="btn btn-outline-info stretched-link">게시판</a>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <div class="card-body">
<i class="bi bi-door-open-fill"color="mediumturquoise"  width="20" height="20" ></i>
    <a href="logout" class="btn btn-outline-info stretched-link">로그아웃</a>
  </div>
</div>
</div>

</body>
</html>
</c:when>
<c:otherwise>
	<h2 class="header">${user.name}님 안녕하세요</h2>
	<div class="wrap">
<div class="card" style="width: 18rem;">
  <div class="card-body">
<i class="bi bi-door-open-fill"color="mediumturquoise"  width="20" height="20" ></i>
    <a href="logout" class="btn btn-outline-info stretched-link">로그아웃</a>
  </div>
</div>

<div class="card" style="width: 18rem;">
  <div class="card-body">
<i class="bi bi-card-text"color="mediumturquoise"  width="20" height="20"></i>
    <a href="boardList.jsp" class="btn btn-outline-info stretched-link">게시판</a>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <div class="card-body">
<i class="bi bi-chat-dots"color="mediumturquoise"  width="20" height="20"></i>
    <a href="listrooms.jsp" class="btn btn-outline-info stretched-link">채팅</a>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <div class="card-body">
<i class="bi bi-info-square" width="20" height="20"></i>
    <a href="detailMember" class="btn btn-outline-info stretched-link">마이페이지</a>
  </div>
</div>
</div>
	
</body>
</html></c:otherwise></c:choose>