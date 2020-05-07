<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/cerulean/bootstrap.min.css" rel="stylesheet" integrity="sha384-LV/SIoc08vbV9CCeAwiz7RJZMI5YntsH8rGov0Y2nysmepqMWVvJqds6y0RaxIXT" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<style>

	* {
	box-sizing: border-box;
	}
	
	body{
		width:100%;
		height:100%;
		overflow:auto;
		margin:0 auto;
		text-align:center;
	}
	
	a{
		text-decoration:none;
	}
	
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


	.drp > .dropdown-menu{
		min-width:6rem;
	}
	
	.navbar{
		width:100%;
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
    </ul>
  </div>
</nav>

