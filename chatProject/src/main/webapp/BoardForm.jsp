<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <meta charset="UTF-8">
    <title>게시글 등록</title>
    <style>
      #container {
        width:600px;
        margin:10px auto;
      }
      #buttons{
       justify-content: center;
       }
      ul{
   list-style:none;
   }
   .header{
   background-color: lightblue;
   color:white;
   }
   .mb-3{
   margin:10px;
   padding:10px;
   }
   .form-floating{
   margin:10px;
   }
    </style>
   
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="stylesheet" href="css/register.css">
  </head>
  <body> 
  <jsp:include page="index.jsp"/>
    <div id="container">
      <h1 class="header">게시글 등록</h1>
      <form action ="InsertBoard" method="post" name="boardForm">
        <fieldset>
 
     <div class="form-floating">
      <input type="text" class="form-control" id="uid" name="uid"  value="${userid}" readonly="readonly">
      <label for="floatingInput">작성자 아이디</label>
    </div>
         <div class="form-floating">
      <input type="text" class="form-control" id="name" name="name"  value="${name}" readonly="readonly">
      <label for="floatingInput">작성자 이름</label>
    </div>
  <select class="form-select" id="type" name="type" aria-label="Default select example" required>
  <option selected>게시글 유형을 선택해주세요</option>
  <option value="공지사항">공지사항</option>
  <option value="일반">일반</option>
  <option value="Q&A">Q&A</option>
</select>
        
     <div class="form-floating">
      <input type="text" class="form-control" id="title"name="title" required>
      <label for="floatingInput">제목</label>
    </div>
<!--    <div class="form-floating"> -->
<!--       <input type="text" class="form-control" id="content"name="content" placeholder="phone"> -->
<!--       <label for="floatingInput">내용</label> -->
<!--     </div> -->
<!--     <div class="mb-4"> -->

<!--   <textarea class="form-control"id="content"name="content"  rows="3"placeholder="내용"></textarea> -->
<!-- </div> -->
<div class="container">
  <textarea class="summernote" name="content"></textarea>    
</div>
<script>
$('.summernote').summernote({
	  height: 300, 
	  width:1000,// 에디터 높이
	  minHeight: null,             // 최소 높이
	  maxHeight: null,  
	  lang: "ko-KR",
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
</script>
        </fieldset>
        <div id="buttons">
          <input type="submit" class="btn btn-secondary" value="등록하기"onclick="location.href='boardList.jsp'">
          <input type="reset" class="btn btn-secondary" onclick="location.href='boardList.jsp'"  value="취소">

        </div>
      </form>
    </div>           
  </body>
</html>
