<%@page import="java.time.LocalDate"%>
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
<LINK href="css/left.css" rel="stylesheet" type="text/css">
  <style>

header li {
	float: left;
	padding: 5px 10px;
	
	font-family:Bradley Hand ITC;
	font-size: 22px;
	font-weight:bold;
}

.divBG{
min-width: 600px;
}
	@media screen and (max-width: 600px){}
	@media screen and (min-width: 600px) and (max-width: 800px){}

 
.showin-button{ position:relative; }
footer{
	background: url("image/testbg/pa.png") center top no-repeat,
	url("testbg/foot.png") center top no-repeat;
	top:-70px;
	position:relative;
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
	.none{
	display: none;
	background: white;
	color:black;
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
	
	$(".remind").click(clickHandlerTEST);
	
}

function clickHandlerTEST(){
	$(".none").stop().slideToggle( 500 );
	
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

<%  Customer member = (Customer)session.getAttribute("member");			
	//Customer c= member.getClass().newInstance();			
if("POST".equalsIgnoreCase(request.getMethod())) { %>
				$(fieldRepopulate); //$() 等同與$(document).ready(...)
				function fieldRepopulate(){					
					//alert('fieldRepopulate');
					$("#id").val('<%= request.getParameter("id")%>');
					$("#name1").val('<%= request.getParameter("name")%>');
					$("#email").val('<%= request.getParameter("email")%>');
					$("#birthday").val('<%= request.getParameter("birthday")%>');
					$("#phone").val('<%= request.getParameter("phone")%>');
					$("#address").val('<%= request.getParameter("address")%>'); 
					
					$("#<%= request.getParameter("gender")%>").prop("checked", true);  //radio
					
				
				}
			<%}else if("GET".equalsIgnoreCase(request.getMethod()) && member!=null){				%>
				$(fieldRepopulate); //$() 等同與$(document).ready(...)
				function fieldRepopulate(){					
					//alert('fieldRepopulate');
					$("#id").val('<%= member.getId() %>');
					$("#name1").val('<%= member.getName()%>');
					$("#email").val('<%= member.getEmail()%>');
					$("#birthday").val('<%= member.getBirthday()%>');
					$("#phone").val('<%= member.getPhone()%>');
					$("#address").val('<%= member.getAddress()%>');  
					
					$("#<%= member.getGender()%>").prop("checked", true);  //radio
					
					
				}
			<%}%>


</script>

</head>

<body><div id="main">
<div class="divBG">
 

<jsp:include page="/member/subviews/header.jsp" />

<nav >
    	<jsp:include page="/member/subviews/workLeft.jsp" />
		
		<div class="test01">
		<button class="test02">test</button>
		
		<li class="none">
		你有一則悄悄話
		</li>
		<li class="none">
		你有一則問答話
		</li>
		
		</div>
		
		
		
		
		
		
		
		
		
</nav>
   	<footer style="top: 450px;">footer</footer>
    </div>
    </div>
</body>
</html>