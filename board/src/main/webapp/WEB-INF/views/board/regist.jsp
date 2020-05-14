<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">    

<jsp:include page="../header.jsp"></jsp:include>
 <style>
 	#regist{
 		width:700px;
 		margin: 100px auto;
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
	$(function(){
		var uploadFile = $('.uploadBtn');
		uploadFile.on('change', function(e){
			var files = e.target.files;
			console.log(files);
			$('#resetBtn').show();
			$('.fileName').hide();
			
			for(var i=0; i<files.length; i++){
				var file = files[i];
				var $li = $(
				'<li class="list-group-item d-flex justify-content-between align-items-center">' +
					file.name + 
// 				'	<button type="button" class="close" aria-label="Close" onclick="deleteFile(this)">' +
// 				'		<span aria-hidden="true">&times;</span>' +
// 				'	</button>' +
				'</li>'
				);
				 $('ul.list-group').append($li);
			}
			
		});
		
	});

// 	function deleteFile($this){
// 		var $ul = $('ul.list-group');
// 		var index =  $ul.find('li').index($this);
// 		$ul.find('li').eq(index).remove();
// 	}
 
 
	
	function checkForm(){
// 		debugger;	
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
 
 <form name="frm" action="regist"  method="post" enctype="Multipart/form-data" onsubmit="return checkForm();">
	 <div id="regist">   
		<table>
			<tr>
				<td><label for="usr">말머리</label></td>
				<td style="padding-left:10px;"><label for="usr">작성자</label></td>
			</tr>
			<tr>
				<td>
					  <select class="form-control" id="sel1" name="board_head"  >
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
				<td colspan="2" ><label for="usr">제목</label>
				<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
				</td>
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
			<div class="f-form" style="text-align:left">
				<div class="filewrap">
					<div style="float:left;">
						<label for="uploadBtn" class="btn_file btn btn-light" style="float:left; margin:0 5px 5px 0">찾아보기</label>
						<button type="button" class="btn btn-secondary" id="resetBtn" style="margin-right:5px" onClick="resetFile()">삭제</button>
					</div>
						<input type="file" name ="file" multiple="multiple" id="uploadBtn" class="uploadBtn">
				</div>
				<ul class="list-group" >
					<li>
						<input type="text" class="fileName" readonly="readonly" placeholder="파일 업로드">
					</li>
				</ul>
				
			</div>
		</div>
		<div class="btn-wrap">
			<div class="btn-wrap-le">
				<a href="${pageContext.request.contextPath}/board/list" >
					<input type="button" value="목록보기" class="btn btn-secondary">
					<button type="reset"  class="btn btn-secondary">초기화</button>
				</a>
			</div>
			<div class="btn-wrap-ri">
				<input type="submit" class="btn btn-primary" value="등록">
			</div>
		</div>
		
	</div>
 </form>
 
