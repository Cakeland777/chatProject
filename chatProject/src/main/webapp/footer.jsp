<%@ page session="true" 
contentType="text/html; charset=UTF-8"
%>
<DIV align="center">
<CENTER>
<TABLE width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
	<TR>
		<TD width="100%" align="center"><%
		String n = (String)session.getAttribute("nickname");
// 		if (n != null && n.length() > 0)
// 		{
// 			out.write("<a href=\"index.jsp\">메인으로</a>");
// 			out.write(" <a href=\"listrooms.jsp\">방 목록</a>");
// 		}
		%> </TD>
	</TR>
</TABLE>
</CENTER>
</DIV>