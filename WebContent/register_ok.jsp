<%@page import="uuu.vgb.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no">
<LINK href="css/IndexDivBG.css" rel="stylesheet" type="text/css">
<LINK href="css/ad01.css" rel="stylesheet" type="text/css">
<title>註冊成功</title>
<meta http-equiv="refresh" content="10;<% out.print(request.getContextPath()); %>">
<style>
	.divBG{
	background:url("image/registered/png/bg02.png") center top no-repeat ;
	color: white;
	width:100%;
	height: 2000px;
	position: absolute;
	top:0;
	left:0;
	}
	
	#main {
		width:100%;
		max-width:1950px;
		margin: 0px;
		padding: 0px;
		display: flex;
		height:1600px;
	}
	#main > article,#main > nav,#main > aside,footer {
		margin: 0px;
		padding: 0px;
		position:relative;
		top:114px;
		
		
	}
	#main > article {
		
		
		flex-grow: 5;
	}

	#main > nav {
		
		flex-grow: 1;
	}

	#main > aside {
		flex-grow: 1;
	}

	footer{
	background:url("image/testbg/05.png") center top no-repeat ,	
				url("image/testbg/foot.png") center top no-repeat;
		position:relative;
		top:-450px;
		background-size: 100%;
		width: 100%;
		height: 770px;
		
		
	}
	
	header{
	background: url("image/psd/bg03.png") center top no-repeat;
		display: block;			
		position: fixed;
		background-size: 100% 100%;
		width: 100%;
		height: 100px;
		margin:about;
		z-index:99;
	}
	
	.article-1, .article-2{
		max-width: 600px;
		min-width:400px;
		height: 600px;
		
		
	}
	.article-1{
	margin: 0px 0px 0 0;
	position: relative;
	top:200px;
	left:30%;
	background: url("image/registered/png/register.png") top center no-repeat;
	background-size: 100%;
	}
	
	
	
	
 	header ul {
	margin: 0px;
	list-style: none;
	width: 880px;
	margin: auto;
	}

	header li {
	float: left;
	padding: 5px 10px;
	
	}
	
	a {
	text-decoration: underline;
	text-decoration: overline;
	text-decoration: line-through;
	text-decoration: none;
	}
	a:link {
		color: white;
		
		
	}
	
	a:visited {
		color: white;
	}
	
	a:hover {
		color: red;
	}
	
	a:active {
		color: rgb(195,0,0);
	}
	
	 a.non-action:hover {
	      opacity: 1;
	    }
	
	inputㄝ, select{
	
	 font-size: 18px;
	 margin: 5px;
	}
	    
	 .formSpan1{
	 position: relative;
	 top:150px;
	 left:120px;
	 color:white;
	 }
	 
	  .formSpan2{
	 position: relative;
	 top:90px;
	 left:170px;
	 
	 }
	 #toggle{
	display: none;
	}	
	@media screen and (max-width: 800px){
	
	.formSpan1
	{
	top:10%;
		left:10%;
	}
	 .formSpan2{
	 	
	 	top:9%;
		left:25%;
	}
	 
	
	.article{
	
	}
	.article-1, .article-2{
		position: static;
		 text-align: left;
		}
	.article-2{
		display:;
		position:relative;
	 	top:-200px;
	 	left:-20px;
		}
	#toggle{
	display: block;
	position: relative;
	top:310px;
	left:455px;
	}	
		#main{
			flex-direction: column;
			
		}
		#main > aside {
			display:none;
		}
		#main > nav {
			display:none;
		}
		
	}
	
	
	@media screen and (min-width: 1200px){
	.article-1, .article-2{
		display: block;
		}
	.article-1{
		display: block;
		}
		}
	
	#tabs{
	padding:0;
	margin:0;
	
	
}

	#tabs li{
	list-style:none;
	float:left;
	margin-right:5px;
	}
	.show{
		display:none;
	}
	.show2{
		display:block;
	}
	
	
	
</style>

</head>

<body>
<div class="divBG">
<header>
	    	
	    		<ul>
					<li><a href="/CB"><img style="width: 100%;margin-top: 10px;" src="image/yellow/home.png" title="home"></a></li>
					<li>
					<form style="position: relative;top:-10px;" action="<%= request.getContextPath() %>/buy.jsp">
					<input type="search" name="search" placeholder="請輸入關鍵字..." style="width: 120px;height: 30px;">
					<input type="submit" value=""  style="background-image:url(image/yellow/3-1.png);width:30px;height:30px;margin-top: 10px;background-size: 100%;position: relative;top:10px;border: none;">
					</form>
					</li>	
				</ul>
					
					
 					
 					
	    	</header>
	 <article>
	<%Customer c =(Customer)request.getAttribute("customer");out.print(c.getName());%>
	<article class="article-1">
	</article>
	</article>
</div>
</body>
</html>