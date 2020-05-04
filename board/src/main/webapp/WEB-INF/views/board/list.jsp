<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--  <script type="text/javascript" src="jquery.tablesorter.min.js"></script> -->

<jsp:include page="../header.jsp"></jsp:include>

	
<style>
	.blist{
		width:1000px;
		margin:0 auto;
	}
	
	table{
		width:100%;
		margin-top:100px;
	}
	
	th{
		text-align:center;
		padding:14px;
		border-top:2px solid #444;
		border-bottom:2px solid #444;
	}
	td{
		padding:16px;
		border-bottom:1px solid #999;
	}
	
	a{
		text-decoration:none;
		color:#212529;
	}
	
	.nav{
		margin-top:70px;
		width:100%;
	}
	
	.nav  nav{
		margin:0 auto;
	}
	
</style>

<script>


	 $(document).ready(function(){ 
		$("#listT").tablesorter();
	});
	
</script>
	
	<div class="dropdown">
	  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    Dropdown button
	  </button>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	    <a class="dropdown-item"  id="sort">오래된순</a>
	    <a class="dropdown-item" href="#">유머</a>
	    <a class="dropdown-item" href="#">정보</a>
	    <a class="dropdown-item" href="#">기타</a>
	  </div>
	</div>
	
	
	<div class="blist">
		<c:choose>
			<c:when test="${boardList.size()>0}">
					<table id="listT" class="tablesorter">
						<tr>
							<th width="10%">번호</th>
							<th width="50%">제 목</th>
							<th width="15%">작성자</th>
							<th width="15%">작성일</th>
							<th width="10%">조회수</th> 
						</tr>
							<c:forEach items="${boardList}" var="boardDto">
							<tr>
								<td align="center">${boardDto.board_no }</td>
								<td>
									<a href="${pageContext.request.contextPath}/board/view?board_no=${boardDto.board_no}">
										<font color="#007bff">[${boardDto.board_head }]</font>${boardDto.board_title}
									</a>
								</td>
								<td align="center">${boardDto.board_writer}</td>
								<td align="center">
									<fmt:parseDate var="write_date" pattern="yyyy-MM-dd"  value="${boardDto.board_write_date}"/>
									<fmt:formatDate pattern="yyyy-MM-dd"  value="${write_date}"/>
								</td>
								<td align="right">${boardDto.board_readcount}</td>
							</tr>
						</c:forEach>
					</table>
					<div style="float:right; margin-top:20px;">
						<a href="${pageContext.request.contextPath}/board/regist">
							<input class="btn btn-primary" type="button" value="글쓰기">
						</a>
					</div>
					
					<div class="nav">
					<nav aria-label="Page navigation example">
                          <ul class="pagination">
                             <c:if test="${pageMaker.prev}">
                                <li class="page-item" ><a class="page-link" aria-label="Previous" href="list${pageMaker.makeQuery(pageMaker.startPage -1)}">&laquo;</a></li>
                             </c:if>
                           
                             <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
                                 <li class="page-item" 
	                                   <c:out value="${pageMaker.page ==idx? 'class=active' : ''}" />
	                               >   
	                                   <a class="page-link" href="list${pageMaker.makeQuery(idx)}">${idx}</a>
                                   </li>
                             </c:forEach> 
                              
                             <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                                <li class="page-item" ><a class="page-link" aria-label="Next" href="list${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a></li>
                             </c:if>
                           
                          </ul>
                       
                       </nav>   
                          
			         </div>
							              
									
					
				</c:when>
				<c:otherwise>
					<div>
						<p>게시글이 없습니다. <br> 글을 등록하세요.</p>
						<button>글 등록하기</button>
					</div>
				</c:otherwise>
		</c:choose>
	</div>

</body>