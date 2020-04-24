<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">   
<style>

	* {
	box-sizing: border-box;
	}
	
	body{
		width:100%;
		height:100%;
		overflow:hidden;
		margin:0 auto;
		text-align:center;
	}
	
	a{
		text-decoration:none;
	}
	
	 a:link { color: red; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: #666; text-decoration: none;}

	

	div,ul,  li, h1, h2, h3, h4, h5, h6, form, p, th, td{
    margin:0;
    padding: 0;
    border:none;
	}
	
	ul, li{
			  list-style: none;
			}
	
	div{
		display:block;
	}
	
	.nav-wid{
		width:1000px;
	}

</style>

<body>


	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01" style="width:1000px">
    <a class="navbar-brand" href="${pageContext.request.contextPath}">Board</a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
<!--       <li class="nav-item active"> -->
<%--         <a class="nav-link" href="${pageContext.request.contextPath}">Home <span class="sr-only">(current)</span></a> --%>
<!--       </li> -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" href="#">Link</a> -->
<!--       </li> -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
<!--       </li> -->
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

