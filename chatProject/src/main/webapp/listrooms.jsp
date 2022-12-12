
<%@ page session="true" errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,chat.*"
contentType="text/html; charset=UTF-8"
%>
<HTML>
<HEAD>
<style>
.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 20px ;
    margin-top:10px;
    margin-bottom:10px;

    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 700;
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
      
.w-btn-blue1 {
    background-color: #C1C6E1;
    color: white;
}
.w-btn:hover {
    letter-spacing: 1px;
    transform: scale(1.1);
    cursor: pointer;
}


.w-btn:active {
    transform: scale(1.1);
}

</style>
<TITLE>채팅방 목록</TITLE>
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/chat.css">
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/button.css">
</HEAD>

<BODY bgcolor="#FFFFFF">
<%


String nickname = (String)session.getAttribute("nickname");
if (nickname == null || nickname == "")
{
	response.sendRedirect("login.jsp");
}
else
{
	String roomname = request.getParameter("rn");	
	String descr = request.getParameter("sd");
	boolean see = false;
	if (descr != null && descr.equals("y"))
	{
		see = true;
	}
%>
<jsp:include page="navBar.jsp"/>

<TABLE style="table-layout:fixed" width="80%" align="center">	
	<!--<tr>
		<td class="normal">Welcome <span class="chattername"><%=nickname%></span></td>
	</tr>	
	-->
	<TR>
		<TD width="100%">
		</TD>
	</TR>
</TABLE>
<BR>
	<%
				
		
		try
		{
			ChatRoomList roomlist = (ChatRoomList)application.getAttribute("chatroomlist");
			ChatRoom[] chatrooms = roomlist.getRoomListArray();
			if(roomname == null)
			{
				roomname = roomlist.getRoomOfChatter(nickname).getName();
			}
			roomname = roomname.trim();

	%>
<DIV align="center">
<div class="registration-form">
	<FORM name="chatrooms" action="<%=request.getContextPath()%>/start.jsp" method="post">
	<TABLE width="80%" border="1" cellspacing="1" cellpadding="1" align="center">
	<TR>
	<TD colspan="2" class="pagetitle" >채팅방 목록</TD>
	</TR>
	<%
			for (int i = 0; i < chatrooms.length; i++)
			{
				if (chatrooms[i].getName().equalsIgnoreCase("StartUp"))
					continue;
	%>
		<TR>
		<TD width="50%">
		<INPUT type=radio name="rn" value="<%=chatrooms[i].getName()%>"
		<%if (chatrooms[i].getName().equals(roomname))
			out.write("checked");%>><%=chatrooms[i].getName()%></A>
		</TD>
	<%
				if (see == true && chatrooms[i].getName().equals(roomname))
				{
	%>	
			<TD width="50%"><%=chatrooms[i].getDescription()%></TD>
	<%
				}
				else
				{
	%>
			<TD width="50%"><A href="<%=request.getContextPath()%>/listrooms.jsp?rn=<%=chatrooms[i].getName()%>&sd=y">설명</A></TD>
	<%
				}
	%>
		</TR>
	<%
			}
		}
		catch (Exception e)
		{
			System.out.println("Unable to get handle to Servlet Context: " + e.getMessage());
			e.printStackTrace();
		}
%>
<TR>
<td><button type="button"  class="w-btn w-btn-blue1" onclick="location.href='<%=request.getContextPath()%>/addRoom.jsp' "><b>채팅방 생성</b></button></td>
<%-- 	<TD>&nbsp;<A href="<%=request.getContextPath()%>/addRoom.jsp" title="add room">채팅방 생성</A></TD> --%>
	<TD>
	<button class="w-btn w-btn-blue1" type="submit"><b>입장</b></button></TD>
</TR>
</TABLE>
</FORM>
</div>
</DIV>
<%
	}
%>
<%@ include file="/footer.jsp"%>
</BODY>
</HTML>