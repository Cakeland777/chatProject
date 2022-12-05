
function check() {
    if (document.userForm.uid.value == "") {
		Swal.fire(
	  '아이디를 입력해주세요',
	  '',
	  'warning'
	)
   
        document.userForm.uid.focus();
        return false;
    } 
    
    else if (document.userForm.pwd.value == "") {
        Swal.fire(
		  '비밀번호를 입력해주세요',
		  '',
		  'warning'
		)
        document.userForm.pwd1.focus();
        return false;
    }  else {
        return true;
    }
 
}
