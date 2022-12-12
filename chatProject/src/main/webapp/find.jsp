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
</style>
<TITLE>유저검색</TITLE>
<META http-equiv="pragma" content="no-cache">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</HEAD>
<BODY>

<h3 style="text-align: center; color: skyblue;">검색할 대화명을 입력해주세요</h3>
<div style="text-align: center">
<FORM action="find.jsp" method="post" name="find" id="find">
<STRONG>유저명</STRONG>
		<INPUT name="nickname" type="text" id="nickname">
		<INPUT type="hidden" name="submitted" value="true">
		<input type="submit" class="w-btn w-btn-blue"  value="검색">
		<input type="button" class="w-btn w-btn-blue" onClick="window.close()" value="닫기">
</FORM>
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
					out.write("<h3>" + nickname + " 님을 찾을 수 없습니다</h3>");
				}
				else
				{
					out.write("<h3>" + nickname + "님의 위치:" + roomName + "</h2>");
				}

			}
			catch (Exception e)
			{
				out.write("<h1>서버 문제 발생</h1>");
			}
		}
		else
		{
			out.write("<h4 class=\"error\"> 대화명을 입력해 주세요</h4>");
		}
	}
%>
</div>
</BODY>
</HTML>
