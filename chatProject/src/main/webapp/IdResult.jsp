<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
      <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
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
    <jsp:include page="navBar.jsp"/>
    <div id="container">
      <h1 class="header">아이디 찾기</h1>
      <form action ="#" method="post" name="PwdForm">
        <fieldset>
<h5>아이디:${id}</h5>

        </fieldset>
        <div id="buttons">
          <input type="button" class="btn btn-secondary" value="로그인 화면으로"onclick="location.href='loginForm.jsp'">
          <input type="reset" class="btn btn-secondary" onclick="location.href='index.jsp'"  value="메인으로">
        </div>
      </form>
    </div> 
    
              
  </body>
</html>
