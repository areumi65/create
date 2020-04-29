<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
	
	.nav  .pagination{
		margin:0 auto;
	}
	
</style>	
	
	
	<div class="blist">
		<c:choose>
			<c:when test="${boardList.size()>0}">
					<table>
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
									<ul class="pagination" style="justify-content: center;">
					                    <c:if test="${pagination.curPage ne 1}">
					                    	<li class="page-item disabled">
					                        	<a class="page-link" href="#" onClick="fn_paging('${pagination.prevPage }')">&laquo;</a> 
					                        </li>
					                    </c:if>
					                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
					                        <c:choose>
					                            <c:when test="${pageNum eq  pagination.curPage}">
					                            	<li class="page-item active">
												      <span style="font-weight: bold;"><a class="page-link" href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
												    </li>
					                            </c:when>
					                            <c:otherwise>
						                            <li class="page-item">
												      <a href="${pageContext.request.contextPath}/board/list?curPage=${pageNum}" class="page-link" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
												    </li>
					                            </c:otherwise>
					                        </c:choose>
					                    </c:forEach>
					                    <c:if test="${pagination.curPage ne pagination.pageCount && pagination.pageCount > 0}">
					                    	<li class="page-item">
					                        	<a href="#" class="page-link" onClick="fn_paging('${pagination.nextPage }')">&raquo;</a> 
					                    	</li>
					                    </c:if> 
					                </ul>
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