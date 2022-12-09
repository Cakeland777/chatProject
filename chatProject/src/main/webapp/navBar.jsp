<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String)session.getAttribute("userid");
    
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<style>
      @import url('https://fonts.googleapis.com/css?family=Roboto');
h1 {
  margin: 2em 0 1.5em 0;
}
.bi{
color:white;
    font-size: 22px;
    line-height: 22px;
}

nav {
  width: 100%;
  display: flex;
/*   justify-content: center; */
  position: relative;
  background-color:lightblue ;
}

ul, li {
  margin: 0;
  padding: 0;
  list-style: none;
}

#main-menu > li {
  float: left;
  position: relative;
}

#main-menu > li > a {
  font-size: 0.85rem;
  color: rgba(255,255,255,0.85);
  text-align: center;
  text-decoration: none;
  letter-spacing: 0.05em;
  display: block;
  padding: 14px 36px;
  border-right: 1px solid rgba(0,0,0,0.15);
  text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
}

#main-menu > li:nth-child(1) > a {
  border-left: 1px solid rgba(0,0,0,0.15);
}

#sub-menu {
  position: absolute;
  background: lightgrey;;
  opacity: 0;
  visibility: hidden;
  transition: all 0.15s ease-in;
}

#sub-menu > li {
  padding: 16px 28px;
  border-bottom: 1px solid rgba(0,0,0,0.15);
}

#sub-menu > li >  a {
  color:#FFFFFF;
  text-decoration: none;
}

#main-menu > li:hover #sub-menu {
  opacity: 1;
  visibility: visible;
}

#sub-menu > li >  a:hover {
 text-decoration: underline;
}


</style>
<link rel="stylesheet" href="htps://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
<body>
<nav role="navigation">
  <ul id="main-menu">
  <li><a href="/chatProject/index.jsp"><i class="bi bi-house-fill" ></i></a></li>
  <%if(id!=null){%>
    <li><a href="#"><i class="bi bi-list"></i></a>
      <ul id="sub-menu">
        <li><a class="menu"href="#" aria-label="subemnu">submenu</a></li>
        <li><a class="menu" href="/chatProject/detailMember" aria-label="subemnu" style="font-size: 13px">마이페이지</a></li>
        <li><a class="menu" href="/chatProject/boardList.jsp" aria-label="subemnu">게시판</a></li>
        <li><a class="menu" href="/chatProject/logout" aria-label="subemnu">로그아웃</a></li>
      </ul>
    </li>
      </ul>
</nav>  
</body>
</html>
    <%}
  else{%>
  </ul>
</nav>  
</body>
</html>
    <%}%>
