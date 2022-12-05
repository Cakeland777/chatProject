<%@page import="javax.print.attribute.standard.PagesPerMinuteColor"%>
<%@page import="member.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>

<table>
	<thead>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>email</th>
			<th>가입일</th>
		</tr>
	</thead>
	<tbody>
<%
	List<Member> listMembers = (List<Member>) request.getAttribute("listMembers");
	System.out.println("size = " + listMembers.size());
	
	for (Member member : listMembers) { 
		System.out.println("bean = " + member);
		request.setAttribute("member", member);
%>
		<tr>
			<td>${member.id}</td>
			<td>${member.pwd}</td>
			<td>${member.name}</td>
			<td>${member.email}</td>
			<td>${member.address}</td>
		</tr>
<% }%>
	</tbody>
</table>
</body>
</html>