<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"
    pageEncoding="UTF-8"
    import="member.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style>
h2 {
text-align: center;
background-color:lightblue;
color:white;
}
#buttons{
	text-align: center;
}
.search{
text-align: center;
}
 a:link, a:visited {
     background-color: darkgrey;
     color: white;
     padding: 10px 15px;
     text-align: center;
     text-decoration: none;
     display: block;
     
}
 a:hover, a:active {
     background-color: skyblue;
}


</style>
  <meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
<h2>가입회원정보</h2>

<div class="search">
<form method="post" action="./listMembers.do">
이름:<input type="text" name="name">
<input type="submit"class="btn btn-outline-secondary" style="margin-bottom: 5px;" value=" 조회하기">

</form></div>
 <table border='1' width='800' align='center' style="background-color: white">
   <tr align='center'  bgcolor='lightblue'> 
   <div class="title">
     <td>아이디</td>
     <td>비밀번호</td>
     <td>이름</td>
     <td >이메일</td>
     <td>주소</td>
     <td>전화번호</td>
     <td>성별</td>
     <td></td>
     <td></td>
     </div>
</tr>

<c:forEach var="mem" items="${membersList }">
     <tr align=center>
       <td>${mem.uid }</td>
       <td>${mem.pwd }</td>
       <td>${mem.name }</td>
       <td>${mem.email }</td>
       <td>${mem.address }</td>
       <td>${mem.phone }</td>
       <td>${mem.sex }</td>
       <td><div id="buttons">
     
          <a class="deleteUids" data-uid="${mem.uid}">탈퇴처리</a>
          <c:choose>
          <c:when test="${mem.login_check eq 'T' }">
          <td><a href="../adminUse?id=${mem.uid }">미사용변경</a>
          </div></td>  
          </c:when>
		  <c:otherwise>
 		<td><a href="../adminUse?id=${mem.uid }">사용변경</a>
          </div></td>
            
  </c:otherwise>
 
</c:choose>	
 </c:forEach>
 </tr>
</table>
   <div id="buttons">
          <input type="button"  style="margin-top: 5px;" class="btn btn-outline-secondary" onclick="location.href='../index.jsp'"  value="돌아가기">
        </div>
           <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
        
        <script type="text/javascript">
        $(".deleteUids").on("click", e => {
        	let aLink = e.target;
        	
    		e.preventDefault();
        	if (!confirm("삭제하시겠습니까?")) return;
        	
        	let param = {
        		uid : aLink.getAttribute("data-uid") 	
        	};     
        
        $.ajax({
			type:"post"
			,async: true
			,url : "<c:url value='/adminDelete'/>"
			,data : JSON.stringify(param)	
			,dataType : "JSON"
			,contentType:"application/json;charset=utf-8"
			,success : (jsonResult, textStatus) => {
				alert(jsonResult.message);
				if (jsonResult.status == true) {
					searchForm.submit();    			
				}
			}
 		});
    });
        
        
        </script>
</body>
</html>
