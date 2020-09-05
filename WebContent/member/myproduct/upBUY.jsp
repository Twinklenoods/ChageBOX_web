<%@page import="javafx.scene.control.ListCellBuilder"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>

<head>
<style>
.eventbtn {
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font-family: Arial;
	color: #ffffff;
	font-size: 14px;
	background: #f49300;
	padding: 5px 10px 5px 10px;
	text-decoration: none;
	border: solid #fff 0px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .26);
	outline: none;
	cursor: pointer;
}

.eventbtn:hover {
	background: #e9402f;
	text-decoration: none;
}

.tags {
	list-style: none;
	margin: 0;
	overflow: hidden;
	padding: 0;
}

.tags li {
	float: left;
}

.tag_c {
	background: #0095f5;
	border-radius: 3px 0 0 3px;
	color: #ffffff;
	display: inline-block;
	height: 20px;
	line-height: 20px;
	padding: 0 20px 0 23px;
	position: relative;
	margin: 0 10px 10px 0;
	text-decoration: none;
}

.tag_c::before {
	background: #fff;
	border-radius: 10px;
	box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
	content: '';
	height: 6px;
	left: 10px;
	position: absolute;
	width: 6px;
	top: 7px;
}

.tag_c::after {
	background: #fff;
	border-bottom: 10px solid transparent;
	border-left: 7px solid #0095f5;
	border-top: 10px solid transparent;
	content: '';
	position: absolute;
	right: 0;
	top: 0;
}

.tag_c:hover {
	background-color: #cccccc;
	color: #333333;
}

.tag_c:hover::after {
	border-left-color: #cccccc;
}

a.tag_c:link {
	color: #ffffff;
}

a.tag_c:visited {
	color: #ffffff;
}

.tag_r {
	background: #f49300;
	border-radius: 3px 0 0 3px;
	color: #fff;
	display: inline-block;
	height: 20px;
	line-height: 20px;
	padding: 0 20px 0 23px;
	position: relative;
	margin: 0 10px 10px 0;
	text-decoration: none;
	-webkit-transition: color 0.2s;
}

.tag_r::before {
	background: #fff;
	border-radius: 10px;
	box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
	content: '';
	height: 6px;
	left: 10px;
	position: absolute;
	width: 6px;
	top: 7px;
}

.tag_r::after {
	background: #fff;
	border-bottom: 10px solid transparent;
	border-left: 7px solid #f49300;
	border-top: 10px solid transparent;
	content: '';
	position: absolute;
	right: 0;
	top: 0;
}

.tag_r:hover {
	background-color: #cccccc;
	color: #333333;
}

.tag_r:hover::after {
	border-left-color: #cccccc;
}

a.tag_r:link {
	color: #ffffff;
}

a.tag_r:visited {
	color: #ffffff;
}

.tag_t {
	background: #a41837;
	border-radius: 3px 0 0 3px;
	color: #fff;
	display: inline-block;
	height: 20px;
	line-height: 20px;
	padding: 0 20px 0 23px;
	position: relative;
	margin: 0 10px 10px 0;
	text-decoration: none;
	-webkit-transition: color 0.2s;
}

.tag_t::before {
	background: #fff;
	border-radius: 10px;
	box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
	content: '';
	height: 6px;
	left: 10px;
	position: absolute;
	width: 6px;
	top: 7px;
}

.tag_t::after {
	background: #fff;
	border-bottom: 10px solid transparent;
	border-left: 7px solid #a41837;
	border-top: 10px solid transparent;
	content: '';
	position: absolute;
	right: 0;
	top: 0;
}

.tag_t:hover {
	background-color: #cccccc;
	color: #333333;
}

.tag_t:hover::after {
	border-left-color: #cccccc;
}

a.tag_t:link {
	color: #ffffff;
}

a.tag_t:visited {
	color: #ffffff;
}

.tag_b {
	background: #999999;
	border-radius: 3px 0 0 3px;
	color: #fff;
	display: inline-block;
	height: 20px;
	line-height: 20px;
	padding: 0 20px 0 23px;
	position: relative;
	margin: 0 0 10px 0;
	text-decoration: none;
	-webkit-transition: color 0.2s;
}

