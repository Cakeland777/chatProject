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
    <div id="container">
      <h1 class="header">회원정보</h1>
     <div class="form-floating">
      <input type="text" value="${userid}"class="form-control" id="uid"name="uid" placeholder="id" readonly="readonly">
      <label for="floatingInput">아이디</label>
    </div>
     <div class="form-floating">
      <input type="text" value="${pwd}"class="form-control" id="pwd"name="pwd" placeholder="pwd" readonly="readonly">
      <label for="floatingInput">비밀번호</label>
      </div>
     <div class="form-floating">
      <input type="text" value="${name}"  class="form-control" id="name" name="name" placeholder="name" readonly="readonly">
      <label for="floatingInput">이름</label>
    </div>
   <div class="form-floating">
      <input type="text" value="${phone}" class="form-control" id="phone"name="phone" placeholder="phone" readonly="readonly">
      <label for="floatingInput">휴대폰</label>
    </div>
   <div class="form-floating">
      <input type="email" value="${email}" class="form-control" id="email"name="email" placeholder="email" readonly="readonly">
      <label for="floatingInput">이메일</label>
    </div>
   <div class="form-floating">
      <input type="text" value="${address}"class="form-control" id="address"name="address" placeholder="address" readonly="readonly">
      <label for="floatingInput">주소</label>
    </div>
  <div class="form-floating">
      <input type="text" value="${sex}" class="form-control" id="sex"name="sex" placeholder="address" readonly="readonly">
      <label for="floatingInput">성별</label>
    </div>
   </div>       
  </body>
</html>
