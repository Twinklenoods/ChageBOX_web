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
<title>	Owner page</title>
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
.ownerS{
position: relative;
width:30%;
left:200px;
}
.ownerS01{
position: relative;
width:80%;
left:200px;
z-index: 0;
}
</style>
 <script type="text/javascript" src="jquery.js"></script>
			<script type="text/javascript" src="js/IndexJs.js"></script>
			<script type="text/javascript" src="fancybox/jquery.fancybox.js">
			</script>
			<script type="text/javascript">
			function getProductJSP(PrductId){
					
				//同步請求
				<%--location.href="<%=request.getContextPath()%>/buyIn.jsp?buyInId="+PrductId;--%>
				//非同步GET請求
				$.ajax({
					
					url:"<%=request.getContextPath()%>/buyIn_ajax.jsp?buyInId="+PrductId,
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
				String productOwner = request.getParameter("buyIDOwner");
	    		
				ProductSelectService service =new ProductSelectService();
	    		List<Product> list =service.getUpOwner(productOwner);
				
	    	%>
	    	
	    	<% if(list!=null && list.size()>0) {%>
	    	
	    	
	    	<nav >
	    	<div class="ownerS">
	    	<% Product c = list.get(0);%>
	    	<h1 style="width: 50%;"><%=c.getOwner().getName() %>的賣場</h1>
	    	</div>
	    	<% if(list!=null && list.size()>0) {%>
	    	
	    	<div class="ownerS01">
	    	<iframe src="ownerBy/ownerLister.jsp?buyIDOwner=<%=c.getOwner().getId() %>" name="a"  target="a"style="width: 40%;height: 400px;margin-top: 100px;background-color:rgba(250, 50, 50, 0.6);"></iframe>
	    	<iframe src="ownerBy/ownerQA.jsp?buyIDOwner=<%=c.getOwner().getId() %>" name="a"  target="a"style="width: 40%;height: 400px;margin-top: 100px;"></iframe>
	    	</div>
	    	<%} %>
			<% for(int i=0;i<list.size();i++) {
	    		Product p = list.get(i);
	    	%>
	    	
	    	<nav class="nav001">
	    	<a href="javascript:getProductJSP(<%=p.getId()%>)">
	    		
	    		<img class="link-button" src="image/buy/link.png"></a>
	    		
	    		<img class="byImg" src="<%=p.getPhotoUrl() %>"><br>
	    		
	    		<p>名稱:<%=p.getName()%></p><br><br>
	    	 	<p>價錢:<%=(int)p.getUnitPrice()%></p><br><br>
	    		<p>平台:<%=p.getHost()%></p><br><br>
	    		<p>地區:<%=p.getOrigin() %></p><br><br>
	    		<p><br><br>
	    		
	    		
	    	
	    	</nav>
	    
	    	<%} %>
	    	
	    	
	    	
	    	<%}else{ %>
	    	<p>查無產品</p>
	    	<% }%>
	    	
	    	</nav>
	    	 </div>
</body>
</html>