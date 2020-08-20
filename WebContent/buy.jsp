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
	margin: 50px;
}

footer{
position: relative;
top:0px;
}

.nav001{
		
		height: 330px;
		width:210px;
		background: black;
		float: left;
		margin: 5px  0 10px 5px;
		border: 1px double red;
}
.nav001 p{
		color: white;
		text-align: left;
		text-align: center;
		text-align: right;
		text-align: justify;
		margin: 10px  0 5px 5px;
	}
	
.nav001 img{
		width: 90%;
		
		background: dark red;
		padding: 2px;
		border: 2px solid  red;
		margin: 3% 3% 0 3%;
		
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
	    	<%
	    		
	    		ProductSelectService service =new ProductSelectService();
	    		List<Product> list =service.getUpdown("yes");
	    	%>
	    	
	    	<%
	    	String search = request.getParameter("search");
	    	 service= new ProductSelectService();
	    	 list = null;
	    	if(search!=null && search.length()>0){
	    		list=service.searchProductsByName(search);
	    		
	    	}else{
	    		list =service.getUpdown("yes");
	    	}
	    	
	    	%>
	    	<% if(list!=null && list.size()>0) {%>
	    	
	    	<nav>
	    	<% for(int i=0;i<list.size();i++) {
	    		Product p = list.get(i);
	    	%>
	    	
	    	<nav class="nav001" '>
	    		<a href="buyIn.jsp?buyINId=<%= p.getId() %>">
	    	 	<img src="<%=p.getPhotoUrl() %>"></a><br>
	    	 	<p>名稱:<%=p.getName()%></p>
	    	 	<p>價錢:<%=(int)p.getUnitPrice()%></p>
	    		<p>平台:<%=p.getHost()%></p>
	    		<p>地區:<%=p.getOrigin() %></p>
	    		<p>賣家:<%=p.getOwnerN() %>
	    		
	    	
	    	
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