.tag_b::before {
	background: #fff;
	border-radius: 10px;
	box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
	content: '';
	height: 6px;
	left: 10px;
	position: absolute;
	width: 6px;
	top: 7px;
}

.tag_b::after {
	background: #fff;
	border-bottom: 10px solid transparent;
	border-left: 7px solid #999999;
	border-top: 10px solid transparent;
	content: '';
	position: absolute;
	right: 0;
	top: 0;
}

.tag_b:hover {
	background-color: #eeeeee;
	color: #333333;
}

.tag_b:hover::after {
	border-left-color: #eeeeee;
}

.product_divlist {
	width: 770px;
	height: 200px;
	padding: 5px;
	margin: 5px;
	margin-bottom: 10px;
	vertical-align: top;
	background: #ffffff;
	border: 1px #ffffff solid;
	overflow: hidden;
	box-shadow: 0 1px 2px #c9cccd;
}

.product_divlistright {
	display: inline-block;
	width: 580px;
	height: 160px;
	margin-left: 10px;
}

.product_img {
	width: 175px;
	height: 130px;
	background: #eeeeee;
	vertical-align: top;
	overflow: hidden;
}

.product_img img {
	width: 175px;
	border: 0px;
}

.product_imglist {
	display: inline-block;
	width: 175px;
	height: 230px;
	
	vertical-align: top;
	overflow: hidden;
}

.product_imglist img {
	width: 100%;
	border: 0px;
}

.product_imglist2 {
	display: inline-block;
	width: 160px;
	height: 130px;
	background: #eeeeee;
	vertical-align: top;
	overflow: hidden;
}

.product_imglist2 img {
	width: 160px;
	border: 0px;
}

.product_div_title {
	width: 175px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	margin-bottom: 5px;
	overflow: hidden;
}

.product_divlist_title {
	width: 570px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	margin: 5px 0px;
	overflow: hidden;
}

.product_divlist_title .left {
	width: 400px;
	display: inline-block;
	text-align: left;
}

.product_divlist_title .right {
	width: 170px;
	display: inline-block;
	text-align: right;
}

.product_div_item {
	width: 160px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	overflow: hidden;
}

.product_divlist_item {
	width: 670px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	overflow: hidden;
}

.product_divlist_item .left {
	width: 60%;
	display: inline-block;
	text-align: left;
}

.product_divlist_item .right {
	width: 50%;
	display: inline-block;
	text-align: right;
}

