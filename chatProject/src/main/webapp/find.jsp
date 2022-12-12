<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="error.jsp" import="chat.*"%>
<%
	String submitted = request.getParameter("submitted");
	boolean postBack = false;
	if (submitted != null && "true".equals(submitted))
	{
		postBack = true;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<HEAD>
<TITLE>Find your friend</TITLE>
<META http-equiv="pragma" content="no-cache">
<LINK rel="stylesheet" href="<%=request.getContextPath()%>/chat.css" type="text/css">
</HEAD>
<BODY>
<%
	if (postBack)
	{
		String nickname = request.getParameter("nickname");
		String roomName = null;
		if (nickname != null && nickname.length() > 0)
		{
			try
			{
				ChatRoomList roomList = (ChatRoomList)application.getAttribute("chatroomlist");
				ChatRoom chatRoom = roomList.getRoomOfChatter(nickname);
				if (chatRoom != null)
				{
					roomName = chatRoom.getName();
				}
				if (roomName == null)
				{
					out.write("<h3><i>" + nickname + "</i> 님을 찾을 수 없습니다</h3>");
				}
				else
				{
					out.write("<h3><i>" + nickname + "</i>님의 위치:" + roomName + "</h2>");
				}

			}
			catch (Exception e)
			{
				out.write("<h1>서버 문제 발생</h1>");
			}
		}
		else
		{
			out.write("<h4 class=\"error\">찾고싶은 유저의 이름을 입력해 주세요</h4>");
		}
	}
%>
<H2>찾고자 하는 유저명을 입력해주세요</H2>
<FORM action="find.jsp" method="post" name="find" id="find">
<STRONG>유저명</STRONG>
		<INPUT name="nickname" type="text" id="nickname">
		<INPUT type="hidden" name="submitted" value="true">
		<input type="submit" value="검색">
</FORM>
<div align="center">

<form name="closing">
	<input type="button" onClick="window.close()" value="닫기">
</form>

</div>
</BODY>
</HTML>
