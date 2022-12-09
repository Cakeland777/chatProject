<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="member.*"
    %>

<%
String id = (String)session.getAttribute("userid");
String name = (String)session.getAttribute("name");
// String admin= (String)session.getAttribute("admin");
// String pwd= (String)session.getAttribute("pwd");
// String phone= (String)session.getAttribute("phone");
// String address= (String)session.getAttribute("address");
// String email= (String)session.getAttribute("email");
Member member=(Member)request.getAttribute("member");
session.setAttribute("userid", id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>


   .header{
   background-color: lightblue;
   color:white;
   text-align: center;
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

</style>
<title>메인</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
<script>

function btn(){
	Swal.fire({
		  title: '정말 탈퇴하시겠습니까??',
		  text: "",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: 'skyblue',
		  cancelButtonColor: 'lightcoral',
		  confirmButtonText: '네',
		cancelButtonText:'아니오',
			allowOutsideClick:false
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire({
		    	  position: 'center',
		    	  icon: 'success',
		    	  title: '탈퇴완료',
		    	  showConfirmButton: false,
		    	  timer: 1500
		    	})
		    setTimeout("location.href='DeleteMember'",2000);
		    return true
		  }
		})
}
</script>
<c:if test="${member eq null}">
<%if(id==null){%>
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
</div><div class="card" style="width: 18rem; " >
  <div class="card-body">
<i class="bi bi-question-circle-fill" color="mediumturquoise"  width="20" height="20"></i>
    <a href="FindId.jsp" class="btn btn-outline-info stretched-link">아이디찾기</a>
  </div>
</div><div class="card" style="width: 18rem; " >
  <div class="card-body">
<i class="bi bi-question-circle-fill" color="mediumturquoise"  width="20" height="20"></i>
    <a href="FindPwd.jsp" class="btn btn-outline-info stretched-link">비밀번호찾기</a>
  </div>
</div>
</div>



</body>
</html>

<%}
else if(admin.equals("1")){%>
<h2 class="header">관리자 페이지</h2>
<div class="wrap">
<div class="card" style="width: 18rem; " >
  <div class="card-body">
<i class="bi bi-door-open-fill"color="mediumturquoise"  width="20" height="20" ></i>
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
<%} 
else{%>
	<h2 class="header"><%= name%>님 안녕하세요</h2>
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
<i class="bi bi-card-text"color="mediumturquoise"  width="20" height="20"></i>
    <a href="chatPage.jsp" class="btn btn-outline-info stretched-link">채팅</a>
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
</html><%}%>