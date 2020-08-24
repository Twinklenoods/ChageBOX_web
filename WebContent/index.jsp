<%@page import="sun.security.util.Length"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
<%@page import="uuu.vgb.entity.Customer" %>
<%@page errorPage="error.jsp"  %>
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
#aside-2{
		
		background-image:url("image/yellow/stamp2.png");
		background-repeat: no-repeat;
		background-position: left;
		
		}
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
		padding: 0px 10px;
		
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
	.my-class{display: none;}
	</style>
	
	 <script type="text/javascript" src="jquery.js"></script>
			<script type="text/javascript" src="js/IndexJs.js">
			</script><script type="text/javascript">
			$(document).ready(init4);
			$(document).ready(init011);
		function refreshCaptcha(){
		var captchaImg= document.getElementById("captchaImg");
		captchaImg.src ="images/captcha.jpg?refresh="+new Date();
		
		}
		
		function init4()
		{
			$(".showin-button").click(inHandler);
			$("#password").mousedown(downHandler2);
			$("#password").mouseup(upHandler2);
		}
		function downHandler2(){
		
			$("#password").attr("type","text");
		
		}
		function upHandler2(){
			
			$("#password").attr("type","password");
		}
		<%if("post".equalsIgnoreCase(request.getMethod())){ %>
		$(fieldRepopulate);
		
		function fieldRepopulate(){
			//alert('fieldRepopulate');
			
			$("#name").val('<%=request.getParameter("id")%>')
			
		}
		<% }%>
		/**/
		function init011(){
	
	$(".ch01").click(clickHandler1);
	$(".ch02").click(clickHandler2);
	$(".showin-button").click(inHandler);
	
}


function clickHandler1(){
	$(".table01").stop().slideToggle( 500 );

	}
function clickHandler2(){
	$(".table02").stop().slideToggle( 500 );
	}
function inHandler() {
	var op = $('.block').css('left');

    if (op == '-550px')
    	$(".block").animate({left:"0px"},500);

    else if(op == '0px')
    	$(".block").animate({left:"-550px"},500);        

}

var rector =3;
var stopit = 0;
var a=1;
var zhend;
function init2(which)
{
  stopit =0;
  zhend = which;
  zhend.style.left =0;
  zhend.style.top =0;
}
function rattleimage()
{
  if(stopit==1)
  {
    return;
  }  
  if(a==1)
  {
    zhend.style.top = parseInt(zhend.style.top)+rector+"px";
  }
  else if(a==2)
  {
    zhend.style.left = parseInt(zhend.style.left)+rector+"px";
  }
  else if(a==3)
  {
    zhend.style.top = parseInt(zhend.style.top)-rector+"px";
  }
  else 
  {
    zhend.style.left = parseInt(zhend.style.left)-rector+"px";
  }
  if(a<4)a++;  else a =1;
  setTimeout("rattleimage()",500);
}

