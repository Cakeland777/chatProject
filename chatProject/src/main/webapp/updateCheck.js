function check() {
    if (document.userForm.uid.value == "") {
		Swal.fire('아이디를 입력해주세요','','warning')
   
        document.userForm.uid.focus();
        return false;
    } 
    else if (document.userForm.name.value == "") {
        Swal.fire(
		  '이름을 입력해주세요',
		  '',
		  'warning'
		)
        document.userForm.name.focus();
        return false;
    } 
    else if (document.userForm.pwd1.value == "") {
        Swal.fire(
		  '비밀번호를 입력해주세요',
		  '',
		  'warning'
		)
        document.userForm.pwd1.focus();
        return false;
    } else if (document.userForm.pwd2.value == "") {
             Swal.fire(
		  '비밀번호 확인란을 입력해주세요',
		  '',
		  'warning'
		)
        document.userForm.pwd2.focus();
        return false;
    } else if (document.userForm.pwd1.value != document.userForm.pwd2.value) {
		       Swal.fire(
		  '비밀번호와 비밀번호 확인값이 다릅니다',
		  '',
		  'warning'
		)
        document.userForm.pwd2.focus();
        return false;
    } else if (document.userForm.email.value == "") {
		        Swal.fire(
		  '이메일을 입력해주세요',
		  '',
		  'warning'
		)
        document.userForm.email.focus();
        return false;
    }  else if (document.userForm.adress.value == "") {
		        Swal.fire(
		  '주소를 입력해주세요',
		  '',
		  'warning'
		)
        document.userForm.adress.focus();
        return false;
    } else if (document.userForm.phone.value == "") {
		        Swal.fire(
		  '핸드폰 번호를 입력해주세요',
		  '',
		  'warning'
		)
        document.userForm.phone.focus();
        return false;
    } 
    else if (document.userForm.sex.value == "") {
		        Swal.fire(
		  '성별을 입력해주세요',
		  '',
		  'warning'
		)
        document.userForm.sex.focus();
        return false;
    }  
     else {
	
        return true;
    }
 
}