.product_div_tag {
	float: right;
	background: #f49300;
	color: #ffffff;
	padding: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

.wc_product_divlist {
	width: 770px;
	height: 160px;
	padding: 5px;
	margin: 5px;
	margin-bottom: 10px;
	vertical-align: top;
	background: #ffffff;
	border-bottom: 1px #cccccc solid;
	overflow: hidden;
}

.wc_product_divlist_title {
	width: 580px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	margin: 5px 0px;
	overflow: hidden;
}

.wc_product_divlistright {
	display: inline-block;
	width: 580px;
	height: 160px;
	margin-left: 10px;
}

.wc_product_divlist_item {
	width: 580px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	overflow: hidden;
}

.wc_product_divlist_head {
	display: inline-block;
	width: 580px;
	height: 70px;
	padding-top: 10px;
	text-align: left;
	overflow: hidden;
}

.wc_product_divlist_account {
	display: inline-block;
	height: 70px;
	padding-left: 10px;
	vertical-align: top;
	line-height: 28px;
}

.wc_product_divlist_agree {
	display: inline-block;
	margin-left: 40px;
	height: 40px;
	padding-left: 10px;
	vertical-align: top;
	line-height: 28px;
}
p{color: white;}
.updown{display: none;}
</style>

  
    
    
    

    <script type="text/javascript">
    function product_updown_dmark(){

    	//var nnpage = $('#nnpage').val();
    	///var nnc = $('#nnc').val();
    	//var nnp = $('#nnp').val();
    	//var nnm = $('#nnm').val();
    	//var durl_param = 'page='+nnpage+'&c='+nnc+'&p='+nnp+'&m='+nnm;
    	
    		if(confirm("是否確定物品上架？")){

    			jQuery.ajax({
    				
    				type: "POST",	
    				
    				cache: false,
    				error: function(xhr) {
    				  alert("連線出現問題！請重試！");
    				}
    				
    			});
    		}
    	
    }
     	
	    <% 	if("POST".equalsIgnoreCase(request.getMethod())) { %>
	$(fieldRepopulate); //$() 等同與$(document).ready(...)
	function fieldRepopulate(){					
	//alert('fieldRepopulate');
	$("#productId").val('<%= request.getParameter("productId")%>');
	$("#owner").val('<%= request.getParameter("owner")%>'); 
	$("#updown").val('<%= request.getParameter("updown")%>'); 
}

<%}%>
</script>
<title>上架</title>
</head>


<body  bgproperties=fixed>
<h1 style="margin-top: -10px;margin-left: 20px;color: white;">買賣區</h1>
	<%Customer member=(Customer)session.getAttribute("member");%>
			
			<%//取ProductSelectService
	    		ProductSelectService service =new ProductSelectService();
			List<Product> list1 =service.getdownBUY(member!=null?member.getId():"");
    		List<Product> list =service.getupBUY(member!=null?member.getId():"");
	    	%>
	<div style="height: 30px; width: 100%; margin-bottom: 10px; text-align: right;">
		<input style="position: relative;right:15px;" type="button" value="未上架 (<%=list1.size() %>)" class="adminbtn2"
			onclick= "location.href='buy.jsp'"> <input  style="position: relative;right:15px;" type="button"
			value="已上架 (<%=list.size() %>)" class="adminbtn2"
			onclick="location.href='upBUY.jsp'"> 
			
	
	    	<% if(list!=null && list.size()>0) {%>
	
			
			<% for(int i=0;i<list.size();i++) {
	    		Product p = list.get(i);
	    	%>
		<div id="prodlistid1" class="product_divlist">
			<div class="product_imglist">
				<img
					src="<%=p.getPhotoUrl() %>"
					border=0>
			</div>
			<div class="product_divlistright">
				<div class="product_divlist_title f18" style="height: 48px;">
					<div class="left">
							
							<span style="color: black;"><%=p.getName()%></span>
					</div>
					
					<div class="right f14">
						
						
						<form method="post" action="updownBUY.do" style="width: 0px;height: 0px;">	
					<div class="updown">
						<input id="owner" name="owner" type="text" value="<%= p.getOwner().getId()%>">
						<input id="productId" name="productId" type="text" value="<%= p.getId() %>">
						<input id="updown" name="updown" type="text" value="no" style="position: relative;top:27px; left:-113px;">
					</div>
						<input type="submit" value="下架" class="eventbtn" onclick="return(confirm('確認是否下架?'))">&nbsp;
						</form>
						
						
						<form style="width: 0px;height: 0px;">	
						<a href="buyIn.jsp?downIn=<%= p.getId() %>"style="position: relative;top:0px; left:63px;">	
						<input type="button" value="修改" class="eventbtn" style="position: relative;top:0px; left:0px;">&nbsp;
						</a>
						</form>	
									
							
					</div>
				</div>
				<div class="product_divlist_item f14">
					<div class="left">
						<a href="/change/Detail.php?pid=4249614" class="tag_c">交換</a><a
							href="/trade/Detail.php?pid=4249614" class="tag_t">買賣</a>
					</div>
				</div>
				<div class="product_divlist_item f14">價錢:&nbsp;&#10217;&nbsp;<%=p.getUnitPrice()%></div>
				<div class="product_divlist_item f14">
					<div class="left">所在地&nbsp;&#10217;&nbsp;<%=p.getOrigin() %></div>
				</div>
				<%if(p.getBuy()!="yes") {%>
				<div class="product_divlist_item f14 left" style="display:none;">
				
				價錢:<%=p.getUnitPrice()%>
				
				</div>
				<%}else{ %>
				<div class="product_divlist_item f14 left">
				價錢:<%=p.getUnitPrice()%></div>
				<%}%>
				<div class="product_divlist_item f14 left">
				上架時間<%=p.getCreateTime() %>
				</div>
				<div class="product_divlist_item f14 left">
				<%=p.getOwner().getName() %>
				</div>
				
			</div>
		</div>
		
		<%} %>
	    	
	    	
	    	
	    	<%}else{ %>
	    	<p>查無產品</p>
	    	<% }%>
		
	</div>
</body>
</html>