function stoprattle(which)
{
  stopit = 1;
  which.style.left =0;  
  which.style.top =0;    
}
		</script>
			
	</head>
	<body>
	    <div class="divBG">
	    <a href="#" id="gotop" title="Go To Top" data-tracking="nav,jump,top">
   					<i class="gototop"></i></a>	
	    	<header>
	    		<ul>
					<li><a href="/CB"><img style="width: 100%;" src="image/yellow/home.png" title="home"></a></li>
					<li>
					<form style="position: relative;top:-10px;" action="<%= request.getContextPath() %>/buy.jsp">
					<input type="search" name="search" placeholder="請輸入關鍵字..." style="width: 120px;height: 30px;">
					<input type="submit" value=""  style="background-image:url(image/yellow/3-1.png);width:30px;height:30px;background-size: 100%;position: relative;top:10px;border: none;">
					</form>
					</li>
					<li class="li-01"><%Customer member=(Customer)session.getAttribute("member");%>
 					<%= member!=null?member.getName():""%>
 					<% if(member == null){ %><a href="<%=request.getContextPath() %>">Login</a>
 					 <%}else{ %>
 					 <a href="<%=request.getContextPath() %>/logout.do">Logout</a>
 					 <% } %> </li>
 					 <li><a href="<%= request.getContextPath() %>/cart.jsp"><img style="width: 80%;" id="cart" src="image/yellow/cart.png" title="購物車"></a></li>
					
				</ul>
					
					
 					
 					
	    	</header>
	    	<div class="taible"></div>
			<div id="main">
				<nav>
					<nav id="nav-2">
						nav-2 NEW 黑板
						<%ProductSelectService service =new ProductSelectService();
							List<Product> list =service.getUpdown("yes");
	    				%>
						<ul id="tabs">
	        				<li><a href="#tab1" id="tab0" class="tab" title="最新交換">最新交換</a></li>
	      				<li><a href="#tab2" id="tab-b" class="tab" title="最新交易">最新交易</a></li>
	       					<li><a href="#tab3" id="tab-a" class="tab">TAB 3</a></li>
	    				</ul>
   						<div id="container">
    						<div id="tab1" class="tab_content">
           					<h1>交換</h1>
                            	 You have HTML5 on the brain. Tell the world.
        					</div>
        					<div id="tab2" class="tab_content">
            				<h1>交易</h1>
            					<% if(list!=null && list.size()>0) {%>
	    	
	    						<div>
	    							<% for(int i=0;i<7;i++) {
	    								Product p = list.get(i);
	    							%>
	    	
	    						<div class="div-buy" >
						    		<a href="buyIn.jsp?buyInId=<%= p.getId() %>">
						    	 	<p><%=i+1%>:<%=p.getName()%>&emsp;(<%=p.getCreateTime()%>)</p></a><br>
						    	 	
						    	</div>
	    							<%} %>
	    							<%}else{ %>
	    							<p>查無產品</p>
	    							<% }%>
	    						</div>
        					</div>
        					<div id="tab3" class="tab_content">
            				<h1>HTML5 in the Wild</h1>
            					The HTML5 logo gallery (below) shows off community creativity. We invite you to submit your sightings, whether screen shots or movies or cupcakes.
        					</div>
   					 	</div>
					</nav><br>					
					<nav id="nav-1">
						<a href="member/mywork.jsp"><img id="mywork" src="image/psd/myWork.png" title="我的管理"></a>
						<img id="masage" src="image/psd/masage.png" title="悄悄話">
						<a href="buy.jsp"><img id="buy" src="image/psd/buy.png" title="買賣"></a>
						<a href="pand.jsp"><img id="pand" src="image/psd/pand.png" title="許願池"></a>
						<a href="change.jsp"><img id="change01" src="image/psd/change01.png" title="交換"></a>
					</nav>
					
				</nav>
				<article>
					<article id="article-1"><div class="rwd_slider_container_wrapper">
    <div class="rwd_slider_container">  
        <div class="slider_container">
            <div>
                <img src="image/NewPa/top01.jpg" alt="pure css slider" width="400" height="280" />
                <span class="info">《對馬戰鬼》（PS4）</span>
            </div>
            <div>
                <img src="image/NewPa/top02.jpg" alt="pure css slider" width="400" height="280" />
                <span class="info">《紙片瑪利歐：摺紙國王》</span>
            </div>
            <div>
                <img src="image/NewPa/top03.jpg" alt="pure css slider" width="400" height="280" />
                <span class="info">《集合啦！動物森友會》</span>
            </div>
            <div>
                <img src="image/NewPa/top04.jpg" alt="pure css slider" width="400" height="280" />
                <span class="info">《瑪利歐賽車 8 豪華版》</span>
            </div>
            <div>
                <img src="image/NewPa/top05.jpg" alt="pure css slider" width="400" height="280" />
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
					<aside id="aside-2"><div><img src="image/yellow/member.png" style="height:75px; width: 360px;vertical-align:top;float: inherit;"></div>
					<% if(member == null){ %>	
					<form class="formC" ng-class="myVar" autocomplete="off" method="post" action="login.do"style="height: 399px;margin-top: 15px;">
						<span class="formSpan"> 
								  <label for="name"></label>
                                  <input type="text" id="name" name="id" autofocus required placeHolder="ID/帳號"
                                  value='<%// ="post".equalsIgnoreCase(request.getMethod())?request.getParameter("id"):id %>'
                                  ><br>
                                  <% //<input type="checkbox" name="keepId"<%= keepId % > value='ON' ${cookie.auto.value}/>記住我的帳號<br>%>
                                  <label for="password"></label>
                                  <input type="password" id="password" name="pwd"  placeHolder="passwod/密碼" minlength="6" maxlength="8"><br>
                                  <input type="text" id="captcha" name="captcha" required placeHolder="請輸入驗證碼"><br> 
                                  <img class="t01" id="captchaImg" src="images/captcha.jpg" onclick="refreshCaptcha()"><br>
                                  
								</span><input type="submit" value="會員登入" class="customer" id="customer" >
                                  <li class="coust-1">還不是會員?<a href="register.jsp" id="">加入會員</a>/<a href="#" id="" class="coust-2" >忘記密碼</a>
									<span class="spanerror">
									<%
									//讀取cookies:id , keepid
 							//		Cookie[] cookies =request.getCookies();
 							//		String id ="";
 							//		String keepId="";
 							//		if(cookies!=null){
 							//			for(int i=0;i<cookies.length;i++)
 							//			Cookie theCookie = cookies[i];	
 							//			if(theCookie.getName().equals("id")){
 							//				id= theCookie.getValue();
 							//				}else if(theCookie.getName().equals("keepId")){
 							//					keepId = theCookie.getValue();
 							//			}
 							//		}
									
									
									List<String> errors = (List<String>)request.getAttribute("errors");	%>
     									<%out.print(errors!=null?errors:"");%></span>
										</li>
	        			</form>	
	        			 <%}else{ %>
 					 <a href="<%=request.getContextPath() %>/logout.do"><img src="image/yellow/logout.png" style="position: relative; width: 360px;"class="showin-button" onmousemove="init2(this);rattleimage();"
			onmouseout="stoprattle(this);"></a>
 					 <% } %>
					</aside>
				</aside>
			</div>
			<footer></footer>
	    </div>
	</body>
	</html>
