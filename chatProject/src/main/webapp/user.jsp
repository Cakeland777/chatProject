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
 

<script type="text/javascript" src="userCheck.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="stylesheet" href="css/register.css">
    <link rel="stylesheet" href="css/button.css">
  </head>
  <body> 
  <jsp:include page="navBar.jsp"/>

     <div class="registration-form">
       <form action ="register" method="post" name="userForm">
            <div class="form-icon">
                <span><i class="icon icon-user"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="uid"name="uid" placeholder="아이디"  required>
             
            </div>
  <font id="checkId" size="2"></font>
            <div class="form-group">
                <input type="password" class="form-control item"  id="pwd1"name="pwd1" placeholder="비밀번호"  required>
            </div>
                <div class="form-group">
                <input type="password" class="form-control item"  id="pwd2"name="pwd2" placeholder="비밀번호 확인"  required>
            </div>
           
                <div class="form-group">
                <input type="text" class="form-control item"  id="name"name="name" placeholder="이름">
            </div>
               <div class="form-group">
                <input type="text" class="form-control item"  id="phone"name="phone" placeholder="전화번호">
            </div>
            <div class="form-group">
                <input type="email" class="form-control item"  id="email"name="email" placeholder="이메일">
            </div>
             <div class="form-group">
                <input type="text" class="form-control item"  id="address"name="address" placeholder="주소">
            </div>
            <div class="form-group">
                <input type="radio" name="sex" id="inlineRadio1" value="남">
                남
  
                <input type="radio" name="sex" id="inlineRadio1" value="여">
                  여
            </div>
       
<div class="button_container" >

  <button type="submit" id="register"disabled="disabled"  class="btn" onclick="return check()"><span>가입하기</span></button>
  <button type="button" class="btn" onclick="location.href='index.jsp'" ><span>취소</span></button>
          </div>
        </form>
       </div>
   <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
  <script>
  $("#uid").focusout(function(){
	  let uid=$("#uid").val();  
	  $.ajax({
		  url:"/chatProject/member/IdCheck",
		  type:"post",
		  data:{uid:uid},
		  dataType:"json",
		  success:function(result){
			  if(result==0){
				  $("#checkId").html('사용할 수 없는 아이디');
				  $("#checkId").attr('color','red');
				  $("#register").attr("disabled", true);
			  }else{
				  $("#checkId").html('사용할 수 있는 아이디');
				  $("#checkId").attr('color','green');
				  $("#register").attr("disabled", false);
			  }
		  
		  },
		  error:function(){
			  alert("서버요청실패");
		  }	  
	  } )
  })
  </script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
  </body>
</html>
