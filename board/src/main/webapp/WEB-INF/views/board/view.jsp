<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../header.jsp"></jsp:include>
 
 <script>
	function goBack(){
		location.href=document.referrer;
	} 
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
			<tr>
				<td style="padding:55px 20px;">${boardDto.board_content }</td>
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
					<button type="submit" class="btn btn-secondary" >삭제</button>
				</a>
			</div>
		</div>
	</div>
