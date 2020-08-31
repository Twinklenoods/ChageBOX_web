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
<title>change page</title>
<LINK href="css/IndexDivBG.css" rel="stylesheet" type="text/css">
<LINK href="css/ad01.css" rel="stylesheet" type="text/css">
<LINK rel="stylesheet" type="text/css"  href="fancybox/jquery.fancybox.css">
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
<script type="text/javascript" src="js/IndexJs.js"></script>
<script type="text/javascript" src="fancybox/jquery.fancybox.js"></script>
<script type="text/javascript">
function getProductJSP(PrductId){
		
	//同步請求
	<%--location.href="<%=request.getContextPath()%>/buyIn.jsp?buyInId="+PrductId;--%>
	//非同步GET請求
	$.ajax({
		
		url:"<%=request.getContextPath()%>/changeIn_ajax.jsp?buyInId="+PrductId,
		meth:'GET'	
	
	
	}).done(getProductJSP_DonHadler);
	
}
function getProductJSP_DonHadler( data, textStatus, jqXHR){
	
	
	$("#productDetail").html(data);
	
	//用fancybox來顯示
	$.fancybox.open({
		src  : '#productDetail',
		type : 'inline',
		opts : {
			afterShow : function( instance, current ) {
				console.info( 'done!' );
			}
		}
	});
}
</script>
</head>
<body>
	<div id="productDetail"> </div>
	 <div class="divBG">
	 	<a href="#" id="gotop" title="Go To Top" data-tracking="nav,jump,top">
   					<i class="gototop"></i></a>	
	 	<jsp:include page="/subviews/header.jsp" />
	    	<%
	    		
	    		ProductSelectService service =new ProductSelectService();
	    		List<Product> list =service.getBOX("yes");
	    	%>
	    	
	    	<%
	    	String search = request.getParameter("search");
	    	 service= new ProductSelectService();
	    	 list = null;
	    	if(search!=null && search.length()>0){
	    		list=service.searchProductsByName(search);
	    		
	    	}else{
	    		list =service.getBOX("yes");
	    	}
	    	
	    	%>
	    
	    	<% if(list!=null && list.size()>0) {%>
	    	
	    	<nav>
	    	<h1 style="margin-left: 100px;">交換區</h1>
	    	<% for(int i=0;i<list.size();i++) {
	    		Product p = list.get(i);
	    	%>
	    	
	    	<nav class="nav001">
	    		
	    		
	    		<a href="javascript:getProductJSP(<%=p.getId()%>)">
	    		
	    		
	    		<img class="link-button" src="image/buy/link.png"></a>
	    		
	    		<img class="byImg" src="<%=p.getPhotoUrl() %>"><br>
	    		
	    		<p>名稱:<%=p.getName()%></p><br><br>
	    	 	<p>想換:<%=p.getWantChange() %></p><br><br>
	    		<p>平台:<%=p.getHost()%></p><br><br>
	    		<p>地區:<%=p.getOrigin() %></p><br><br>
	    		
	    		<a href="buyOwner.jsp?buyIDOwner=<%=p.getOwner().getId() %>"><p>賣家:<%=p.getOwner().getName() %></a><p><br><br>
	    		
	    		
	    	
	    	</nav>
	    
	    	<%} %>
	    	
	    	
	    	
	    	<%}else{ %>
	    	<p>查無產品</p>
	    	<% }%>
	    	
	    	
	    	
	    	</nav>
	    	<footer></footer>
	 </div>
</body>
</html>