<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>회원 가입</title>
    <style>
      #container {
        width:600px;
        margin:10px auto;
      }
      #buttons{
       justify-content: center;
       }
       .side{
       position:sticky;
       position:-webkit-sticky;
       top:-60px;
       }
      ul{
   list-style:none;
   }
   .header{
   background-color: lightblue;
   color:white;
   }
   .mb-3{
   margin:10px;
   padding:10px;
   }
   .form-floating{
   margin:10px;
   }
    </style>
   
<script type="text/javascript" src="userCheck.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="stylesheet" href="css/register.css">
  </head>
  <body> 
  <jsp:include page="index.jsp"/>
  <script>
  
  if (${status eq 'fail'}) {
		Swal.fire({
			  position: 'center',
			  icon:'error',
			  title: '이미 존재하는 아이디입니다',
			  showConfirmButton: false,
			  timer: 1500
			})
	}
  
  </script>
  <article>
    <div id="container">
      <h1 class="header">회원 가입</h1>
      <form action ="register" method="post" name="userForm">
        <fieldset>
  
     <div class="form-floating">
      <input type="text" class="form-control" id="uid"name="uid" placeholder="id">
      <label for="floatingInput">아이디</label>
    </div>
  
     <div class="form-floating">
      <input type="password" class="form-control" id="pwd1"name="pwd1" placeholder="pwd">
      <label for="floatingInput">비밀번호</label>
    </div>
       <div class="form-floating">
      <input type="password" class="form-control" id="pwd2"name="pwd2" placeholder="pwd2">
      <label for="floatingInput">비밀번호확인</label>
    </div>
     <div class="form-floating">
      <input type="text" class="form-control" id="name"name="name" placeholder="name">
      <label for="floatingInput">이름</label>
    </div>
   <div class="form-floating">
      <input type="text" class="form-control" id="phone"name="phone" placeholder="phone">
      <label for="floatingInput">휴대폰</label>
    </div>
   <div class="form-floating">
      <input type="email" class="form-control" id="email"name="email" placeholder="email">
      <label for="floatingInput">이메일</label>
    </div>

   <div class="form-floating">
      <input type="text" class="form-control" id="address"name="address" placeholder="address">
      <label for="floatingInput">주소</label>
    </div>
<div class="mb-3">
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="sex" id="inlineRadio1" value="남">
  <label class="form-check-label" for="inlineRadio1">남</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="sex" id="inlineRadio2" value="여">
  <label class="form-check-label" for="inlineRadio2">여</label>
</div>
</div>
         
        </fieldset>
        <div id="buttons">
          <input type="submit" class="btn btn-secondary" value="가입하기"onclick="return check()">
          <input type="reset" class="btn btn-secondary" onclick="location.href='index.jsp'"  value="취소">

        </div>
      </form>
    </div>           
  </body>
</html>
