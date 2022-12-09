
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
.bi-house-fill{
color:white;
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
</style>
  <link rel="stylesheet" href="htps://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

  <meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<%
//1. 디비에서 전체 글목록을 읽어서 가져오기
//2. BoardDAO 객체생성
BoardDB db=BoardDB.getInstance();
//3. 디비에 글이 있는지 확인 후 있으면 글 모두 가져오기,없으면 가져오지않기 : getBoardCount()
int cnt = db.getCount();

//7. 페이징처리 (이미 유명한 알고리즘 공식, 사용법만 알면 됨)
//7-1. 한 페이지에서 보여줄 글의 개수 설정(5개, 변경가능)
int pageSize = 5; 
//7-2. 지금 내가 몇페이지에 있는 확인
//페이지번호는 숫자인데 왜 String으로 하는지 ? => 연산을 할 것이 아니라서 String이 편함
String pageNum = request.getParameter("pageNum");
//7-3. 페이지번호정보가 없을 경우 내가 보는 페이지가 첫페이지가 되도록
if(pageNum == null){ 
	pageNum ="1";
}
//7-4. 시작행번호계산
//10개씩 컬럼 나누고 2페이지에서 시작행이 11이되고 3페이지에서 시작행이 21이 되게끔 만들기
int currentPage = Integer.parseInt(pageNum); //String을 integer로 변환
int startRow = (currentPage-1)*pageSize + 1;
//currentPage가 2인경우, (2-1)x10+1 = 11
//currentPage가 3인경우, (3-1)x10+1 = 21

//7-5. 끈행번호계산
int endRow= currentPage * pageSize;
//currentPage가 2인경우, 2*10 = 20
//currentPage가 3인경우, 3*10 = 30


//4. 게시판 글의 수를 화면에 데이터 출력
//게시판 총 글의 수 : cnt개
//5. getBoardList() 메서드생성
System.out.println(bdao.getBoardList());

ArrayList boardList = null;

if(cnt != 0){
	//일반적인 리스트호출방법,  아래는 페이징처리한 리스트호출방법
	//boardList = bdao.getBoardList();
	//7-6. 페이징 처리한 리스트 호출 => getBoardList()메서드만들기(메서드 오버로딩)
	boardList = bdao.getBoardList(startRow, pageSize);
} 

//6. 게시판 모든 내용을  화면에 출력

%>
<h1 class="header"><a href="/chatProject/index.jsp"><i class="bi bi-house-fill" ></i></a> 게시판</h1>

<%
   request.setCharacterEncoding( "utf-8" );
   String type = request.getParameter("type");
   String content=request.getParameter("SearchContent");
   Board board=new Board();
   BoardDB db=BoardDB.getInstance();
   List boardList=db.searchBoards(type,content);
   
   
%>
<form method="post" action="boardList.jsp">
  <select class="form-select" id="type" name="type" aria-label="Default select example" required>
  <option selected>선택</option>
    <option value="all">전체</option>
  <option value="userid">작성자 아이디</option>
  <option value="title">제목</option>
  <option value="content">내용</option>
</select>
<input type="text" id="SearchContent"name="SearchContent">
        <div id="buttons">
          <input type="submit" class="btn btn-outline-info stretched-link" value="검색">
          <input type="button" class="btn btn-outline-info stretched-link" onclick="location.href='BoardForm.jsp'"  value="글 작성">
        </div>

</form>
<table class="table table-sm table-hover">
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

</body>
</html>
