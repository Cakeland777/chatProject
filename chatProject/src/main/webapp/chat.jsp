
<%@ page session="true" import="chat.ChatRoomList,chat.ChatRoom" errorPage="error.jsp"

contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%
	String nickname = (String)session.getAttribute("nickname");
	if (nickname != null && nickname.length() > 0)
	{
		ChatRoomList roomList = (ChatRoomList) application.getAttribute("chatroomlist");
		ChatRoom room = roomList.getRoomOfChatter(nickname);
		String roomname = room.getName();
%>
	
<!DOCTYPE html>
<HEAD>
<TITLE>채팅 - <%=nickname%> (<%=roomname%>) </TITLE>
</HEAD>
<body>
<jsp:include page="navBar.jsp"/>

<iframe src="displayMessages.jsp#current" name="MessageWin" width="100%" height="470px" ></iframe> 
<iframe src="sendMessage.jsp" name="TypeWin" width="100%" height="170px" ></iframe> 



</body>
</html>
<%
}
else
{
	response.sendRedirect("login.jsp");
}
%>