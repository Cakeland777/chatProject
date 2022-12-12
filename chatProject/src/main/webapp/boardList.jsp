
<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"
    pageEncoding="UTF-8"
    import="board.*"
%>

<!DOCTYPE html>
<html>
<head>
<style>
h1{
background-color: lightblue;
color:white;
}
h2{
color:white;
background-color: lightblue;
}
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
}
<link rel="stylesheet" href="htps://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

</style>
  

  <meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
 
<%
   request.setCharacterEncoding( "utf-8" );
   String type = request.getParameter("type");
   String content=request.getParameter("SearchContent");
   Board board=new Board();
   BoardDB db=BoardDB.getInstance();
   List boardList=db.searchBoards(type,content);

%>
<jsp:include page="navBar.jsp"/>

<div class="form" align="center">
<form method="post" action="boardList.jsp">
  <select class="form-select" id="type" name="type" aria-label="Default select example" required>
  <option selected>선택</option>
    <option value="all">전체</option>
  <option value="userid">작성자 아이디</option>
  <option value="title">제목</option>
  <option value="content">내용</option>
</select>
<input type="text" id="SearchContent"name="SearchContent">
<button class="w-btn w-btn-blue" type="submit">
 <i class="bi bi-search" style="font-size: 10px"></i>
    </button>
    <button class="w-btn w-btn-blue" type="button" onclick="location.href='BoardForm.jsp'">
        글 작성
    </button>

</form></div>
<table class="table table-sm table-hover" style="margin-left: auto; margin-right: auto;">
            <thead style="border-top: 1px solid #dee2e6;" >
                <tr class="text-center"  bgcolor="lightblue" style="font-weight: bold"; >
                    <th style="font-weight: bold; font-size: 16px;">번호</th>
                    <th style="font-weight: bold; font-size: 16px;">유형</th>
                       <th style="font-weight: bold; font-size: 16px;">제목</th>
                    <th style="font-weight: bold; font-size: 16px;">작성자</th>
                    <th style="font-weight: bold; font-size: 16px;">등록시간</th>
                    <th style="font-weight: bold; font-size: 16px;">조회수</th>
                </tr>
<%	
   for (int i=0; i < boardList.size(); i++){
      Board vo=(Board) boardList.get(i);
      String id=vo.getId();
      String uid=vo.getUserid();
      String name=vo.getName();
      String title=vo.getTitle();
      String content1=vo.getContent();
      String type1=vo.getType();
      String time=vo.getTime();
      int count=vo.getCount();

%>  
<tr class="table-secondary text-center" style="font-weight: bold; cursor:pointer;" onclick="#">
                    <td ><%= i+1%></td>
                    <td><%= type1 %></td>
                    <td class="con" style="width:50%"><i class="fas fa-bullhorn"></i>&nbsp;&nbsp;&nbsp;<a href="boardList/view?id=<%=id %>"><%= title %></a></td>
                      <td ><%= name%>(<%=uid %>)</td>
                    <td><%=time  %></td>
                    <td ><%=count  %></td>
                </tr>
    
     
                
<%		
   }
%>	
</table>
<script>
if (${message eq 'insert'}) {
	Swal.fire({
		  position: 'center',
		  icon:'success',
		  title: '게시글 등록 완료',
		  text: '',
		  showConfirmButton: false,
		  timer: 1500
		})
}
else if (${message eq 'noinsert'}) {
	Swal.fire({
		  position: 'center',
		  icon:'error',
		  title: '게시글 등록 실패',
		  text: '',
		  showConfirmButton: false,
		  timer: 1500
		})
}
</script>
</body>
</html>
