<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<meta charset="UTF-8">
<title>buy page</title>
<LINK href="css/IndexDivBG.css" rel="stylesheet" type="text/css">
<LINK href="css/ad01.css" rel="stylesheet" type="text/css">
<style>
.divBG{
min-width: 1430px;




}
	nav{	
	height:70%;
	
	position: relative;
	top:114px;
	margin: 50px;
}

footer{
position: relative;
top:0px;
}

.nav001{
		
		height: 250px;
		width:410px;
		background: url("image/buy/buyopen.png") center top no-repeat;
		background-size:100%;
		
		
		float: left;
		margin: 15px  0 10px 5px;
		
}
.nav001 p{
		color: white;
		position: relative;
		right:180px;
		top:10px;
		text-align: right;
		
	}
.byImg{
width:150px;
position: relative;
right:100px;
top:-20px;
border: 2px solid  red;
}
.link-button{
position: relative;
left:300px;
top:100px;
width: 30%;
transition: transform 0.333s;
transition: all 0.333s;
transition: transform 0.333s, opacity 0.333s;
}
.link-button:hover {
	opacity: 1;
	transform: scale(1.1, 1.1);
}
	
</style>
 <script type="text/javascript" src="jquery.js"></script>
			<script type="text/javascript" src="js/IndexJs.js">
			</script><script type="text/javascript">
			</script>
</head>
<body>
	
	 <div class="divBG">
	 	<a href="#" id="gotop" title="Go To Top" data-tracking="nav,jump,top">
   					<i class="gototop"></i></a>	
	 	<header>
	 			<ul>
					<li><a href="/CB">Home</a></li>
					<li><a href=#>登入</a></li>
					<li><a href=#>Service</a></li>
					<li id="lastLi"><a href=#>Support</a></li>
				</ul>
	    	</header>
	    	<nav>
	    	<nav class="nav001"><p>ID<<br>價錢</p>
	    	<img class="link-button" src="image/buy/link.png">
	    	<img class="byImg" src="image/NewPa/top09.jpg">
	    	</nav>
	    	<nav class="nav001"><p>ID<<br>價錢</p>
	    	<img class="link-button" src="image/buy/link.png">
	    	<img class="byImg" src="image/NewPa/top09.jpg">
	    	</nav>
	    	<nav class="nav001"><p>ID<<br>價錢</p>
	    	<img class="link-button" src="image/buy/link.png">
	    	<img class="byImg" src="image/NewPa/top09.jpg">
	    	</nav>
	    	
	    	
	    	<nav class="nav001"><p>ID<br>圖<br>價錢</p></nav>
	    	<nav class="nav001"><p>ID<br>圖<br>價錢</p></nav>
	    	
	    	
	    	
	    	</nav>
	    	
	    	
	    	
	    	
	    	</nav>
	    	<footer></footer>
	 </div>
</body>
</html>