<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
  
    <title>Login</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

       <script type="text/javascript" src="loginCheck.js"></script>
    <!-- Custom styles for this template -->
   <link href="css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin" >
  <form action="loginMember" method="post" >
<!--     <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
    <h1 class="header">로그인</h1>

     <div class="form-floating">
      <input type="text" class="form-control" id="uid"name="uid" placeholder="id" required>
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="pwd" name="pwd"placeholder="Password" required>
      <label for="floatingPassword">비밀번호</label>
    </div>
    <div id="buttons">
          <input type="submit" class="btn btn-secondary" value="로그인">
        <input type="reset" class="btn btn-secondary"onclick="location.href='index.jsp'"  value="취소">
        </div>
   
  </form>
</main>


    
  </body>
</html>