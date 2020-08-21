<%@page import="javafx.scene.control.ListCellBuilder"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
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
	margin: auto;
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
		margin: 0 1% 5% 2%;
		
		
}
.nav001 p{
		color: white;
		position:absolute;
		left:200px;
		margin:-60px 0 0 0;
		text-align:left;
		
	}
.byImg{
width:160px;
height:100px;
position: relative;
right:95px;
top:50px;
border: 2px solid  red;
}
.link-button{
position: relative;
left:300px;
top:150px;
width: 30%;
transition: transform 0.333s;
transition: all 0.333s;
transition: transform 0.333s, opacity 0.333s;
}
.link-button a{
z-index: 99;

}

.link-button:hover {
	opacity: 1;
	transform: scale(1.1, 1.1);
	
	
}
.001{
background-color:blue;
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
					<li><form action="<%= request.getContextPath() %>/buy.jsp">
					<input type="search" name="search" placeholder="請輸入關鍵字..." style="width: 120px;height: 30px;">
					<input type="submit" value="查詢">
					</form>
				</ul>
	    	</header>
	    	

			<div class="bg">
			<img style="width: 85% ; display: flex;margin: auto;" src="image/error/error.png">
			<div style="width: 85% ; display: flex;margin: auto;"><h1>網頁錯誤:<%=request.getAttribute("javax.servlet.error.request_uri") %></h1></div>
			</div>

</body>
</html>