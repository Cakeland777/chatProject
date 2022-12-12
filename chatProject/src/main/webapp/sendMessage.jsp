
<%@ page isErrorPage="false" errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,chat.*"
contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<% 
	
	String nickname = (String)session.getAttribute("nickname");
	
	if (nickname != null && nickname.length() > 0)
	{
		ChatRoomList roomList = (ChatRoomList)application.getAttribute("chatroomlist");
		ChatRoom chatRoom = roomList.getRoomOfChatter(nickname);
		if ( chatRoom != null)
		{
			String msg = request.getParameter("messagebox");
			
			if ( msg != null && msg.length() > 0)
			{
				msg = msg.trim();
				chatRoom.addMessage(new Message(nickname, msg, new java.util.Date().getTime()));
			}
	
%>
<!DOCTYPE html>
<html lang="ko">
<HEAD>
<LINK rel="stylesheet" type="text/css" href="chat.css">
<META http-equiv="pragma" content="no-cache">

<style>.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 20px ;
    margin-top:10px;
    margin-bottom:10px;
margin-left:10px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 500;
    transition: 0.25s;
}

a {
  text-decoration: none;
}
  td {
        text-align: center;
      }
 .con:hover{
      background: lightgrey;
      color:white;
      }
      th{
      color:white;
      }
      
.w-btn-blue {
    background-color: lightblue;
    color: white;
}
.w-btn:hover {
    letter-spacing: 1px;
    transform: scale(1.1);
    cursor: pointer;
}


.w-btn:active {
    transform: scale(1.1);
}</style>
</HEAD>
<BODY onLoad="document.msg.messagebox.focus();" bgcolor="#FFFFFF">
<TABLE width="100%" cellpadding="3" cellspacing="0">
	<TR> 
		<TD width="50%" align="left" valign="top"> 
			<TABLE>
				<TR> 
					<FORM name="msg" action="sendMessage.jsp" method="post">
						<TD width="100%"> 
							<INPUT type="text" name="messagebox" maxlength="300" size="35">
							<INPUT type="hidden" name="nickname" value="<%=session.getAttribute("nickname")%>">
							 <button class="w-btn w-btn-blue" name="submit"  type="submit"> 전송</button>
							
<!-- 							<INPUT name="submit" type="submit" value="전송"> -->
						</TD>
					</FORM>
				</TR>
			</TABLE>
		</TD>
		<TD width="50%"> 
			<TABLE cellpadding="1" cellspacing="1" class="panel">
				<TR align="left" valign="top"> 
					<FORM name="changeRoom" method="post" action="listrooms.jsp">
						<TD > 
							<INPUT type="hidden" name="n" value="<%=nickname%>">
							<INPUT class="w-btn w-btn-blue" name="ChangeRoom" type="submit" id="ChangeRoom" onClick="window.open('listrooms.jsp','채팅방 이동','width=1000,height=1000,location=no,status=no,scrollbars=yes');" value="채팅방 이동">
						</TD>
					</FORM>

					<FORM name="find">
						<TD > 
							<INPUT  class="w-btn w-btn-blue" type="button" value="유저 검색" onclick="window.open('find.jsp','유저검색','width=600,height=350,location=no,status=no,scrollbars=yes');">
					</TD>
					</FORM>
				
					<FORM name="refresh">
						<TD  > 
							<INPUT  class="w-btn w-btn-blue" type="Button" value="새로고침" onClick="top.iframes[0].location.reload()">
						</TD>
					</FORM>
					<FORM name="logout" action="logout" method="post" target="_top">
						<TD > 
							<INPUT  class="w-btn w-btn-blue" type="Submit" value="접속 종료">
						</TD>
					</FORM>
				
		
			</TABLE>
		</TD>
	</TR>
</TABLE>
</BODY>
</HTML>
<%
		}
		else
		{
			out.write("<h2 class=\"error\">Your room couldn't be found. You can't send message</h2>");
		}
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
%>
