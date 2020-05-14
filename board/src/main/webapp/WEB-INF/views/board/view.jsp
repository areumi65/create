<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"></jsp:include>
 <script>
	function goBack(){
		location.href=document.referrer;
	} 
	
	$(function(){
	    
	    $("#deleteBtn").click(function(){
	    	return confirm("정말 삭제하시겠습니까?");
	    });
	    
	 
	});
	
 </script>
 
 <style>
 	#regist{
 		width:1000px;
 		margin: 0 auto;
 	}
 	
 	table{
 	  	border-collapse:collapse;
 		width:100%;
 		margin: 100px auto 20px;
 		padding:16px;
		border-top:2px solid #444;
 	}
 	tr,td{
 		padding:12px;
 		border-bottom:1px solid #ececec;
 	}
 	.con{
 		border-style:none;
 	}
 	
 	.file-wrap > td{
 	 padding-bottom:40px;
 	}
 	
 	.file-wrap p{
		border-radius:4px;
		font-weight:bold;				
 	}
 	
 	.btn-wrap{
 		margin-top:30px;
 	}
 	
 	.title-wrap{
 		float:none;
 	}
 	
 	.title-wrap:after {
 		content: "";
 		display:block;
 		clear:both;	
 	}
 	
 </style>
    
 
	 <div id="regist">   
		<table>
			<tr>
				<td>
					<div class="title-wrap" >
						<div style="float:left">
							<font color="#007bff">[${boardDto.board_head }]</font>&nbsp;&nbsp;${boardDto.board_title }
						</div>
						<div style="float:right">
							${boardDto.board_writer }&nbsp;&nbsp;
							<font color="#999" style="font-size:12px;">
								<fmt:parseDate var="write_date" pattern="yyyy-MM-dd HH:mm"  value="${boardDto.board_write_date}"/>
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${write_date}"/>
							</font>
						</div>
					</div>
				</td>
			</tr>
			<tr class="con">
				<td class="con" style="padding:50px 20px 100px;">${boardDto.board_content }</td>
			</tr>
			<tr class="file-wrap">
				<td>
					<div style="float:left; margin-right:20px;">
						<p>첨부파일</p>
					</div>
					<div style="float:left">
						<c:forEach var="fileDto" items="${fileList}">
							<div style="margin-bottom:10px;">
								<a href="download?file_no=${fileDto.file_no}">
									<i class="fas fa-fw fa-download" style="color:#333; margin-right:5px"></i>${fileDto.file_uploadname }
									&nbsp;&nbsp;&nbsp; <font style="font-size:14px; line-height:16px">${fileDto.file_size } byte</font>
								</a>
							</div>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
		<div class="btn-wrap">
			<div style="float: left">
					<input type="button" class="btn btn-secondary" value="목록보기" onclick="goBack();">
			</div>
			<div style="float: right">
				<a href="${pageContext.request.contextPath}/board/edit?board_no=${param.board_no}">
					<button type="submit" class="btn btn-primary" >수정</button>
				</a>
				<a href="${pageContext.request.contextPath}/board/delete?board_no=${param.board_no}">
					<button type="submit" class="btn btn-secondary" id="deleteBtn" >삭제</button>
				</a>
			</div>
		</div>
	</div>
