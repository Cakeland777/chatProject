<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
      <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
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
      <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
    <script type="text/javascript" src="updateCheck.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="stylesheet" href="css/register.css">
     <link rel="stylesheet" href="css/button.css">
  </head>
  <body> 
  <jsp:include page="navBar.jsp"/>
 <div id="container">
      <div class="registration-form">
       <form action ="updateMember"  method="post" name="userForm">
            <div class="form-icon">
                <span><i class="icon icon-pencil"></i></span>
            </div>
     <div class="form-floating">
      <input type="text" value="${user.uid}"class="form-control" id="uid"name="uid" placeholder="id" readonly="readonly">
      <label for="floatingInput">아이디</label>
    </div>
          <div class="form-floating">
      <input type="password" class="form-control" id="pwd1"name="pwd1" >
      <label for="floatingInput">비밀번호</label>
    </div>
           <div class="form-floating">
      <input type="password" class="form-control" id="pwd2"name="pwd2" >
      <label for="floatingInput">비밀번호확인</label>
    </div>
           <div class="form-floating">
      <input type="text" value="${user.name}"class="form-control" id="name"name="name" >
      <label for="floatingInput">이름</label>
    </div>
                  <div class="form-floating">
      <input type="text" value="${user.phone}"class="form-control" id="phone"name="phone" >
      <label for="floatingInput">전화번호</label>
    </div>
                       <div class="form-floating">
      <input type="text" value="${user.email}"class="form-control" id="email"name="email" >
      <label for="floatingInput">이메일</label>
    </div>
     <div class="form-floating">
      <input type="text" value="${user.address}"class="form-control" id="address"name="address" >
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
<div class="button_container" >
     			<button type="submit"class="btn" onclick="return check()" ><span>수정하기</span></button>
              <button type="button" class="btn" onclick="location.href='detailMember'" ><span>돌아가기</span></button>
          </div>
        </form>
       </div>
   </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>         
               
  </body>
</html>
