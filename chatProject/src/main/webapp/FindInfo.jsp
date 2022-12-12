<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Info.css">
 <link rel="stylesheet" href="css/button.css">
 
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<jsp:include page="navBar.jsp"/>
<div class="cotn_principal">
<div class="cont_centrar">

  <div class="cont_login">
<div class="cont_info_log_sign_up">
      <div class="col_md_login">
<div class="cont_ba_opcitiy">
  <button type="submit" class="btn" onclick="cambiar_login()"><span>아이디찾기</span></button>
  </div>
  </div>
<div class="col_md_sign_up">
<div class="cont_ba_opcitiy">
  <button type="submit" class="btn1" onclick="cambiar_sign_up()"><span>비밀번호찾기</span></button>
 
</div>
  </div>
       </div>

    
    <div class="cont_back_info">
       
       
    </div>
<div class="cont_forms" >
    
 <div class="cont_form_login">
<a href="#" onclick="ocultar_login_sign_up()" >X</a>

   <h2>아이디 찾기</h2>
    <form action ="IdFind" method="post" name="IdForm">
 <input type="text"  id= "name" name="name" placeholder="이름" />
 <br/>
<input type="text" id="phone" name="phone" placeholder="전화번호" />
<br/>
<button type="submit"  class="btn_login" >검색</button>
</form>
  </div>
  
   <div class="cont_form_sign_up">
<a href="#" onclick="ocultar_login_sign_up()">X</a>
     <h2>비밀번호 찾기</h2>
      <form action ="PwdFind" method="post" name="PwdForm">
 <input type="text"  id= "uid" name="uid" placeholder="아이디" />
 <br/>
<input type="text" id="phone" name="phone" placeholder="전화번호" />
<br/>
<button type="submit" class="btn_sign_up" >검색</button>
</form>
  </div>

    </div>
    
  </div>
 </div>
</div>
<script>
function cambiar_login() {
	  document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";  
	document.querySelector('.cont_form_login').style.display = "block";
	document.querySelector('.cont_form_sign_up').style.opacity = "0";               

	setTimeout(function(){  document.querySelector('.cont_form_login').style.opacity = "1"; },400);  
	  
	setTimeout(function(){    
	document.querySelector('.cont_form_sign_up').style.display = "none";
	},200);  
	  }

	function cambiar_sign_up(at) {
	  document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
	  document.querySelector('.cont_form_sign_up').style.display = "block";
	document.querySelector('.cont_form_login').style.opacity = "0";
	  
	setTimeout(function(){  document.querySelector('.cont_form_sign_up').style.opacity = "1";
	},100);  

	setTimeout(function(){   document.querySelector('.cont_form_login').style.display = "none";
	},400);  


	}    



	function ocultar_login_sign_up() {

	document.querySelector('.cont_forms').className = "cont_forms";  
	document.querySelector('.cont_form_sign_up').style.opacity = "0";               
	document.querySelector('.cont_form_login').style.opacity = "0"; 

	setTimeout(function(){
	document.querySelector('.cont_form_sign_up').style.display = "none";
	document.querySelector('.cont_form_login').style.display = "none";
	},500);  
	  
	  }
	if (${status eq 'IdFind'}) {
		Swal.fire({
			  position: 'center',
			  icon:'question',
			  title: '아이디는 ${id} 입니다',
			  text: '',
			  showConfirmButton: true,

			})
	}
	else if (${status eq 'PwdFind' }) {
		Swal.fire({
			  position: 'center',
			  icon:'question',
			  title: '비밀번호는 ${pwd} 입니다',
			  text: '',
			  showConfirmButton: true,
			 
			})
	}
	else if (${status eq 'Fail' }) {
		Swal.fire({
			  position: 'center',
			  icon:'error',
			  title: '입력값을 다시 확인하세요',
			  text: '존재하는 회원정보가 아닙니다',
			  showConfirmButton: true,
			 
			})
	}




</script>
</body>
</html>