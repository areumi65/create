<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header.jsp"></jsp:include>
<style>
	.blist{
		width:100%;
		margin:0 auto;
	}
	
	table{
		width:1000px;
		margin:100 auto 0;
		
	}
	
	th{
		text-align:center;
		padding:14px;
		border-top:1px solid #444;
		border-bottom:1px solid #444;
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
		margin-top:20px;
		width:100%;
	}
	
	.nav  > nav
	{
		margin:0 auto;
	}
	
	.srch > div{
		margin:0 atuo;
	}
	
	
	.sortDrp {
		width:1000px;
		margin:0 auto;
	}

	.sortDrp > .sortBtn{
		left:0;
		top:50px;
		position:absolute;
		float:left;
	}
	
	.drp{
		right:0;
		top:50px;
		position:absolute;
	}
	
	.writeBtn{
		text-align:right;
		margin-top:10px;	
	}
	
	#headSelect{
	}
	
</style>

<script>
$(function(){
    
    $("#btnSearch").click(function(){
    	getBoardList();
    });
    $("#sortList").change(function(){
    	getBoardList();
    });
    
 
});
function getBoardList(){
   	self.location = '${pageMaker.makeQuery(1)}' 
	    	+ "&searchType=" 
	    	+ $("select#searchType option:selected").val() 
	    	+ "&sortList=" 
	    	+ $("select#sortList option:selected").val() 
	    	+ "&keyword="
	    	+ encodeURIComponent($('#keywordInput').val()); 
	
}
function searchType(){
    return $("#searchType").val();
}
 
function keywordInput(){
    return $("#keywordInput").val();
}


function goBack(){
	location.href=document.referrer;
} 

</script>	
	
	<div class="dropdown sortDrp">
		<div class="sortBtn" style="float:left">
			<div style="float:left">
			  	<select name="sortList " class="form-control"  id="sortList" onchange="getBoardList">
				    <option class="dropdown-item"  <c:out value="${pageMaker.sortList eq 'asc' ? 'selected' : ''}"/> value="asc">오래된순</option>
				    <option class="dropdown-item" <c:out value="${pageMaker.sortList eq 'desc' ? 'selected' : ''}"/> value="desc">최신순</option>
			  	</select>
			</div>
		  <div style="float:right; margin-left: 10px" >
			  <p style="font-size:13px; font-weight:600; line-height:3.5rem;" >총 "${listCount }" 개의 게시물</p>
		  </div>
		</div>
			<div class="form-inline my-2 my-lg-0 srch">
	         	<div>
				   <div class=" dropdown drp">
				  	 <select name="searchType" class="form-control"  id="searchType">
			                 <option class="dropdown-item"  value="all" <c:out value="${pageMaker.searchType eq 'all' ? 'selected' : '' }"/>> 전체</option>
			                 <option class="dropdown-item"  value="board_writer"  <c:out value="${pageMaker.searchType eq 'board_writer' ? 'selected' : '' }"/>> 작성자</option>
			                 <option class="dropdown-item"  value="board_title" <c:out value="${pageMaker.searchType eq 'board_title' ? 'selected' : '' }"/>> 제목</option>
			                 <option class="dropdown-item"  value="board_content" <c:out value="${pageMaker.searchType eq 'board_content' ? 'selected' : '' }"/>> 내용</option>
			           </select>
				      <input class="form-control mr-sm-2" name="keyword" id="keywordInput"  value="${pageMaker.keyword }" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
				      <button class="btn btn-primary my-2 my-sm-0" type="submit" id="btnSearch">검색</button>
					</div>
	         	</div>
			</div>
	</div>
	
	
<article style="width:1000px; margin:0 auto; position:relative;">
	
	
	<div class="blist">
				<div class="defaultList">
					<table id="listT">
						<tr>
							<th width="10%">번호</th>
							<th width="50%">제 목</th>
							<th width="15%">작성자</th>
							<th width="15%">작성일</th>
							<th width="10%">조회수</th> 
						</tr>
						<c:choose>
							<c:when test="${boardList.size()>0}">
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
						</c:when>
						<c:when test="${listCount<1}">
								<tr>
									<td colspan="5" align="center" style="padding:150px 0 150px;">
									게시글이 없습니다.
									<div style="margin-top:20px;">
											<a  href="${pageContext.request.contextPath}/board/regist">
												<input type="button" class="btn btn-secondary" value="글 등록하기" >
											</a>
									</div>
									</td>
								</tr>
						</c:when>
						<c:otherwise>
							<c:if test="${pageMaker.makeSearch.size()<1 }">
							</c:if>
							<tr>
									<td colspan="5" align="center" style="padding:150px 0 150px;">
									검색 결과가 없습니다.
									<div style="margin-top:20px;">
											<a  href="${pageContext.request.contextPath}/board">
												<input type="button" class="btn btn-secondary" value="목록보기" >
											</a>
									</div>
									</td>
								</tr>
						</c:otherwise>
					</c:choose>
					</table>
					<div class="writeBtn">
						<a href="<c:url value="/board/regist"/>">
							<input class="btn btn-primary" type="button" value="글쓰기">
						</a>
					</div>
				</div>
					<!------------------------------------------------- 페이징------------------------------------------->
					<div class="nav">
					<nav aria-label="Page navigation example">
                        <ul class="pagination">
					 	  	 <c:if test="${pageMaker.prev}">
					 	  	 	<li class="page-item">
						 	  	 	<a class="page-link" href="${pageMaker.makeSearch(pageMaker.startPage -1)}">
						 	  	 	&laquo;
						 	  	 	</a></li>
					 	  	 </c:if>
					 	  
					 	  	 <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
						 	  	 	 <li class="page-item ${pageMaker.page ==idx? 'active' : ''}" >
							 	  	 	   <a class="page-link" href="${pageMaker.makeSearch(idx)}">${idx}</a>
							 	  	 </li>
					 	  	 </c:forEach>	
					 	  	 
					 	  	 <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					 	  	    <li class="page-item"><a class="page-link" href="${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
					 	  	 </c:if> 
					 	  </ul>
                       </nav>   
			         </div>
				</div>
				
</article>	

</body>