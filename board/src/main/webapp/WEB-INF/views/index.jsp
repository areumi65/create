<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="header.jsp"></jsp:include>
	
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
		padding:10px;
		border-bottom:2px solid #555;
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
	
	

</body>
<div style="margin-top:200px;">
	<a href="${pageContext.request.contextPath}/board/list">
		<button class="btn btn-primary" >글목록</button>
	</a>
	
	<a href="${pageContext.request.contextPath}/board/regist">
		<button class="btn btn-primary" >글등록</button>
	</a>
</div>



