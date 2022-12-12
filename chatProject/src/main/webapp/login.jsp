

<%@ page errorPage="error.jsp" 
contentType="text/html; charset=UTF-8"
%>
<%
	
	String nickname = (String)session.getAttribute("nickname");
	if (nickname != null)
	{
		response.sendRedirect("index.jsp");
	}
%>
<HTML>
  <HEAD>
  <style>
  .icon{

font-size: 50px;
color: lightblue;
}
  
  </style>
    <TITLE>
      채팅
    </TITLE>
	 <META http-equiv="pragma" content="no-cache">

	 <script language="JavaScript">
	 <!--
	 if(window.top != window.self)
	 {
		 window.top.location = window.location;
	 }
	 //-->
	 </script>
	 <LINK rel="stylesheet" href="<%=request.getContextPath()%>/chat.css">
    <link rel="stylesheet" href="css/register.css">
    <link rel="stylesheet" href="css/button.css">
       <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
	</HEAD>
	<BODY bgcolor="#FFFFFF" onLoad="document.login.nickname.focus();">
	<jsp:include page="navBar.jsp"/>

    <TABLE width="40%" border="0" cellspacing="1" cellpadding="1" align="center">
      <%
      String d=request.getParameter("d");
      String n=request.getParameter("n");
      String ic = request.getParameter("ic");
		
          if (d!=null && d.equals("t"))
          {
      %>
      <TR>
        <TD>
          <TABLE width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
            <TR>
              <TD colspan="2" align="center">
                <SPAN class="error">Nickname exists</SPAN><BR>
              </TD>
            </TR>
				<TR>
              <TD colspan="2">
                대화명<B><%=n%></B> 은 이미 사용중입니다. 다른 닉네임을 입력해주세요.
              </TD>
            </TR>
          </TABLE>
        </TD>
      </TR>
      <%
        }
        else if (ic!=null && ic.equals("t"))
        {
      %>
      <TR>
        <TD colspan="2">
          <TABLE width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
            <TR>
              <TD colspan="2" align="center">
                <SPAN class="error">Incomplete information</SPAN>
              </TD>
            </TR>
				<TR>
              <TD colspan="2">
                <b> 대화명은</b> 적어도 <b>2</b> 자 이상 입력되어야 하고 공백이 없어야 합니다</b>.
              </TD>
            </TR>
          </TABLE>
        </TD>
      </TR>
      <%
        }
      %>
      <TR>
<!--         <TD colspan="2" class="panel"> -->
<!--           <FORM name="login" method="post" action="login"> -->
<!--             <TABLE width="100%" border="0"> -->
<!--               <TR> -->
<!--                 <TD width="30%" class="white"> -->
<!--                   대화명 -->
<!--                 </TD> -->
<!--                 <TD width="70%"> -->
<%--                   <INPUT type="text"  value ="${user.name}" name="nickname" size="15"> --%>
<!--                 </TD> -->
<!--               </TR> -->
<!--   <TR> -->
<!--                 <TD width="30%" class="white"> -->
<!--                   아이디 -->
<!--                 </TD> -->
<!--                 <TD width="70%"> -->
<%--                   <INPUT type="text"  value ="${user.uid}" name="id" size="15" readonly> --%>
<!--                 </TD> -->
<!--               </TR> -->
<!--               <TR> -->
<!--                 <TD> -->
<!--                  &nbsp;   -->
<!--                 </TD> -->
<!--                 <TD> -->
<!--                   <INPUT type="submit" name="Submit" value="Submit"> -->
<!--                     <div id="buttons"> -->
<!--           <input type="button"  style="margin-top: 5px;" class="btn btn-outline-secondary" onclick="location.href='index.jsp'"  value="돌아가기"> -->
<!--         </div> -->
<!--                 </TD> -->
<!--               </TR> -->
<!--             </TABLE> -->
<!--           </FORM> -->

        </TD>
      </TR>
    </TABLE>
    
    <div class="registration-form">
       <form name="login" method="post" action="login">
        
                <span><i class="icon icon-paper-plane"></i></span>
       
            <div class="form-group">
                대화명  <input type="text" class="form-control item" id="nickname" value ="${user.name}" name="nickname" placeholder="대화명"  >
            </div>
            <div class="form-group">
                아이디  <input type="text" class="form-control item" value ="${user.uid}" name="id" readonly  >
            </div>
  
<div class="button_container" >

  <button type="submit" class="btn" ><span>채팅 접속</span></button>
  <button type="button" class="btn" onclick="location.href='index.jsp'" ><span>돌아가기</span></button>
          </div>
        </form>
       </div>
    
  </BODY>
</HTML>