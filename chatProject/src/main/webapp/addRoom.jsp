<%@ page session="true" 
contentType="text/html; charset=UTF-8"
%>
<html>
<head>
	<title>방 생성</title>
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/chat.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/register.css">
<style>
.icon-bubble{

font-size: 50px;
color: lightblue;
}
</style>
</head>

<body>
<%@ include file="navBar.jsp" %>

<div align="center">


<div class="registration-form">
	<%
	Object e = request.getAttribute("error");
	String error = null;
	if ( e != null)
	{
		error = (String)e;
	%>
	
	<h3 class="error"><%=error%></h3></td>

	<%
	}
	%>


       <form  action="manageChat" method="post" >
           
                <span><i class="icon icon-bubble"></i></span>
     
            <div class="form-group">
                <input type="text" style= "margin-top: 10px;"class="form-control item" id="rn"name="rn" placeholder="방 이름"  required>
            </div>
            <div class="form-group">
                <textarea class="form-control item" rows="5" cols="30"   id="rd"name="rd" placeholder="설명"  required></textarea>
            </div>
  
<div class="button_container" >

  <button type="submit" class="btn" ><span>생성</span></button>
  <button type="button" class="btn" onclick="location.href='listrooms.jsp'" ><span>취소</span></button>
          </div>
        </form>
       </div>

</div>
<%@ include file="/footer.jsp"%>

</body>
</html>