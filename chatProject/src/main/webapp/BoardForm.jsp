<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="member.*"
    %>
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
    body{
    background-color: white;
    }
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
   .textcontainer{
  padding: 5px;
   
   }
   .ck.ck-editor {
   	max-width: 1000px;
}
.ck-editor__editable {
    min-height: 300px;
}
   
    </style>
   <script src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/translations/ko.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>    
    <link rel="stylesheet" href="../css/register.css">
     <link rel="stylesheet" href="../css/button.css">

  </head>
  <body> 
   <jsp:include page="navBar.jsp"/>
    <div class="registration-form">

      <form method="post" id="boardForm" name="boardForm" enctype="multipart/form-data">
        <fieldset>
    
  <select class="form-select" id="type" name="type" aria-label="Default select example" required>
  <option value="일반">게시글 유형을 선택해주세요</option>
  <option value="공지사항">공지사항</option>
  <option value="일반">일반</option>
  <option value="Q&A">Q&A</option>
</select>
         <div class="form-floating">
      <input type="text" class="form-control" id="uid" name="uid"  value="${user.uid}" readonly="readonly">
      <label for="floatingInput">작성자</label>
    </div>
         <div class="form-floating">
      <input type="hidden" class="form-control" id="name" name="name"  value="${user.name}" readonly="readonly">
      <label for="floatingInput"></label>
    </div>
     <div class="form-floating">
      <input type="text" class="form-control" id="title"name="title" required>
      <label for="floatingInput">제목</label>
    </div>

<div class="textcontainer">
  <textarea style="text-align: center; border-right: 5px;" class="summernote" name="content"></textarea>    
<!-- 	<textarea name="content" id="editor"></textarea> -->
</div>
   <div class="form-floating">
      <input type="file" class="form-control" id="filename"name="filename"  >
    </div>
<script>
$('.summernote').summernote({
	  height: 300, 
	  width:450,
	  minHeight: null,             
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
ClassicEditor
.create( document.querySelector( '#editor' ), {language : "ko"} )
.catch( error => {
//    console.log( error );
} );
</script>
<script type="text/javascript">

let boardForm= document.querySelector("#boardForm");
boardForm.addEventListener("submit", (e) => {
   e.preventDefault();

   fetch('/chatProject/board/addArticle.do', 
      {
		method : 'POST',
	    cache: 'no-cache',
		body: new FormData(boardForm)		
	})
	.then(response => response.json())
	.then(jsonResult => {
		Swal.fire({
			  position: 'center',
			  icon:'success',
			  title: '등록완료',
			  showConfirmButton: false,
			  timer: 1500
			});
		if (jsonResult.status == true) {
			setTimeout("location.href ='./listArticles.do'",1800);
			
		}
	});
});
</script>
        </fieldset>
     <div class="button_container" >
          <input type="submit" name="write" class="btn" value="등록하기">
          <input type="reset" class="btn" onclick="location.href='listArticles.do'"  value="취소">

        </div>
      </form>
    </div> 
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>  
         
  </body>
</html>
