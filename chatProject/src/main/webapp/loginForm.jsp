<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
  
    <title>Login</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
       <script type="text/javascript" src="loginCheck.js"></script>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="stylesheet" href="css/register.css">
    <link rel="stylesheet" href="css/button.css">
  </head>
  <body class="text-center">
  <jsp:include page="navBar.jsp"/>


 <div class="registration-form">
       <form action ="loginMember" method="post" name="userForm">
            <div class="form-icon">
                <span><i class="icon icon-login"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="uid"name="uid" placeholder="아이디"  required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control item"  id="pwd"name="pwd" placeholder="비밀번호"  required>
            </div>
  
<div class="button_container" >

  <button type="submit" class="btn" ><span>로그인</span></button>
  <button type="button" class="btn" onclick="location.href='index.jsp'" ><span>취소</span></button>
          </div>
        </form>
       </div>
   
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
      <script>
if (${status eq 'check'}) {
	Swal.fire({
		  position: 'center',
		  icon:'error',
		  title: '등록되지 않은 회원입니다',
		  text: '입력정보를 확인해주세요',
		  showConfirmButton: false,
		  timer: 2000
		})
}
else if (${status eq 'notuse' }) {
	Swal.fire({
		  position: 'center',
		  icon:'question',
		  title: '미사용 회원입니다',
		  text: '관리자에게 문의하세요',
		  showConfirmButton: false,
		  timer: 2000
		})
}
else if (${status eq 'success' }) {
	Swal.fire({
		  position: 'center',
		  icon:'success',
		  title: '가입완료',
		  showConfirmButton: false,
		  timer: 1800
		})
}

</script>



    
  </body>
</html>