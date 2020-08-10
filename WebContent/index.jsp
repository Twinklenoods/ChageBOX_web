<%@page import="uuu.vgb.entity.Customer" %>
<%@ page errorpage="error.jsp" %>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Index</title>
<meta name="viewport" content="width=device-width, user-scalable=no">
<LINK href="css/IndexDivBG.css" rel="stylesheet" type="text/css">
<LINK href="css/ad01.css" rel="stylesheet" type="text/css">
<style>

	@media screen and (max-width: 1200px){
		#article-2 a{
				margin:-14px 10px 10px 10px;
		}
		#main{
			flex-direction: column;
			
		}
		#main > aside {
			order: 2;
			margin: 0;
		}
		#aside-1{
			display:none
		}
		
		#main > article {
			order: 1;
			margin: 0;
		}
		#article-1{
		width:100%;
		background-size: 100%;
		}
		#article-2{
		position: relative;
		top:0px;
		margin: 0px;
		
		}
		#nav-1{
		position: relative;
		top:0px;
		margin: 0px;
		}
		
		#aside-2{
		position: relative;
		top:0px;
		margin:0;
		left:0;
		
		}
		#nav-1 img{
		position: relative;
		z-index: 98;
		
		}
		
		#main > nav {
			order: 3;
			width:100%;
			
		}
		#nav-2{
		display:none
		}
		.taible{
		display:none;
		}
		footer{
		position: static;
		}
	}
	
	
	@media screen and (min-width: 1200px) and (max-width: 1600px){
		#main > aside {
			order: 2;
			flex-grow:2
		}
		
		#main > article {
			
			display:none;
		}
	
		#main > nav {
			order: 1;
			flex-grow:1
		}
		.taible{
		display:none;
		}
		footer{
		position: static;
		}
	}

	@media screen and (min-width: 1600px){
	}
		
	#article-2 ul {
		margin: 0px;
		list-style: none;
		width: 280px;
		margin: auto;
	}

	#article-2 li {
		float: left;
		padding: 5px 10px;
		
	}
	.class2{
	display: block;
	text-align: right,justify;
	margin: -100px;
	}
	
	#article-2{
	border: double 18px;
	}
	
	.spanerror{
	color: red;
	font-size: 11px;
	}
	.class2{color: red;}
	</style>
	
	 <script type="text/javascript" src="jquery.js"></script>
			<script type="text/javascript" src="js/IndexJs.js">
			</script><script type="text/javascript">
			$(document).ready(init4);
		function refreshCaptcha(){
		var captchaImg= document.getElementById("captchaImg");
		captchaImg.src ="images/captcha.jpg?refresh="+new Date();
		
		}
		
		function init4()
		{
			$("#password").mousedown(downHandler2);
			$("#password").mouseup(upHandler2);
		}
		function downHandler2(){
		
			$("#password").attr("type","text");
		
		}
		function upHandler2(){
			
			$("#password").attr("type","password");
		}
			</script>
			
	</head>
	<body>
	    <div class="divBG">
	    <a href="#" id="gotop" title="Go To Top" data-tracking="nav,jump,top">
   					<i class="gototop"></i></a>	
	    	<header>
	    		<ul>
					<li><a href="/CB">Home</a></li>
					<li><a href=#>Products</a></li>
					<li><a href=#>Service</a></li>
					<li><%

            Object obj=request.getAttribute("customer");

            Customer c = null;

            if(obj instanceof Customer){

                c = (Customer)obj;

            } %><%= c!=null?c.getName():""%>,你好</li>
				
				</ul>
	    	</header>
	    	<div class="taible">taible</div>
			<div id="main">
				<nav>
					<nav id="nav-2">
						nav-2 NEW 黑板
						<ul id="tabs">
	        				<li><a href="#tab1" id="tab0" class="tab" title="最新交換">最新交換</a></li>
	      				<li><a href="#tab2" id="tab-b" class="tab" title="最新交易">最新交易</a></li>
	       					<li><a href="#tab3" id="tab-a" class="tab">TAB 3</a></li>
	    				</ul>
   						<div id="container">
    						<div id="tab1" class="tab_content">
           					<h1>Use The Logo</h1>
                            	 You have HTML5 on the brain. Tell the world.
        					</div>
        					<div id="tab2" class="tab_content tab_content2">
            				<h1>Show Some Love</h1>
            					This HTML5 logo is licensed under Creative Commons Attribution 3.0 — all are free to use and reimagine as they see fit. Stickers and T-Shirts are available now; more stuff to come.
        					</div>
        					<div id="tab3" class="tab_content">
            				<h1>HTML5 in the Wild</h1>
            					The HTML5 logo gallery (below) shows off community creativity. We invite you to submit your sightings, whether screen shots or movies or cupcakes.
        					</div>
   					 	</div>
					</nav><br>					
					<nav id="nav-1">
						<a href="mywork.jsp"><img id="mywork" src="psd/myWork.png" title="我的管理"></a>
						<img id="masage" src="psd/masage.png" title="悄悄話">
						<a href="buy.jsp"><img id="buy" src="psd/buy.png" title="買賣"></a>
						<a href="pand.jsp"><img id="pand" src="psd/pand.png" title="許願池"></a>
						<a href="change.jsp"><img id="change01" src="psd/change01.png" title="交換"></a>
					</nav>
					
				</nav>
				<article>
					<article id="article-1"><div class="rwd_slider_container_wrapper">
    <div class="rwd_slider_container">  
        <div class="slider_container">
            <div>
                <img src="NewPa/top01.jpg" alt="pure css slider" width="400" height="280" />
                <span class="info">《對馬戰鬼》（PS4）</span>
            </div>
            <div>
                <img src="NewPa/top02.jpg" alt="pure css slider" width="400" height="280" />
                <span class="info">《紙片瑪利歐：摺紙國王》</span>
            </div>
            <div>
                <img src="NewPa/top03.jpg" alt="pure css slider" width="400" height="280" />
                <span class="info">《集合啦！動物森友會》</span>
            </div>
            <div>
                <img src="NewPa/top04.jpg" alt="pure css slider" width="400" height="280" />
                <span class="info">《瑪利歐賽車 8 豪華版》</span>
            </div>
            <div>
                <img src="NewPa/top05.jpg" alt="pure css slider" width="400" height="280" />
                <span class="info">《健身環大冒險》</span>
            </div>
        </div>
    </div>
