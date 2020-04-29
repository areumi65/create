<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">    
 
<jsp:include page="../header.jsp"></jsp:include>
 <style>
 	#regist{
 		width:700px;
 		margin: 120px auto;
 	}
 	
 	table{
 	  	border-collapse:collapse;
 		width:100%;
 		margin: 10px auto;
 		
 	}
 	td{
 	}
 	textarea{
 		width:100%;
 		height:400px;
 	}
 	
 	.btn-wrap{
 		margin-top:80px;
 		width:100%;
 		height:40px;
 	}
 	
 	.btn-wrap .btn-wrap-le{
		position:absolute;
 	}
 	
 	.btn-wrap .btn-wrap-ri{
		float:right;
 	}
 	
 	
 	
	td > input, td > select{
		margin-bottom:30px;
	}
	
	.pwinput{
		margin-bottom:0;
		width:160px;
		margin-right:10px;
		float:left;
		clear:both;
	}
	
	.fupload {
		position:relative;
		width:100%;
	}
	
	.fupload > div{
		position: absolute;
		left:0;
	}
	
	.fupload .fileName {
		   display:inline-block;
		   width:600px;
		   height:38px;
		   padding-left:10px;
		   margin-right:5px;
		   border:1px solid #ced4da;
		   background-color:#fff;
		   vertical-align:middle
	}
	
	
 	.fupload input[type="file"] {
		   position:absolute;
		   width:1px;
		   height:1px;
		   padding:0;
		   margin:-1px;
		   overflow:hidden;
		   clip:rect(0,0,0,0);
		   border:0
		}
 	
 	.fupload .btn_file {
		   margin-bottom:0;
		   background-color:#f5f5f5;
		   cursor:pointer;
		}
		
		.fupload input[type="submit"] {
			width:100px;
		}
 	
 </style>
 <script>
 
	$(function(){
		var uploadFile = $('.fupload .f-form .uploadBtn');
		uploadFile.on('change', function(){
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$(this).siblings('.fileName').val(filename);
		})
	});
 
 </script>  
 
 <form action="regist"  method="post" enctype="Multipart/form-data">
	 <div id="regist">   
		<table>
			<tr>
				<td><label for="usr">말머리</label></td>
				<td style="padding-left:10px;"><label for="usr">작성자</label></td>
			</tr>
			<tr>
				<td>
					  <select class="form-control" id="sel1" name="board_head" required>
					   		<option value="">선택하세요</option>
							<option>정보</option>
							<option>유머</option>
							<option>기타</option>
					  </select>
				</td>
				<td style="padding-left:10px;">
					<input type="text" class="form-control"  name="board_writer" placeholder="한글 6자, 영문,숫자 20자까지 가능합니다.">
				</td>
			</tr>
			<tr>
				<td colspan="2" ><label for="usr">제목</label></td>
			</tr>
			<tr>
				<td colspan="2" width="100%">
				 	<input type="text" class="form-control" name="board_title">
				</td>
			</tr>
			<tr>
				<td colspan="2" ><label for="usr">내용</label></td>
			</tr>
			<tr>
				<td  colspan="2">
					<textarea class="form-control" rows="10" id="comment" name="board_content"></textarea>
				</td>
			</tr>
		</table>
				<div class="fupload">
					<div class="f-form">
						<input type="text" class="fileName form-control" readonly="readonly" placeholder="파일 업로드">
						<label for="uploadBtn" class="btn_file btn btn-light">찾아보기</label>
						<input type="file" name ="file" multiple="multiple" id="uploadBtn" class="uploadBtn">
					</div>
				</div>
					
	
	
			<div class="btn-wrap">
				<div class="btn-wrap-le">
					<a href="/board/list" >
						<input type="button" value="목록보기" class="btn btn-secondary">
						<button type="reset"  class="btn btn-outline-secondary">초기화</button>
					</a>
				</div>
				<div class="btn-wrap-ri">
					<input type="password" name="board_pw" class="form-control pwinput"  placeholder="비밀번호">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</div>
	</div>
 </form>