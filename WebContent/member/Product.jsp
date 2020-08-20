<%@page import="uuu.vgb.entity.Customer" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<meta charset="UTF-8">
<title>Insert title here</title>
<LINK href="css/IndexDivBG.css" rel="stylesheet" type="text/css">
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
height:1500px;

display: flex;
}

/*.formSpan1{
	 position: relative;
	 top:20%;
	 left:50%;
	 color:white;
	 }*/
	 .article{
	
	}
	.article-1, .article-2{
		position: static;
		 text-align: left;
		margin-left: 300px; 
		margin-top: 15%;
		}
	 
	
	 #toggle{
	display: none;
	}	
	@media screen and (max-width: 800px){
	
	

	 
	
	.article{
	
	}
	.article-1, .article-2{
		position: static;
		 text-align: left;
		margin-left: 200px; 
		margin-top: 15%;
		}
	.article-2{
		
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
	.owner{
	display:NONE
	}
</style>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="js/IndexJs.js">
</script><script type="text/javascript">
$(document).ready(init7);
/*alert("test");*/
function init7(){
	
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

var file = undefined;
var reader = undefined;
$(document).ready(init21);
function init21(){	
	file = $("#fileInput")[0];
	$("#fileInput").change(fileChangeHandler);
	reader = new FileReader();
	$(reader).on("load",loadendHandler);
}



function fileChangeHandler(){
	
	if( file.files.length > 0 ){
		var selectedFile = file.files[0];
		
		reader.readAsDataURL(selectedFile);
	}else{
		$("#status").html("No file selected!");
	}
}

function loadendHandler(){
   	$("#preview").attr("src",reader.result);
	$("#preview").fadeIn(500);
}

/*show buy*/ 
function Show(which){
	if(which=='change'){
	 	if(document.getElementById("change").checked ==true){
			document.getElementById("Schange").style.display = "block";
			$('#WantChange').attr("required", "true");
		}else{
			document.getElementById("Schange").style.display = "none";
			$('#WantChange').removeAttr("required");
		} 
	}
	if(which=='buy'){
	 	if(document.getElementById("buy").checked ==true){
			document.getElementById("Sbuy").style.display = "block";
			$('#BuyPrice').attr("required", "true");
		}else{
			document.getElementById("Sbuy").style.display = "none";
			$('#BuyPrice').removeAttr("required");
		} 
	}

}
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
		<nav class="n02"><form autocomplete="off" method="post" action="Product.do">
     			<article class="article-1"><br>
        			<span class="formSpan1">
        			<span style="color:red">*</span>
        			<label for="mySelect">物品分類:</label>
       				<select id="mySelect" required name="host">
        				<optgroup label="主機平台" >
	   						<option value="Switch">Switch</option>
	  						<option value="PS4">PS4</option>
  						</optgroup>
   					</select>
   					<input class="add-attr" type="checkbox" name="buy" id="buy" value="yes" onchange="Show('buy')">買賣
   					
					<input class="add-attr" type="checkbox" name="change" id="change" value="yes" onchange="Show('change')" checked="checked">交換
					<hr><br><br><br>
					<span style="color:red">*</span>
        			<input type="text" id="name" name="name" autofocus required placeholder="遊戲名稱"><br><br>
        			<label for="comment1"></label><br>
       				<textarea id="comment1" name="comment1" placeholder="商品敘述 最多100個字" maxlength="100"style="width: 300px;height: 200px;"></textarea><br>
     				<span style="color:red">*</span>
     				<label for="fileInput">遊戲圖片上傳</label><br>
     				<input type="file" id="fileInput" value="" name="img" accept="image/png,image/jpeg" required>
     				<div id="status"></div>
    				<img id="preview" alt=""><br>
    				<label for="origin">物品所在地</label>
    				<select name="origin" id="origin" class="origin" onchange="changeCity(this)">  
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
    				</select><br>
    				
    				<div id="Sbuy" style="display: none;">
					<div class="ap_item_title f14"><span style="color:red">*</span>直購資料（願意買賣才需要填寫）</div>
		  			<input id="BuyPrice" type="text" name="BuyPrice" size="16" class="ap_w150_h30 f12 corner_textbox" value="0" placeholder="直購價格">（價格若無特別說明直購價包含運費）
  					</div>
  					<div id="Schange" ><br>想交換物品<br><textarea  required="required" name="WantChange" id="WantChange" rows="5" cols="50" class="ap_area_w500_h80" placeholder="想交換的遊戲 最多100個字" maxlength="100"></textarea><br></div>
  					<input class="owner" type="text" name="owner" value="<%Customer member=(Customer)session.getAttribute("member");%><%= member!=null?member.getId():""%>">
  					
  					<input class="owner" type="text" name="ownerN" value="<% member=(Customer)session.getAttribute("member");%><%= member!=null?member.getName():""%>">
  					
  				<input type="submit" id="submit01" onclick="return(confirm('確認是否送出?'),alert('已完成'))"><label for="submit01" class="myDiv1"></label>
  				</span>
  				
  				
 				
  				
  				</article>
  				</form></nav>
	</nav>
   	<footer style="top: -300px;">footer</footer>
    </div>
    </div>
</body>
</html>