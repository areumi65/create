<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<jsp:include page="../header.jsp"></jsp:include>
<script>
$(document).ready(function(){
    
    $("#searchBtn").on("click",
        function(event){
          var url ="list${pageMaker.makeQuery(1)}";
          url +="&searchType="+searchType()+"&keyword="+keywordInput();
          self.location =url;   
    });
 
});
 
function searchType(){
    return $("#searchType").val();
}
 
function keywordInput(){
    return $("#keywordInput").val();
}

</script>	
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
	
	.sortDrp {
		width:1000px;
		margin:0 auto;
	}

	.sortDrp > .sortBtn{
		left:0;
		top:50px;
		position:absolute;
	}
	
	.sortDrp >.writeBtn{
		right:0;
		top:50px;
		position:absolute;
	}
	
	.oldList{
		display:none;
	}
	
	
</style>

<script>
	
</script>

	<div class="dropdown sortDrp">
		<div class="sortBtn">
		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		   	sort
		  </button>
		  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		    <a class="dropdown-item" >오래된순</a>
		    <a class="dropdown-item" href="#">유머</a>
		    <a class="dropdown-item" href="#">정보</a>
		    <a class="dropdown-item" href="#">기타</a>
		  </div>
		</div>
		<div class="writeBtn">
			<a href="${pageContext.request.contextPath}/board/regist">
				<input class="btn btn-primary" type="button" value="글쓰기">
			</a>
		</div>
	</div>
	
	
<article style="width:1000px; margin:0 auto; position:relative;">
	
	
	<div class="blist">
		<c:choose>
			<c:when test="${boardList.size()>0}">
				<div class="defaultList">
					<table id="listT">
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
					
					<div class="nav">
					<nav aria-label="Page navigation example">
                        <ul class="pagination">
					 	  	 <c:if test="${pageMaker.prev}">
					 	  	 	<li><a href="memberListSearch${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
					 	  	 </c:if>
					 	  
					 	  	 <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
					 	  	 	 <li
					 	  	 	   <c:out value="${pageMaker.page ==idx? 'class=active' : ''}" />
					 	  	 	  >
					 	  	 	   <a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
					 	  	 </c:forEach>	
					 	  	 
					 	  	 <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					 	  	    <li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
					 	  	 </c:if> 
					 	  </ul>
                       </nav>   
			         </div>
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
</article>	

</body>