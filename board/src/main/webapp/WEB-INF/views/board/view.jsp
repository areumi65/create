<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">    
 
 <style>
 	#regist{
 		width:700px;
 		margin: 0 auto;
 	}
 	
 	table{
 	  	border-collapse:collapse;
 		width:100%;
 		margin: 30px auto;
 	}
 	tr,td{
 	}
 	textarea{
 		width:100%;
 		height:300px;
 	}
 	
 	.btn-wrap{
 		margin-top:30px;
 	}
 	
 </style>
    
<jsp:include page="../header.jsp"></jsp:include>
 
 <form action="regist"  method="post">
	 <div id="regist">   
		<table>
			<tr>
				<td>말머리</td>
			</tr>
			<tr>
				<td>
					<select name="board_head" required>
						<option value="">선택하세요</option>
						<option>정보</option>
						<option>유머</option>
						<option>기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
			</tr>
			<tr>
				<td>
					<input type="text"  name="board_title">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
			</tr>
			<tr>
				<td>
					<input type="text"  name="board_writer">
				</td>
			</tr>
			<tr>
				<td>내용</td>
			</tr>
			<tr>
				<td>
					<textarea rows="10" cols="50" name="board_content"></textarea>
				</td>
			</tr>
		</table>
		<div class="btn-wrap">
			<div style="float: left">
				<a href="../index.jsp" >
					<input type="button" value="목록보기">
				</a>
			</div>
			<div style="float: right">
				<input type="reset" >
				비밀번호: <input type="password" name="board_pw">
				<button type="submit">등록</button>
			</div>
		</div>
	</div>
 </form>