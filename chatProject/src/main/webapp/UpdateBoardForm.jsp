<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="member.*"
    import="board.*"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
      <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
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
    <link rel="stylesheet" href="../css/register.css">
     <link rel="stylesheet" href="../css/button.css">
  </head>
  <body> 
  <jsp:include page="navBar.jsp"/>
      <div class="registration-form">

      <form action ="./updateArticle.do" method="post" name="updateForm">
        <fieldset>
 
     <div class="form-floating">
      <input type="text" class="form-control" id="uid" name="uid"  value="${user.uid}" readonly="readonly">
      <label for="floatingInput">작성자 아이디</label>
    </div>
         <div class="form-floating">
      <input type="text" class="form-control" id="name" name="name"  value="${user.name}" readonly="readonly">
      <label for="floatingInput">작성자 이름</label>
    </div>
        <div class="form-floating">
      <input type="text" class="form-control" id="type" name="type"  value="${board.type}" readonly="readonly">
      <label for="floatingInput">게시글 유형</label>
    </div>
        
     <div class="form-floating">
      <input type="text" class="form-control" id="title"name="title" value="${board.title }" required>
      <label for="floatingInput">제목</label>
    </div>
    <div class="form-floating">
      <input type="hidden" class="form-control" id="id"name="id" value="${board.id}" readonly  required>
      <label for="floatingInput">아이디</label>
    </div>
<div class="container">
  <textarea class="summernote" name="content" >${board.content}</textarea>    
</div>
<script>
$('.summernote').summernote({
	  height: 300, 
	  width:450,// 에디터 높이  
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
          <input type="submit" class="btn" value="수정하기">
          <input type="reset" class="btn" onclick=window.history.back(); value="취소">

        </div>
      </form>
    </div>  
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>                
  </body>
</html>
