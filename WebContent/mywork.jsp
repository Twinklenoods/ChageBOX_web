<%@page import="uuu.vgb.entity.Customer"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<meta charset="UTF-8">
<title>Insert title here</title>
<LINK href="css/IndexDivBG.css" rel="stylesheet" type="text/css">
  <style>



.divBG{
min-width: 600px;
}
	@media screen and (max-width: 600px){}
	@media screen and (min-width: 600px) and (max-width: 800px){}

 .block {
    background-color: #abc;
    border: 2px solid black;
    width: 150px;
    height: 800px;
    margin: 100px 0 0 30px ;
    position:absolute;
	left:-550px;
	
	
  }
  
 .block  li {
	float: inherit;
	padding: 15px 10px 0 10px;
	border-top: 1px solid white;
	
}
.table01, .table02{
	display: none;
	background: white;
	color:black;
}
.n01{

width: 600px;
display: flex;
margin: 100px 0 0 0 ;
}
.n02{
background: ;
border: 2px solid black;;
height:1500px;

display: flex;
}
.showin-button{ position:relative; }
footer{
	background: url("testbg/pa.png") center top no-repeat,
	url("testbg/foot.png") center top no-repeat;
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
	
	
</style>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="js/IndexJs.js">
</script><script type="text/javascript">
$(document).ready(init);
/*alert("test");*/
function init(){
	
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

<body><div id="main">
<div class="divBG">
 
<header>	<ul>
				<li><a href="/CB">Home</a></li>
				<li><a href=#>Products</a></li>
				<li><a href=#>Service</a></li>
				<li id="lastLi"><a href=#>Support</a></li>
			</ul></header>
<nav >
    	
		<nav class="n01">
		<a href=#>
		<img class="showin-button" src="mywork/menu.png" title="選單" onmousemove="init2(this);rattleimage();"
			onmouseout="stoprattle(this);" style="
    		padding-left: 30px;padding-top: 10px;">
    	</a>
		
			<div class="block">
			<a href="mywork.jsp"><li>我的資訊</li><br></a>
			<li>悄悄話</li><br>
			<li>我的問答</li><br>
			<li>我的評價</li><br>
			<a href="Product.jsp"><li>新增物品</li><br></a>
			<li>我的物品</li><br>
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
		<nav class="n02"><form autocomplete="off" method="post" action="register.do">
     		<nav class="n03"><br>
        	<span class="formSpan03">
      	<span style="color:red">*</span>
  		<label for="id">帳號:</label>
  		<input type="text" id="id" name="id" minlength="8" maxlength="16" placeHolder="帳號/ID" required ><br><br>
  		<span style="color:red">*</span>
  		<label for="name">姓名:<%;out.print("吳大頭");%></label>
  		<br><br>
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
  		
        </nav>
        <nav class="n04"><br>
        <span class="formSpan04">
        <span style="color:red"></span>
        <label for="mySelect">*地區:</label>
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
        		<label for="birthday">生日:<%;out.print("1999-04-01");%></label>
  				<br><br>
  				<label for="phone">*電話: </label>
  				<input type="tel" id="phone" name="phone"><br><br>
  				 <span style="color:red">*</span>
  				 <label class for="gender1">性別:<%;out.print("男");%></label>
  				 <br><br>
  				<input type="submit" id="submit01" value="確認修改" ><label for="submit01" class="myDiv1"></label>
  				<span class="spanerror"><%  List<String> errors = (List<String>)request.getAttribute("errors");	%>
     			<%out.print(errors!=null?errors:"");%></span>
				</span>
				
        </nav>
     </form><br>	</nav>
	</nav>
   	<footer style="top: 450px;">footer</footer>
    </div>
    </div>
</body>
</html>