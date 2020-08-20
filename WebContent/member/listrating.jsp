<%@page import="uuu.vgb.entity.Customer"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<meta charset="UTF-8">
<title>Insert title here</title>
<LINK href="css/IndexDivBG.css" rel="stylesheet" type="text/css">
<LINK href="css/left.css" rel="stylesheet" type="text/css">
  <style>

header li {
	float: left;
	padding: 5px 10px;
	border-left: 1px solid white;
	font-family:Bradley Hand ITC;
	font-size: 22px;
	font-weight:bold;
}

.divBG{
min-width: 1200px;
}
	@media screen and (max-width: 600px){}
	@media screen and (min-width: 600px) and (max-width: 800px){}

 
.showin-button{ position:relative; }
footer{
	background: url("image/testbg/pa.png") center top no-repeat,
	url("image/testbg/foot.png") center top no-repeat;
	top:-70px;position:relative;
		background-size: 100%;
		width: 100%;
		height: 700px;
	}
	
	.n01 img {
	transform-origin: center bottom;
	/*write code here*/
	opacity: 1;
	transition: transform 0.333s;
	transition: all 0.333s;
	transition: transform 0.333s, opacity 0.333s;
	}
	
	.n01 img:hover{
	opacity: 1;
	transform: scale(1.1, 1.1);
	}
	.n03, .n04{
	max-width: 600px;
		min-width:370px;
		height: 600px;
	}
	.n03{
	margin: 0px 0px 0 0;
	position: relative;
	top:100px;
	left:60%;
	background: url("image/registered/png/page1.png") top center no-repeat;
	background-size: 100%;
	
	}
	.n04{
	position: relative;
	top:-200px;
	left:60%;
	
	background: url("image/registered/png/page2.png") top center no-repeat;
	background-size: 100%;
	color:black;
	}
	.formSpan03{
	 position: relative;
	 top:60px;
	 left:60px;
	 color:white;
	 }
	 
	  .formSpan04{
	 position: relative;
	 top:30px;
	 left:70px;
	 
	 }
	.spanerror{
	color: red;
	font-size: 11px;
	}
	
#tabs{
	padding:0;
	margin: 0  0 0 200px;
	
}

#tabs li{
	list-style:none;
	float:left;
	margin-right:5px;
	
}

a.tab{
	text-decoration:none;
	background:url("../image/psd/myWork.png");
	padding:5px;
	color:white;
	position:relative;
	top:50px;
	left:50px;
	border:2px solid rgb(195,0,0);
}



#container{
	clear:both;
	position:relative;
}

#container h1{
	font:26px Tahoma, Geneva, sans-serif;
	font-weight:bold;
	color:#069;
	margin:0;
	margin-bottom:5px;
	
}

.tab_content {
	
	width: 700px;
	height: 550px;
	position: absolute;
	background-color:rgba(0,0,0,0.9);
	border:2px solid rgb(195,0,0);
	filter: drop-shadow(12px 12px 7px rgba(0, 0, 0, 0.7));
   	box-shadow: 12px 12px 7px rgba(0, 0, 0, 0.7);
    border-radius: 5px;
	margin:120px 0 0 250px;
    text-align: center;
    
	
	color: white;
	padding: 80px;
}



#tabs-1{
	padding:0;
	margin: 0  0 0 300px;
	
}

#tabs-1 li{
	list-style:none;
	float:left;
	margin-right:5px;
	
}

a.tab1-1{
	text-decoration:none;
	
	padding:5px;
	color:white;
	position:relative;
	top:-50px;
	left:-50px;
	border:2px solid rgb(195,0,0);
}



#container-1{
	clear:both;
	position:relative;
}

#container-1 h1{
	font:26px Tahoma, Geneva, sans-serif;
	font-weight:bold;
	color:#069;
	margin:0;
	margin-bottom:5px;
	
}

.tab_content-1{
	border: 1px solid black;
	width: 400px;
	height: 300px;
	position: absolute;
	background:white;
	background-repeat:no-repeat;
	color: black;
	padding: 80px;
}
.tab_content-1:target{
	z-index: 99;
}



</style>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="js/IndexJs.js">
</script><script type="text/javascript">
$(document).ready(init011);
/*alert("test");*/
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

$(document).ready();
function refreshCaptcha(){
var captchaImg= document.getElementById("captchaImg");
captchaImg.src ="images/captcha.jpg?refresh="+new Date();

}
$(function() {
    /* 按下GoTop按鈕時的事件 */
    $('#tab01,#tab-a1, #tab-b1').click(function(){
        $('html,body').animate({ scrollTop: 100 }, 'slow');   /* 返回到最頂上 */
        
    });
});

</script>

</head>

<body><div id="main">
<div class="divBG">
 
<jsp:include page="/member/subviews/header.jsp" />
<nav >
    	
		<nav class="n01">
		<a href=#>
		<img class="showin-button" src="image/mywork/menu.png" title="選單" onmousemove="init2(this);rattleimage();"
			onmouseout="stoprattle(this);" style="
    		padding-left: 30px;padding-top: 10px;">
    	</a>
		
			<div class="block">
			<a href="mywork.jsp"><li>我的資訊</li><br></a>
			<li>悄悄話</li><br>
			<li>我的問答</li><br>
			<a href="listrating.jsp"><li>我的評價</li><br></a>
			<a href="Product.jsp"><li>新增物品</li><br></a>
			<a href="myproduct.jsp"><li>我的物品</li><br></a>
			<a href=# class="ch01">
			<li>交換</li><br>
			</a>
			<div class="table01">
			<li>我想交換</li><br>
			<li>想與我交換</li><br>
			</div>
			<a href=# class="ch02">
			<li>成交清單</li><br>
			</a>
			<div class="table02">
			<li>交換成功清單</li><br>
			<li>買賣成功清單</li><br>
			</div>
			</div>
		</nav>
		<nav class="n02">
     	<nav>
			<nav id="nav-2">
			<iframe src="listrating/c.jsp" name="a"  target="a"style="width: 800px;height: 800px;margin-left: 250px;">
			</iframe>
		</nav>
	</nav>
	</nav>
   	<footer style="top: 450px;">footer</footer>
    </div>
    </div>
</body>
</html></html>