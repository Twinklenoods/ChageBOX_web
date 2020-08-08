<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta name="viewport" content="width=device-width, user-scalable=no">
<style>
	.divBG{
	background:url("registered/png/bg02.png") center top no-repeat ;
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
	background:url("testbg/05.png") center top no-repeat ,	
				url("testbg/foot.png") center top no-repeat;
		position:relative;
		top:-450px;
		background-size: 100%;
		width: 100%;
		height: 770px;
		
		
	}
	
	header{
	background: url("psd/bg03.png") center top no-repeat;
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
		min-width:370px;
		height: 600px;
		
		
	}
	.article-1{
	margin: 0px 0px 0 0;
	position: relative;
	top:200px;
	left:40%;
	background: url("registered/png/page1.png") top center no-repeat;
	background-size: 100%;
	}
	
	.article-2{
	position: relative;
	left:10%;
	background: url("registered/png/page2.png") top center no-repeat;
	background-size: 100%;
	color:black;
	}
	
	
 	header ul {
	margin: 0px;
	list-style: none;
	width: 280px;
	margin: auto;
	}

	header li {
	float: left;
	padding: 5px 10px;
	border-left: 1px solid white;
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
	 	
	 	top:4%;
		left:21%;
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
	
	.spanerror{
	color: red;
	font-size: 11px;
	}

</style>
 <script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript">
	/*	$(document).ready(init);
		function init()
		{
			$("#add").click(addHandler);
			$("#remove").click(removeHandler);
			$("#toggle").click(toggleHandler);
			$("#submit01").click(btn1Handler);
		}
		
		function toggleHandler(){
			$(".article-1").toggleClass("show");
			$(".article-2").toggleClass("show2");
			
			   
			
		}
		function addHandler(){
			$(".article-1").addClass("show");
			$(".article-2").addClass("show2");
		}
		function removeHandler(){
			$(".article-1").removeClass("show");
			$(".article-2").removeClass("show2");
		}
		<input type="button" value="換頁" id="toggle"/>
		<input type="button" value="下一頁" id="add"/>
      	<input type="button" value="上一頁" id="remove"/>
		function btn1Handler(){
		$(".myDiv1").text("上一頁表單尚未完成");
		}*/
		$(document).ready(init4);
		function init4()
		{
			$("#password1").mousedown(downHandler2);
			$("#password1").mouseup(upHandler2);
			$("#password2").mousedown(downHandler2);
			$("#password2").mouseup(upHandler2);
		}
		function downHandler2(){
		
			$("#password1").attr("type","text");
			$("#password2").attr("type","text");
		
		}
		function upHandler2(){
			$("#password1").attr("type","password");
			$("#password2").attr("type","password");
		}
      	
      	
		</script>
</head>
<body>
    <div class="divBG">
    <header>
    <ul>
		<li><a href="/CB">Home</a></li>
		<li><a href=#>Products</a></li>
		<li><a href=#>Service</a></li>
		<li id="lastLi"><a href=#>Support</a></li>
	</ul>
    </header>
    <div id="main">
        <nav>nav</nav>
        <article>
        	
		<form autocomplete="off" method="post" action="register.do">
     		<article class="article-1"><br>
        	<span class="formSpan1">
      	<span style="color:red">*</span>
  		<label for="id">帳號:</label>
  		<input type="text" id="id" name="id" minlength="8" maxlength="16" placeHolder="帳號/ID" required ><br><br>
  		<span style="color:red">*</span>
  		<label for="name">姓名:</label>
  		<input type="text" id="name" name="name" autofocus  required placeHolder="姓名/NAME"><br><br>
  		<span style="color:red">*</span>
  		<label for="password">密碼:</label>
  		<input type="password" id="password1" name="pwd1" minlength="6" maxlength="8" required placeHolder="密碼/password"><br><br>
  		<span style="color:red">*</span>
  		<label for="password">確認:</label>
  		<input type="password" id="password2" name="pwd2" minlength="6" maxlength="8" required placeHolder="確認密碼/password"><br><br>
  		<span style="color:red">*</span>
  		<label for="email">信箱:</label>
  		<input type="email" id="email" name="email" autocomplete="on"  required placeHolder="信箱/E-MAIL(Gmail)"><br><br>
  		</span>
  		
        </article>
        <article class="article-2"><br>
        <span class="formSpan2">
        <span style="color:red"></span>
        <label for="mySelect">*地址:</label>
       	<select name="address" id="address" class="address" onchange="changeCity(this)">  
    				<option value="">請選擇</option>
    				<option value="基隆市">基隆市</option>
    				<option value="臺北市">臺北市</option>
    				<option value="新北市">新北市</option>
    				<option value="宜蘭縣">宜蘭縣</option>
    				<option value="新竹市">新竹市</option>
    				<option value="新竹縣">新竹縣</option>
    				<option value="桃園市">桃園市</option>
    				<option value="苗栗縣">苗栗縣</option>
    				<option value="臺中市">臺中市</option>
    				<option value="彰化縣">彰化縣</option>
    				<option value="南投縣">南投縣</option>
    				<option value="嘉義市">嘉義市</option>
    				<option value="嘉義縣">嘉義縣</option>
    				<option value="雲林縣">雲林縣</option>
    				<option value="臺南市">臺南市</option>
    				<option value="高雄市">高雄市</option>
    				<option value="屏東縣">屏東縣</option>
    				<option value="臺東縣">臺東縣</option>
    				<option value="花蓮縣">花蓮縣</option>
    				<option value="金門縣">金門縣</option>
    				<option value="連江縣">連江縣</option>
    				<option value="澎湖縣">澎湖縣</option>
    	</select><br><br>
  				<span style="color:red">*</span>
        		<label for="birthday">生日:</label>
  				<input type="date" id="birthday" name="birthday" required><br><br>
  				<label for="phone">*電話: </label>
  				<input type="tel" id="phone" name="phone"><br><br>
  				 <span style="color:red">*</span>
  				 <label for="gender1">性別:</label>
  				 <input type="radio" id="gender1" name="gender" value="M" required>
				 <label for="gender1">男</label>
				 <input type="radio" id="gender2" name="gender" value="F" required>
				 <label for="gender2">女</label><br><br>
  				<input type="submit" id="submit01" ><label for="submit01" class="myDiv1"></label>
  				<span class="spanerror"><%  List<String> errors = (List<String>)request.getAttribute("errors");	%>
     			<%out.print(errors!=null?errors:"");%></span>
				</span>
				
        </article>
     </form><br>	
     	
        </article>
        <aside>aside</aside>
    </div>
    <footer>footer</footer>
    </div>
</body>
</html>