</div></article><br>
					<article id="article-2">
					<h1>Hot Top 5<h1>
					<p>Top1《對馬戰鬼》（PS4）</p><br>
					<p>Top2《紙片瑪利歐：摺紙國王》（NS Switch）</p><br> 
					<p>Top3《集合啦！動物森友會》（NS Switch）</P><br>
					<p>Top4《瑪利歐賽車 8 豪華版》（NS Switch）</P><br>
					<P>Top5《健身環大冒險》（NS Switch）</p>
					
					<h4><a href="pa.jsp" class="class2" >...更多</a><h4>
					
					</article>
				</article>
				<aside>
					<aside id="aside-1">
					</aside><br>
					<aside id="aside-2">aside-2 會員登入區<br>
						<form autocomplete="off" method="post" action="login.do"style="height: 399px;">
						<span class="formSpan"> 
								  <label for="name"></label>
                                  <input type="text" id="name" name="id" autofocus required placeHolder="ID/帳號""><br>
                                  <label for="password"></label>
                                  <input type="password" id="password" name="pwd"  placeHolder="passwod/密碼" minlength="6" maxlength="8"><br>
                                  <input type="text" id="captcha" name="captcha" required placeHolder="請輸入驗證碼"><br> 
                                  <img class="t01" id="captchaImg" src="images/captcha.jpg" onclick="refreshCaptcha()"><br>
                                  
								</span><input type="submit" value="會員登入" class="customer">
                                  <li class="coust-1">還不是會員?<a href="register.jsp" id="">加入會員</a>/<a href="#" id="" class="coust-2" >忘記密碼</a>
									<span class="spanerror"><%  List<String> errors = (List<String>)request.getAttribute("errors");	%>
     									<%out.print(errors!=null?errors:"");%></span>
										</li>
	        				
	        			</form>	
					</aside>
				</aside>
			</div>
			<footer></footer>
	    </div>
	</body>
	</html>
