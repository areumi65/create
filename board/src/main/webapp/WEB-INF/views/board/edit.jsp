<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 		margin-top:20px;
 		width:100%;
 		height:40px;
 	}
 	
 		.btn-wrap .btn-wrap-le{
		float:left;
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
	
	
 	input[type="file"] {
		   width:1px;
		   height:1px;
		   padding:0;
		   margin:-10px;
		   overflow:hidden;
		   clip:rect(0,0,0,0);
		   border:0;
		}
 	
 	.fupload .btn_file {
		   margin-bottom:0;
		   background-color:#f5f5f5;
		   cursor:pointer;
		}
		
		.fupload input[type="submit"] {
			width:100px;
		}
 	
 	
 	input{
 		font-size:14px;
 	}
 		
 		#resetBtn{
 			display:none;
 		}
 		
 	.list-group-item{
 		padding: 0.35rem 1.25rem;
 	}
 	
 </style>
 <script>
 
 var uploadFiles = [];
 var deleteFileArr =[];
	$(function(){
		var uploadFile = $('.uploadBtn');
		uploadFile.on('change', function(e){
			var files = e.target.files;
			console.log(files);
			$('#resetBtn').show();
			
			for(var i=0; i<files.length; i++){
				var file = files[i];
				var $li = $(
				'<li class="list-group-item d-flex justify-content-between align-items-center">' +
					file.name + 
//				'	<button type="button" class="close" aria-label="Close" onclick="deleteFile(this)">' +
//				'		<span aria-hidden="true">&times;</span>' +
//				'	</button>' +
				'</li>'
				);
				 $('ul.list-group').append($li);
			}
			
		});
		
	});
	
	function deleteFile(file_no,$this){
		deleteFileArr.push(file_no);//삭제 누를때마다 파일 쌓이는것
		$("input[name=deleteFileNo]").val(deleteFileArr.join());//join() : 매개변수가 있으면 쉼표(기본값)으로 연결. (1,2,3....)
		$($this).parent().parent("li").remove();
	}
	
	function resetFile(){
		$("#uploadBtn").attr("type","text");
		$("#uploadBtn").attr("type","file");
	}
	
	
	function checkForm(){
		
		if(!document.frm.board_head.value){
			alert("말머리를 선택해주세요");
			document.frm.board_head.focus();
			return false;
		}
		
		if(!document.frm.board_title.value){
			alert("제목을 입력해주세요");
			document.frm.board_title.focus();
			return false;
		}
		
		if(!document.frm.board_writer.value){
			alert("작성자를 입력해주세요");
			document.frm.board_writer.focus();
			return false;
		}
		
		if(!document.frm.board_content.value){
			alert("내용을 입력해주세요");
			document.frm.board_content.focus();
			return false;
		}
		
		return true;
	}
	
 </script>  
 
 <form name="formName" action="edit"  method="post" enctype="Multipart/form-data" onsubmit="return checkForm();">
	 <div id="regist">
		<table>
			<tr>
				<td><label for="usr">말머리</label></td>
				<td style="padding-left:10px;"><label for="usr">작성자</label></td>
			</tr>
			<tr>
				<td>
					  <select class="form-control" id="sel1" name="board_head" required>
					   		<option value="${boardDto.board_head }" >${boardDto.board_head }</option>
							<option>정보</option>
							<option>유머</option>
							<option>기타</option>
					  </select>
				</td>
				<td style="padding-left:10px;">
					<input type="text" class="form-control"  readonly value="${boardDto.board_writer }">
				</td>
			</tr>
			<tr>
				<td colspan="2" ><label for="usr">제목</label></td>
			</tr>
			<tr>
				<td colspan="2" width="100%">
				 	<input type="text" class="form-control" name="board_title" value="${boardDto.board_title}">
				</td>
			</tr>
			<tr>
				<td colspan="2" ><label for="usr">내용</label></td>
			</tr>
			<tr>
				<td  colspan="2">
					<textarea class="form-control" rows="10" id="comment" name="board_content" >${boardDto.board_content}</textarea>
				</td>
			</tr>
		</table>
				<div class="fupload">
			<div class="f-form" style="text-align:left">
				<div class="filewrap">
					<div style="float:left;">
						<label for="uploadBtn" class="btn_file btn btn-light" style="float:left; margin:0 5px 5px 0">찾아보기</label>
						<button type="button" class="btn btn-secondary" id="resetBtn" style="margin-right:5px" onclick="resetFile()">삭제</button>
					</div>
						<input type="file" name ="file" multiple="multiple" id="uploadBtn" class="uploadBtn">
				</div>
				<ul class="list-group"  >
				<c:forEach var="fileDto" items="${fileList}">
					<li class="list-group-item d-flex justify-content-between align-items-center" style="z-index:2">
						<div>
								${fileDto.file_uploadname }
								&nbsp;&nbsp;&nbsp; <font style="font-size:14px; line-height:16px">${fileDto.file_size } byte</font>
								<a class="fas fa-fw fa-times" style="color:#333; margin-right:5px"  href="#none" 
								onclick="deleteFile('${fileDto.file_no}',this)"></a>
						</div><br>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>
			<div class="btn-wrap">
				<div class="btn-wrap-le">
					<a href="${pageContext.request.contextPath}" >
						<input type="button" value="목록보기" class="btn btn-secondary">
					</a>
						<button type="reset"  class="btn btn-outline-secondary">초기화</button>
				</div>
				<div class="btn-wrap-ri">
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
			</div>
	</div>
	<input type="hidden" name="deleteFileNo" />
	<input type="hidden" name="board_no"  value="${param.board_no }">
 </form>